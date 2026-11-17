// Generates the app icon (Android, iOS, web) from code: a tilted cream
// board with a glossy jelly-block heart on a sunset sky with sparkles.
// Run from the project root: dart run tool/generate_icon.dart
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

typedef _Col = (double, double, double);

_Col _hex(int v) =>
    (((v >> 16) & 255) / 255, ((v >> 8) & 255) / 255, (v & 255) / 255);

_Col _mix(_Col a, _Col b, double t) => (
  a.$1 + (b.$1 - a.$1) * t,
  a.$2 + (b.$2 - a.$2) * t,
  a.$3 + (b.$3 - a.$3) * t,
);

// Same palette as AppColors (lib/app/theme.dart).
final _skyTop = _hex(0x3B0764);
final _skyMiddle = _hex(0xBE185D);
final _skyBottom = _hex(0xFB923C);
final _blockTop = _hex(0x2563EB);
final _block = _hex(0x1E3A8A);
final _blockShadow = _hex(0x172554);
final _blockShine = _hex(0x93C5FD);
final _board = _hex(0xF8FAFF);
final _boardBottom = _hex(0xE8EEFF);
final _boardEdge = _hex(0xA5B4FC);
final _emptyCell = _hex(0xE6ECF8);
final _cross = _hex(0x94A3B8);
final _white = _hex(0xFFFFFF);
final _warm = _hex(0xFFE4E6);
final _goldLight = _hex(0xFDE68A);
final _black = _hex(0x000000);

const _picture = ['.#.#.', '#####', '#####', '.###.', '..#..'];
const _crosses = {(0, 0), (0, 2), (4, 4)};

const _side = 0.70; // board side in icon units
const _tilt = -7 * pi / 180;

/// One pixel, premultiplied alpha.
final class _Px {
  double r = 0;
  double g = 0;
  double b = 0;
  double a = 0;

  void over(_Col c, double alpha) {
    if (alpha <= 0) return;
    final k = 1 - alpha;
    r = c.$1 * alpha + r * k;
    g = c.$2 * alpha + g * k;
    b = c.$3 * alpha + b * k;
    a = alpha + a * k;
  }
}

/// Signed distance to a rounded box of half size [hx] x [hy].
double _box(double x, double y, double hx, double hy, double radius) {
  final qx = x.abs() - hx + radius;
  final qy = y.abs() - hy + radius;
  final ox = max(qx, 0);
  final oy = max(qy, 0);
  return sqrt(ox * ox + oy * oy) + min(max(qx, qy), 0) - radius;
}

double _segment(
  double px,
  double py,
  double ax,
  double ay,
  double bx,
  double by,
) {
  final dx = bx - ax;
  final dy = by - ay;
  final t = (((px - ax) * dx + (py - ay) * dy) / (dx * dx + dy * dy)).clamp(
    0.0,
    1.0,
  );
  final x = px - ax - dx * t;
  final y = py - ay - dy * t;
  return sqrt(x * x + y * y);
}

/// Anti-aliased coverage of a shape at signed distance [d].
double _cover(double d, double aa) => (0.5 - d / aa).clamp(0.0, 1.0);

double _smooth(double e0, double e1, double x) {
  final t = ((x - e0) / (e1 - e0)).clamp(0.0, 1.0);
  return t * t * (3 - 2 * t);
}

/// Four-pointed twinkle with a soft halo.
void _sparkle(
  _Px px,
  double u,
  double v,
  double cx,
  double cy,
  double r,
  _Col color,
  double aa,
) {
  final dx = (u - cx).abs() / r;
  final dy = (v - cy).abs() / r;
  if (dx > 2 || dy > 2) return;
  px.over(color, 0.35 * exp(-(dx * dx + dy * dy) / 0.12));
  final f = sqrt(dx) + sqrt(dy);
  px.over(color, ((1 - f) * r / (2.5 * aa) + 0.5).clamp(0.0, 1.0));
}

void _background(_Px px, double u, double v, double aa) {
  final t = (0.8 * v + 0.2 * u).clamp(0.0, 1.0);
  px.over(
    t < 0.55
        ? _mix(_skyTop, _skyMiddle, t / 0.55)
        : _mix(_skyMiddle, _skyBottom, (t - 0.55) / 0.45),
    1,
  );
  // Warm glow behind the board.
  final gx = u - 0.5;
  final gy = v - 0.45;
  px.over(_warm, 0.38 * exp(-(gx * gx + gy * gy) / 0.09));
  // Soft bokeh circles.
  for (final (cx, cy, r, alpha) in const [
    (0.1, 0.32, 0.09, 0.10),
    (0.9, 0.6, 0.12, 0.08),
    (0.28, 0.93, 0.07, 0.12),
    (0.74, 0.07, 0.06, 0.12),
  ]) {
    final d = sqrt((u - cx) * (u - cx) + (v - cy) * (v - cy)) - r;
    px.over(_white, alpha * _cover(d, aa));
  }
  _sparkle(px, u, v, 0.13, 0.15, 0.06, _white, aa);
  _sparkle(px, u, v, 0.1, 0.83, 0.045, _goldLight, aa);
  _sparkle(px, u, v, 0.9, 0.9, 0.035, _white, aa);
}

void _foreground(_Px px, double u, double v, double aa) {
  // Board-local coordinates (the board is tilted around the centre).
  final c = cos(-_tilt);
  final s = sin(-_tilt);
  (double, double) local(double dx, double dy) =>
      (dx * c - dy * s, dx * s + dy * c);

  const half = _side / 2;
  const radius = 0.12 * _side;
  final dx = u - 0.5;
  final dy = v - 0.5;

  // Drop shadow and the board's thickness, both straight down on screen.
  final (sx, sy) = local(dx, dy - 0.06 * _side);
  final shadow = _box(sx, sy, half, half, radius);
  px.over(_black, 0.38 * (1 - _smooth(-0.04, 0.07, shadow)));
  final (ex, ey) = local(dx, dy - 0.035 * _side);
  px.over(_boardEdge, _cover(_box(ex, ey, half, half, radius), aa));

  final (x, y) = local(dx, dy);
  final face = _cover(_box(x, y, half, half, radius), aa);
  if (face <= 0) return;
  px.over(_mix(_board, _boardBottom, (y / _side + 0.5).clamp(0.0, 1.0)), face);

  // Nearest grid cell.
  const pad = 0.075 * _side;
  const gap = 0.028 * _side;
  const cell = (_side - 2 * pad - 4 * gap) / 5;
  const pitch = cell + gap;
  final col = ((x + half - pad - cell / 2) / pitch).round().clamp(0, 4);
  final row = ((y + half - pad - cell / 2) / pitch).round().clamp(0, 4);
  final lx = x - (-half + pad + col * pitch + cell / 2);
  final ly = y - (-half + pad + row * pitch + cell / 2);
  const h = cell / 2;

  if (_picture[row][col] != '#') {
    px.over(_emptyCell, _cover(_box(lx, ly, h, h, 0.2 * cell), aa));
    if (_crosses.contains((row, col))) {
      const a = 0.2 * cell;
      final d =
          min(
            _segment(lx, ly, -a, -a, a, a),
            _segment(lx, ly, -a, a, a, -a),
          ) -
          0.06 * cell;
      px.over(_cross, _cover(d, aa));
    }
    return;
  }

  // Jelly block: dark lip, glossy body, shine band and a sparkle dot.
  px.over(_blockShadow, _cover(_box(lx, ly, h, h, 0.22 * cell), aa));
  const lip = 0.11 * cell;
  final body = _cover(_box(lx, ly + lip / 2, h, h - lip / 2, 0.22 * cell), aa);
  px.over(_mix(_blockTop, _block, (ly / cell + 0.5).clamp(0.0, 1.0)), body);
  final shine = _box(
    lx + 0.06 * cell,
    ly + 0.26 * cell,
    0.27 * cell,
    0.075 * cell,
    0.075 * cell,
  );
  px.over(_blockShine, 0.85 * _cover(shine, aa));
  final dot =
      sqrt(pow(lx - 0.27 * cell, 2) + pow(ly + 0.27 * cell, 2)) - 0.055 * cell;
  px.over(_white, 0.95 * _cover(dot, aa));
}

/// Renders a [size] x [size] RGBA image. [zoom] < 1 shrinks the scene
/// (adaptive/maskable icons keep it inside the safe zone); [corner] masks
/// the image to a rounded square inset by [margin].
Uint8List _render(
  int size, {
  bool background = true,
  bool foreground = true,
  double zoom = 1,
  double? corner,
  double margin = 0,
}) {
  final out = Uint8List(size * size * 4);
  final aa = 1 / (size * zoom);
  final px = _Px();
  for (var j = 0; j < size; j++) {
    for (var i = 0; i < size; i++) {
      px
        ..r = 0
        ..g = 0
        ..b = 0
        ..a = 0;
      final su = (i + 0.5) / size;
      final sv = (j + 0.5) / size;
      final u = 0.5 + (su - 0.5) / zoom;
      final v = 0.5 + (sv - 0.5) / zoom;
      if (background) _background(px, u, v, aa);
      if (foreground) _foreground(px, u, v, aa);
      var mask = 1.0;
      if (corner != null) {
        final half = 0.5 - margin;
        mask = _cover(_box(su - 0.5, sv - 0.5, half, half, corner), 1 / size);
      }
      final a = px.a * mask;
      final k = i * 4 + j * size * 4;
      if (a > 0) {
        out[k] = (px.r / px.a * 255).round().clamp(0, 255);
        out[k + 1] = (px.g / px.a * 255).round().clamp(0, 255);
        out[k + 2] = (px.b / px.a * 255).round().clamp(0, 255);
      }
      out[k + 3] = (a * 255).round().clamp(0, 255);
    }
  }
  return out;
}

final _crcTable = List<int>.generate(256, (n) {
  var c = n;
  for (var k = 0; k < 8; k++) {
    c = c & 1 != 0 ? 0xEDB88320 ^ (c >> 1) : c >> 1;
  }
  return c;
});

int _crc(List<int> bytes) {
  var c = 0xFFFFFFFF;
  for (final b in bytes) {
    c = _crcTable[(c ^ b) & 255] ^ (c >> 8);
  }
  return c ^ 0xFFFFFFFF;
}

/// Encodes RGBA [pixels] as PNG; drops the alpha channel when [alpha] is
/// false (iOS rejects app icons with transparency).
Uint8List _png(int size, Uint8List pixels, {bool alpha = true}) {
  final channels = alpha ? 4 : 3;
  final raw = BytesBuilder();
  for (var j = 0; j < size; j++) {
    raw.addByte(0);
    for (var i = 0; i < size; i++) {
      final k = (j * size + i) * 4;
      raw.add(pixels.sublist(k, k + channels));
    }
  }
  final out = BytesBuilder()
    ..add(const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]);
  void chunk(String type, List<int> data) {
    final body = [...type.codeUnits, ...data];
    out
      ..add((ByteData(4)..setUint32(0, data.length)).buffer.asUint8List())
      ..add(body)
      ..add((ByteData(4)..setUint32(0, _crc(body))).buffer.asUint8List());
  }

  chunk(
    'IHDR',
    (ByteData(13)
          ..setUint32(0, size)
          ..setUint32(4, size)
          ..setUint8(8, 8)
          ..setUint8(9, alpha ? 6 : 2))
        .buffer
        .asUint8List(),
  );
  chunk('IDAT', ZLibCodec(level: 9).encode(raw.takeBytes()));
  chunk('IEND', const []);
  return out.takeBytes();
}

void _write(String path, int size, Uint8List pixels, {bool alpha = true}) {
  File(path)
    ..createSync(recursive: true)
    ..writeAsBytesSync(_png(size, pixels, alpha: alpha));
  stdout.writeln('$path ($size px)');
}

/// Adaptive icon layers show the middle 72 of 108 dp and launchers mask a
/// 66 dp circle; this zoom keeps the tilted board inside it.
const _adaptiveZoom = 0.64;

void main() {
  const res = 'android/app/src/main/res';
  const densities = {
    'mdpi': 1.0,
    'hdpi': 1.5,
    'xhdpi': 2.0,
    'xxhdpi': 3.0,
    'xxxhdpi': 4.0,
  };
  for (final MapEntry(key: name, value: scale) in densities.entries) {
    final legacy = (48 * scale).round();
    _write(
      '$res/mipmap-$name/ic_launcher.png',
      legacy,
      _render(legacy, corner: 0.2, margin: 0.04),
    );
    final layer = (108 * scale).round();
    _write(
      '$res/mipmap-$name/ic_launcher_foreground.png',
      layer,
      _render(layer, background: false, zoom: _adaptiveZoom),
    );
    _write(
      '$res/mipmap-$name/ic_launcher_background.png',
      layer,
      _render(layer, foreground: false, zoom: _adaptiveZoom),
    );
  }
  File('$res/mipmap-anydpi-v26/ic_launcher.xml')
    ..createSync(recursive: true)
    ..writeAsStringSync('''
<?xml version="1.0" encoding="utf-8"?>
<!-- Generated by tool/generate_icon.dart -->
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@mipmap/ic_launcher_background" />
    <foreground android:drawable="@mipmap/ic_launcher_foreground" />
</adaptive-icon>
''');

  const ios = 'ios/Runner/Assets.xcassets/AppIcon.appiconset';
  const iosIcons = {
    '20x20@1x': 20,
    '20x20@2x': 40,
    '20x20@3x': 60,
    '29x29@1x': 29,
    '29x29@2x': 58,
    '29x29@3x': 87,
    '40x40@1x': 40,
    '40x40@2x': 80,
    '40x40@3x': 120,
    '60x60@2x': 120,
    '60x60@3x': 180,
    '76x76@1x': 76,
    '76x76@2x': 152,
    '83.5x83.5@2x': 167,
    '1024x1024@1x': 1024,
  };
  for (final MapEntry(key: name, value: size) in iosIcons.entries) {
    _write('$ios/Icon-App-$name.png', size, _render(size), alpha: false);
  }

  for (final size in [192, 512]) {
    _write(
      'web/icons/Icon-$size.png',
      size,
      _render(size, corner: 0.2, margin: 0.04),
    );
    _write(
      'web/icons/Icon-maskable-$size.png',
      size,
      _render(size, zoom: 0.8),
      alpha: false,
    );
  }
  _write('web/favicon.png', 16, _render(16, corner: 0.2));
}
