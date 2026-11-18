"""Builds the bundled Fredoka fonts in assets/fonts/.

Fredoka has no precomposed ş, ğ, İ, ą, ș, ... but it does have the combining
marks (U+0327, U+0306, ...). HarfBuzz therefore decomposes ş into s + U+0327
and draws it with Fredoka instead of falling back to Nunito. Fredoka has no
mark attachment for Latin, so the zero-width mark lands after the letter
("bos,kareye").

This script downloads the static Fredoka weights that google_fonts used and
adds the missing accented Latin letters as composites of Fredoka's own base
letter and mark, with the mark placed the way Fredoka places it in its own
composites (Á, Š, Ç): centred on the letter, raised 200 units for capitals.
It then removes the combining marks from the cmap, so any letter that still
has no glyph (for example Vietnamese ấ, ơ) falls back to Nunito as a whole
instead of being drawn in pieces.

Usage: python tool/make_fredoka.py
"""

import unicodedata
import urllib.request
from io import BytesIO

from fontTools.pens.boundsPen import BoundsPen
from fontTools.ttLib import TTFont
from fontTools.ttLib.tables._g_l_y_f import Glyph, GlyphComponent

# Static Fredoka files served to google_fonts 8.x (sha256 = file name).
SOURCES = {
    400: "2a5db7832feb3b8261603fc01e4411601c9b08d4107d3ddacc6b1a1b24a98078",
    500: "f33d2fcedde5d0920682170e6088df9501bab260f84d94213b0e0388d5586fa6",
    600: "241f09c2822f1cde8677dc18da3fc2b9f35e87926f3fe4fd687538098f5d55fa",
    700: "fb87f9cd22fc2af57c25c381f17d470f7d7ab40e19f51975b6c5b069051718d3",
}
URL = "https://fonts.gstatic.com/s/a/{}.ttf"

# Combining mark -> Fredoka glyph. Comma and dot below are built from the
# comma and dot accent glyphs, which Fredoka does have.
TOP_MARKS = {
    0x0300: "gravecomb",
    0x0301: "acutecomb",
    0x0302: "uni0302",
    0x0303: "tildecomb",
    0x0304: "uni0304",
    0x0306: "uni0306",
    0x0307: "uni0307",
    0x0308: "uni0308",
    0x030A: "uni030A",
    0x030B: "uni030B",
    0x030C: "uni030C",
}
CEDILLA, OGONEK, COMMA_BELOW, DOT_BELOW = 0x0327, 0x0328, 0x0326, 0x0323

# Letters to add: Latin-1, Latin Extended-A, Romanian comma-below letters
# and Latin Extended Additional (Vietnamese single-mark letters).
RANGES = [
    (0x00C0, 0x017F),
    (0x0218, 0x021B),
    (0x1E00, 0x1EFF),
]

CAP_RAISE = 200  # Fredoka's own capital composites raise marks by 200.
X_HEIGHT_TOP = 500  # Top of x-height letters; marks are drawn for them.
BELOW_GAP = 40  # Space between the baseline and a comma/dot below.
COMMA_BELOW_SCALE = 0.75


def bounds(font, name):
    glyph_set = font.getGlyphSet()
    pen = BoundsPen(glyph_set)
    glyph_set[name].draw(pen)
    return pen.bounds


def component(name, x, y, scale=None):
    c = GlyphComponent()
    c.glyphName = name
    c.x, c.y = round(x), round(y)
    c.flags = 0x4  # ROUND_XY_TO_GRID
    if scale is not None:
        c.transform = [[scale, 0], [0, scale]]
    return c


def centre(b):
    return (b[0] + b[2]) / 2


def build(font, ch, base_cp, mark_cp):
    """Returns (components, advance) for ch, or None if it can't be built."""
    cmap = font.getBestCmap()
    base = cmap.get(base_cp)
    if base is None:
        return None
    upper = chr(base_cp).isupper()
    advance = font["hmtx"][base][0]

    if mark_cp in TOP_MARKS:
        if chr(base_cp) == "i":
            base = "dotlessi"
        elif chr(base_cp) == "j":
            return None  # No dotless j in Fredoka.
        b = bounds(font, base)
        if mark_cp == 0x030C and chr(base_cp) in "dltL":
            # Czech/Slovak ď ť ľ Ľ: the caron is an apostrophe beside the stem.
            q = bounds(font, "quoteright")
            x = b[2] + 10 - q[0]
            y = (690 if upper else max(b[3], 718)) - q[3]
            return [component(base, 0, 0), component("quoteright", x, y)], max(
                advance, round(x + q[2] + 30)
            )
        mark = TOP_MARKS[mark_cp]
        m = bounds(font, mark)
        if upper:
            dy = CAP_RAISE
        else:
            dy = max(0, b[3] - X_HEIGHT_TOP)
        return [
            component(base, 0, 0),
            component(mark, centre(b) - centre(m), dy),
        ], advance

    b = bounds(font, base)
    if mark_cp == CEDILLA:
        m = bounds(font, "uni0327")
        return [
            component(base, 0, 0),
            component("uni0327", centre(b) - centre(m), 0),
        ], advance
    if mark_cp == OGONEK:
        m = bounds(font, "uni0328")
        # Hangs from the right of the letter's foot.
        return [
            component(base, 0, 0),
            component("uni0328", b[2] - m[2] - 20, 0),
        ], advance
    if mark_cp == COMMA_BELOW:
        m = bounds(font, "comma")
        s = COMMA_BELOW_SCALE
        x = centre(b) - centre(m) * s
        y = -BELOW_GAP - m[3] * s
        return [component(base, 0, 0), component("comma", x, y, s)], advance
    if mark_cp == DOT_BELOW:
        m = bounds(font, "dotaccent")
        return [
            component(base, 0, 0),
            component("dotaccent", centre(b) - centre(m), -BELOW_GAP - m[3]),
        ], advance
    return None


def process(font):
    cmap = font.getBestCmap()
    glyf = font["glyf"]
    hmtx = font["hmtx"]
    added = {}
    for lo, hi in RANGES:
        for cp in range(lo, hi + 1):
            if cp in cmap:
                continue
            parts = [ord(c) for c in unicodedata.normalize("NFD", chr(cp))]
            if len(parts) != 2:
                continue  # Stacked marks (Vietnamese ấ, ...) go to Nunito.
            built = build(font, chr(cp), parts[0], parts[1])
            if built is None:
                continue
            comps, advance = built
            name = f"uni{cp:04X}"
            g = Glyph()
            g.numberOfContours = -1
            g.components = comps
            glyf[name] = g  # Also appends name to the font's glyph order.
            hmtx[name] = (advance, 0)
            added[cp] = name
    for name in added.values():
        glyf[name].recalcBounds(glyf)
        hmtx[name] = (hmtx[name][0], glyf[name].xMin)

    # Đ is the same shape as Eth.
    if 0x0110 not in cmap:
        added[0x0110] = cmap[0x00D0]

    for table in font["cmap"].tables:
        if not table.isUnicode():
            continue
        table.cmap.update(added)
        for cp in list(table.cmap):
            if 0x0300 <= cp <= 0x036F:
                del table.cmap[cp]
    font["maxp"].recalc(font)
    return added


def rename(font):
    # Modified font: mark it so it isn't mistaken for upstream Fredoka.
    for record in font["name"].names:
        if record.nameID in (3, 5):
            record.string = record.toUnicode() + "; Pixel Bloom accents"


for weight, digest in SOURCES.items():
    with urllib.request.urlopen(URL.format(digest)) as response:
        font = TTFont(BytesIO(response.read()))
    added = process(font)
    rename(font)
    font.save(f"assets/fonts/Fredoka-{weight}.ttf")
    print(weight, len(added), "".join(chr(cp) for cp in sorted(added)))
