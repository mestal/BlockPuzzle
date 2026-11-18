"""Builds the static Nunito fallback fonts in assets/fonts/.

Fredoka (google_fonts) only covers basic Latin, so letters such as ş, ğ, İ and
Cyrillic fall back to Nunito. Flutter does not map FontWeight onto a variable
font's `wght` axis, so the variable Nunito always drew its default ExtraLight
instance. This pins one static instance per Fredoka weight, with the `wght`
chosen so Nunito's stem thickness matches Fredoka's.

Usage: python tool/make_fallback_fonts.py path/to/Nunito[wght].ttf
"""

import sys

from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont

# Flutter weight (Fredoka file) -> Nunito wght with the same stem thickness.
WEIGHTS = {400: 330, 500: 460, 600: 670, 700: 790}

for flutter_weight, wght in WEIGHTS.items():
    font = TTFont(sys.argv[1])
    instantiateVariableFont(font, {"wght": wght}, inplace=True, updateFontNames=False)
    font.save(f"assets/fonts/Nunito-{flutter_weight}.ttf")
