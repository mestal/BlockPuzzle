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
void _tick(List<double> out, double freq, {double gain = 0.5}) {
  final n = (0.09 * _rate).round();
  for (var i = 0; i < n && i < out.length; i++) {
    final t = i / _rate;
    final env = exp(-45 * t) * min(1, t / 0.0015);
    final noise = (_random.nextDouble() * 2 - 1) * exp(-300 * t) * 0.35;
    out[i] += (sin(2 * pi * freq * t) + noise) * env * gain;
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

void main() {
  final dir = Directory('assets/audio')..createSync(recursive: true);
  void save(String name, List<double> samples) =>
      File('${dir.path}/$name.wav').writeAsBytesSync(_wav(samples));

  for (var i = 0; i < _noteCount; i++) {
    final id = i.toString().padLeft(2, '0');
    // Fill: a glassy note that climbs the ladder while dragging.
    final fill = _buffer(0.34);
    _bell(fill, _ladder(i), gain: 0.7);
    save('fill_$id', fill);
    // Cross: a softer, shorter tick on the same ladder.
    final cross = _buffer(0.1);
    _tick(cross, _ladder(i, base: 392));
    save('cross_$id', cross);
  }

  // Mistake: a low falling buzz.
  final mistake = _buffer(0.32);
  for (var i = 0; i < mistake.length; i++) {
    final t = i / _rate;
    final f = 180 - 90 * t / 0.32;
    final saw = 2 * ((f * t) % 1) - 1;
    mistake[i] =
        (saw * 0.5 + sin(2 * pi * f * t) * 0.5) *
        exp(-5 * t) *
        (0.7 + 0.3 * sin(2 * pi * 28 * t)) *
        0.8;
  }
  save('mistake', mistake);

  // Line complete: a bright rising arpeggio.
  final line = _buffer(0.75);
  for (var i = 0; i < 4; i++) {
    _bell(
      line,
      _ladder(5 + i * 2 - (i == 3 ? 1 : 0)),
      start: i * 0.075,
      length: 0.5,
      gain: 0.5,
      decay: 6,
      bright: 0.45,
    );
  }
  save('line', line);

  // Level won: a short fanfare with a held chord.
  final win = _buffer(1.9);
  const notes = [0, 2, 4, 5, 7, 9];
  for (var i = 0; i < notes.length; i++) {
    _bell(
      win,
      _ladder(notes[i]),
      start: i * 0.11,
      length: 1.2,
      gain: 0.35,
      decay: 3,
      bright: 0.5,
    );
  }
  for (final n in [5, 7, 9, 10]) {
    _bell(win, _ladder(n), start: 0.7, length: 1.2, gain: 0.3, decay: 2.4);
  }
  save('win', win);

  // Hint: a twinkle.
  final hint = _buffer(0.6);
  for (var i = 0; i < 5; i++) {
    _bell(
      hint,
      _ladder(14 - i),
      start: i * 0.06,
      gain: 0.4,
      decay: 10,
    );
  }
  save('hint', hint);

  stdout.writeln('Wrote sounds to ${dir.path}');
}
