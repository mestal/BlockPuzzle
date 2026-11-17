// Generates the game's sound effects as WAV files in assets/audio/.
// Run from the project root: dart run tool/generate_sounds.dart
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

const _rate = 22050;
const _noteCount = 15;
const _pentatonic = [0, 2, 4, 7, 9];

/// Frequency of rung [i] on a major pentatonic ladder starting at C5.
double _ladder(int i, {double base = 523.25}) =>
    base * pow(2, (12 * (i ~/ 5) + _pentatonic[i % 5]) / 12);

final _random = Random(7);

/// A decaying note with a few harmonics: marimba/bell-like.
void _bell(
  List<double> out,
  double freq, {
  double start = 0,
  double length = 0.3,
  double gain = 0.6,
  double decay = 9,
  double bright = 0.3,
}) {
  final first = (start * _rate).round();
  final n = (length * _rate).round();
  for (var i = 0; i < n && first + i < out.length; i++) {
    final t = i / _rate;
    final env = exp(-decay * t) * min(1, t / 0.004);
    final w = 2 * pi * freq * t;
    final v = sin(w) + bright * sin(2 * w) * exp(-4 * t) + 0.1 * sin(3 * w + 1);
    out[first + i] += v * env * gain;
  }
}

/// A short soft wooden tick.
void _tick(
  List<double> out,
  double freq, {
  double gain = 0.5,
  double start = 0,
}) {
  final first = (start * _rate).round();
  final n = (0.09 * _rate).round();
  for (var i = 0; i < n && first + i < out.length; i++) {
    final t = i / _rate;
    final env = exp(-45 * t) * min(1, t / 0.0015);
    final noise = (_random.nextDouble() * 2 - 1) * exp(-300 * t) * 0.35;
    out[first + i] += (sin(2 * pi * freq * t) + noise) * env * gain;
  }
}

Uint8List _wav(List<double> samples) {
  var peak = 0.0;
  for (final s in samples) {
    peak = max(peak, s.abs());
  }
  final scale = peak > 0.9 ? 0.9 / peak : 1.0;
  final data = ByteData(44 + samples.length * 2);
  void text(int offset, String s) {
    for (var i = 0; i < s.length; i++) {
      data.setUint8(offset + i, s.codeUnitAt(i));
    }
  }

  text(0, 'RIFF');
  data.setUint32(4, 36 + samples.length * 2, Endian.little);
  text(8, 'WAVEfmt ');
  data
    ..setUint32(16, 16, Endian.little)
    ..setUint16(20, 1, Endian.little)
    ..setUint16(22, 1, Endian.little)
    ..setUint32(24, _rate, Endian.little)
    ..setUint32(28, _rate * 2, Endian.little)
    ..setUint16(32, 2, Endian.little)
    ..setUint16(34, 16, Endian.little);
  text(36, 'data');
  data.setUint32(40, samples.length * 2, Endian.little);
  for (var i = 0; i < samples.length; i++) {
    final v = (samples[i] * scale * 32767).round().clamp(-32768, 32767);
    data.setInt16(44 + i * 2, v, Endian.little);
  }
  return data.buffer.asUint8List();
}

List<double> _buffer(double seconds) =>
    List.filled((seconds * _rate).round(), 0);

/// Adds [taps] decaying copies of the signal, for a shimmering tail.
void _echo(List<double> out, double delay, double feedback, int taps) {
  final dry = List<double>.of(out);
  final step = (delay * _rate).round();
  for (var t = 1; t <= taps; t++) {
    final gain = pow(feedback, t).toDouble();
    for (var i = 0; i + t * step < out.length; i++) {
      out[i + t * step] += dry[i] * gain;
    }
  }
}

/// A shower of tiny high bells between [start] and [end] seconds.
void _sparkle(
  List<double> out,
  double start,
  double end,
  int count, {
  double gain = 0.2,
}) {
  for (var i = 0; i < count; i++) {
    final at = start + _random.nextDouble() * (end - start);
    final note = 9 + _random.nextInt(6);
    _bell(
      out,
      _ladder(note),
      start: at,
      length: 0.2,
      gain: gain * (0.5 + _random.nextDouble() * 0.5),
      decay: 18,
      bright: 0.6,
    );
  }
}

/// A rising (or falling) glide with a little air.
void _sweep(
  List<double> out,
  double start,
  double length,
  double f0,
  double f1, {
  double gain = 0.3,
}) {
  final first = (start * _rate).round();
  final n = (length * _rate).round();
  var phase = 0.0;
  for (var i = 0; i < n && first + i < out.length; i++) {
    final k = i / n;
    final f = f0 * pow(f1 / f0, k);
    phase += 2 * pi * f / _rate;
    final env = sin(pi * k) * gain;
    final air = (_random.nextDouble() * 2 - 1) * 0.15;
    out[first + i] += (sin(phase) + 0.4 * sin(2 * phase) + air) * env;
  }
}

/// Frequency [semitones] above C5.
double _note(num semitones) => 523.25 * pow(2, semitones / 12);

/// A bright brass-like note: stacked harmonics, soft attack, light vibrato.
void _brass(
  List<double> out,
  double freq, {
  double start = 0,
  double length = 0.4,
  double gain = 0.3,
  double decay = 2,
}) {
  final first = (start * _rate).round();
  final n = (length * _rate).round();
  var phase = 0.0;
  for (var i = 0; i < n && first + i < out.length; i++) {
    final t = i / _rate;
    final vibrato = 1 + 0.004 * sin(2 * pi * 5.5 * t) * min(1, t / 0.2);
    phase += 2 * pi * freq * vibrato / _rate;
    final release = min(1, (n - i) / (0.06 * _rate));
    final env = min(1, t / 0.025) * exp(-decay * t) * release;
    var v = 0.0;
    for (var k = 1; k <= 6; k++) {
      v += sin(k * phase) / k * (k == 1 ? 1 : exp(-1.5 * t));
    }
    out[first + i] += v * env * gain;
  }
}

/// A firework: a low thump followed by a crackling tail.
void _firework(List<double> out, double start, {double gain = 0.35}) {
  final first = (start * _rate).round();
  final n = (0.12 * _rate).round();
  for (var i = 0; i < n && first + i < out.length; i++) {
    final t = i / _rate;
    final noise = _random.nextDouble() * 2 - 1;
    out[first + i] +=
        (sin(2 * pi * (110 - 300 * t) * t) * 0.8 + noise * 0.5) *
        exp(-30 * t) *
        gain;
  }
  for (var c = 0; c < 14; c++) {
    final at = first + ((0.06 + _random.nextDouble() * 0.4) * _rate).round();
    final len = (0.006 * _rate).round();
    final g = gain * 0.35 * (0.4 + _random.nextDouble() * 0.6);
    for (var i = 0; i < len && at + i < out.length; i++) {
      out[at + i] += (_random.nextDouble() * 2 - 1) * g * (1 - i / len);
    }
  }
}

void main() {
  final dir = Directory('assets/audio')..createSync(recursive: true);
  void save(String name, List<double> samples) =>
      File('${dir.path}/$name.wav').writeAsBytesSync(_wav(samples));

  for (var i = 0; i < _noteCount; i++) {
    final id = i.toString().padLeft(2, '0');
    // Fill: a glassy bell with a sparkly octave on top; climbs the ladder
    // while dragging.
    final fill = _buffer(0.45);
    _bell(fill, _ladder(i), gain: 0.65, decay: 8, bright: 0.4);
    _bell(fill, _ladder(i) * 2, length: 0.18, gain: 0.18, decay: 22);
    _echo(fill, 0.07, 0.3, 2);
    save('fill_$id', fill);
    // Cross: a soft, short wooden tick on the same ladder.
    final cross = _buffer(0.1);
    _tick(cross, _ladder(i, base: 392));
    save('cross_$id', cross);
  }

  // Mistake: a cartoon "womp-womp" falling buzz.
  final mistake = _buffer(0.62);
  for (var n = 0; n < 2; n++) {
    final start = (n * 0.28 * _rate).round();
    final len = (0.28 * _rate).round();
    for (var i = 0; i < len && start + i < mistake.length; i++) {
      final t = i / _rate;
      final f = (n == 0 ? 220 : 165) - 70 * t / 0.28;
      final saw = 2 * ((f * t) % 1) - 1;
      mistake[start + i] +=
          (saw * 0.5 + sin(2 * pi * f * t) * 0.5) *
          exp(-4 * t) *
          min(1, t / 0.01) *
          (0.75 + 0.25 * sin(2 * pi * 30 * t)) *
          0.8;
    }
  }
  save('mistake', mistake);

  // Line complete: a glittering run up the ladder with an echo.
  final line = _buffer(1);
  for (var i = 0; i < 6; i++) {
    _bell(
      line,
      _ladder(5 + i),
      start: i * 0.06,
      length: 0.5,
      gain: 0.45,
      decay: 6,
      bright: 0.5,
    );
  }
  _sweep(line, 0, 0.35, 500, 2200, gain: 0.12);
  _sparkle(line, 0.3, 0.6, 5, gain: 0.15);
  _echo(line, 0.12, 0.35, 3);
  save('line', line);

  // Combo level up: a quick whoosh into a bright power chord.
  final combo = _buffer(0.9);
  _sweep(combo, 0, 0.25, 300, 1800, gain: 0.25);
  for (final n in [5, 7, 10]) {
    _bell(
      combo,
      _ladder(n),
      start: 0.22,
      length: 0.6,
      gain: 0.35,
      decay: 5,
      bright: 0.5,
    );
  }
  _sparkle(combo, 0.25, 0.55, 5, gain: 0.15);
  _echo(combo, 0.1, 0.3, 2);
  save('combo', combo);

  // Level won: a rising whoosh, a big fanfare, a held chord and fireworks.
  final win = _buffer(3);
  _sweep(win, 0, 0.5, 200, 2400, gain: 0.25);
  const fanfare = [0, 2, 4, 5, 7, 9, 10, 12];
  for (var i = 0; i < fanfare.length; i++) {
    _bell(
      win,
      _ladder(fanfare[i]),
      start: 0.2 + i * 0.1,
      length: 1,
      gain: 0.4,
      decay: 3.5,
      bright: 0.55,
    );
  }
  for (final n in [5, 7, 9, 10, 12]) {
    _bell(
      win,
      _ladder(n),
      start: 1.05,
      length: 1.8,
      gain: 0.3,
      decay: 1.8,
      bright: 0.5,
    );
  }
  _sparkle(win, 1, 2.6, 24, gain: 0.22);
  _echo(win, 0.16, 0.38, 4);
  save('win', win);

  // Hint: a twinkle falling down the ladder.
  final hint = _buffer(0.8);
  for (var i = 0; i < 5; i++) {
    _bell(hint, _ladder(14 - i), start: i * 0.06, gain: 0.4, decay: 10);
  }
  _echo(hint, 0.09, 0.3, 2);
  save('hint', hint);

  // New map unlocked: a drum-roll swell, a brass fanfare that climbs to a
  // big held chord, fireworks popping with the confetti and a sparkle rain.
  final world = _buffer(4);
  _sweep(world, 0, 0.3, 150, 900, gain: 0.18);
  for (var i = 0; i < 10; i++) {
    _tick(world, 180 + i * 12, gain: 0.25 + i * 0.03, start: i * 0.028);
  }
  // Pickup: three quick notes up the major triad.
  for (final (i, s) in [-5, 0, 4].indexed) {
    _brass(world, _note(s), start: 0.28 + i * 0.11, length: 0.13);
    _bell(world, _note(s + 12), start: 0.28 + i * 0.11, gain: 0.15);
  }
  // Landing: a held C major chord topped by the octave.
  for (final s in [-12, 0, 4, 7, 12]) {
    _brass(world, _note(s), start: 0.62, length: 0.75, gain: 0.2, decay: 1.2);
  }
  _bell(world, _note(19), start: 0.62, length: 0.8, gain: 0.3, decay: 4);
  // A lift to F major, then home again, brighter.
  for (final s in [-7, 5, 9, 12]) {
    _brass(world, _note(s), start: 1.38, length: 0.32, gain: 0.18);
  }
  for (final s in [-12, 0, 4, 7, 12, 16]) {
    _brass(world, _note(s), start: 1.72, length: 1.9, gain: 0.17, decay: 1.4);
  }
  for (var i = 0; i < 6; i++) {
    _bell(
      world,
      _note(12 + [0, 4, 7, 12, 16, 19][i]),
      start: 1.72 + i * 0.05,
      length: 1.2,
      gain: 0.22,
      decay: 3,
      bright: 0.6,
    );
  }
  for (var i = 0; i < 5; i++) {
    _firework(world, 0.25 + i * 0.2 + _random.nextDouble() * 0.04);
  }
  _sparkle(world, 1.7, 3.6, 30);
  _echo(world, 0.18, 0.35, 4);
  save('world', world);

  stdout.writeln('Wrote sounds to ${dir.path}');
}
