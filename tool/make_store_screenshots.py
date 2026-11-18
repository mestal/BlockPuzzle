"""Generates Google Play phone screenshots (1080x1920) for Pixel Bloom."""
import json, math, random, os
from PIL import Image, ImageDraw, ImageFont, ImageFilter

W, H = 1080, 1920
OUT = 'store_assets/screenshots'
os.makedirs(OUT, exist_ok=True)
PB = '/usr/share/fonts/truetype/google-fonts/Poppins-Bold.ttf'
PM = '/usr/share/fonts/truetype/google-fonts/Poppins-Medium.ttf'
CJK = '/usr/share/fonts/opentype/noto/NotoSansCJK-Bold.ttc'
def F(p, s, idx=0): return ImageFont.truetype(p, s, index=idx) if p == CJK else ImageFont.truetype(p, s)
def hx(h):
    h = h.lstrip('#'); return tuple(int(h[i:i+2], 16) for i in (0, 2, 4))

def gradient(stops, size=(W, H)):
    img = Image.new('RGB', size); d = ImageDraw.Draw(img)
    for y in range(size[1]):
        t = y / (size[1] - 1) * (len(stops) - 1)
        i = min(int(t), len(stops) - 2); f = t - i
        a, b = hx(stops[i]), hx(stops[i + 1])
        d.line([(0, y), (size[0], y)], fill=tuple(int(a[k] + (b[k] - a[k]) * f) for k in range(3)))
    return img

def shadow(img, box, r, off=14, blur=22, alpha=90):
    s = Image.new('RGBA', img.size, (0, 0, 0, 0))
    ImageDraw.Draw(s).rounded_rectangle([box[0], box[1] + off, box[2], box[3] + off], r, fill=(20, 10, 60, alpha))
    s = s.filter(ImageFilter.GaussianBlur(blur))
    img.paste(s, (0, 0), s)

def center_text(d, y, text, font, fill, cx=W // 2, stroke=0, sfill=None):
    w = d.textlength(text, font=font)
    d.text((cx - w / 2, y), text, font=font, fill=fill, stroke_width=stroke, stroke_fill=sfill)

def caption(img, l1, l2=None):
    d = ImageDraw.Draw(img)
    size = 92
    while ImageDraw.Draw(img).textlength(l1, font=F(PB, size)) > W - 80: size -= 4
    f = F(PB, size)
    center_text(d, 80, l1, f, (255, 255, 255))
    if l2: center_text(d, 190, l2, F(PB, min(size, 84)), (255, 232, 140))

def sparkles(img, n=26, seed=3, area=(0, 0, W, H)):
    rnd = random.Random(seed); d = ImageDraw.Draw(img, 'RGBA')
    for _ in range(n):
        x = rnd.randint(area[0], area[2]); y = rnd.randint(area[1], area[3]); r = rnd.randint(8, 22)
        a = rnd.randint(110, 230)
        d.polygon([(x, y - r), (x + r * .28, y - r * .28), (x + r, y), (x + r * .28, y + r * .28),
                   (x, y + r), (x - r * .28, y + r * .28), (x - r, y), (x - r * .28, y - r * .28)], fill=(255, 255, 255, a))

def clues(line):
    out, n = [], 0
    for ch in line + '.':
        if ch == '#': n += 1
        elif n: out.append(n); n = 0
    return out or [0]

def jelly(img, x, y, s, top='#2563EB', bot='#1E3A8A', glow='#93C5FD'):
    d = ImageDraw.Draw(img, 'RGBA'); r = max(5, s // 5)
    d.rounded_rectangle([x, y + 3, x + s, y + s + 3], r, fill=(23, 37, 84, 255))
    blk = gradient([top, bot], (s, s)); m = Image.new('L', (s, s), 0)
    ImageDraw.Draw(m).rounded_rectangle([0, 0, s - 1, s - 1], r, fill=255)
    img.paste(blk, (x, y), m)
    d.rounded_rectangle([x + s * .14, y + s * .1, x + s * .62, y + s * .3], r // 2, fill=(*hx(glow), 150))
    d.ellipse([x + s * .7, y + s * .16, x + s * .82, y + s * .28], fill=(255, 255, 255, 170))

def xmark(d, x, y, s, col, w=6):
    p = s * .28
    d.line([(x + p, y + p), (x + s - p, y + s - p)], fill=col, width=w)
    d.line([(x + s - p, y + p), (x + p, y + s - p)], fill=col, width=w)

def board(img, sol, state, colors=None, palette=None, x0=70, y0=490, cell=82, hl_row=None, done_rows=(), done_cols=()):
    """state[r][c]: 0 empty, 1 filled, 2 user X, 3 auto X."""
    R, C = len(sol), len(sol[0])
    rc = [clues(r) for r in sol]; cc = [clues(''.join(sol[r][c] for r in range(R))) for c in range(C)]
    lw = 150; th = 150
    bx, by = x0 + lw, y0 + th
    pw, ph = C * cell, R * cell
    panel = [x0 - 6, y0 - 6, bx + pw + 22, by + ph + 22]
    shadow(img, panel, 44)
    d = ImageDraw.Draw(img, 'RGBA')
    d.rounded_rectangle(panel, 44, fill=hx('#F8FAFF'))
    fnt = F(PB, 32)
    for c in range(C):
        done = c in done_cols
        if done: d.rounded_rectangle([bx + c * cell + 4, y0, bx + (c + 1) * cell - 4, by - 8], 12, fill=hx('#FBBF24'))
        for i, n in enumerate(reversed(cc[c])):
            tx = bx + c * cell + cell / 2; ty = by - 40 - i * 38
            t = str(n); w = d.textlength(t, font=fnt)
            d.text((tx - w / 2, ty - 18), t, font=fnt, fill=hx('#78350F') if done else hx('#1E3A8A'))
    for r in range(R):
        done = r in done_rows
        if hl_row == r: d.rounded_rectangle([x0, by + r * cell + 3, bx - 6, by + (r + 1) * cell - 3], 12, fill=hx('#FDE68A'))
        elif done: d.rounded_rectangle([x0, by + r * cell + 3, bx - 6, by + (r + 1) * cell - 3], 12, fill=hx('#FBBF24'))
        for i, n in enumerate(reversed(rc[r])):
            t = str(n); w = d.textlength(t, font=fnt)
            d.text((bx - 24 - i * 46 - w, by + r * cell + cell / 2 - 22), t, font=fnt, fill=hx('#78350F') if (done or hl_row == r) else hx('#1E3A8A'))
    for r in range(R):
        for c in range(C):
            x = bx + c * cell; y = by + r * cell
            d.rounded_rectangle([x + 4, y + 4, x + cell - 4, y + cell - 4], 14, fill=hx('#E6ECF8'))
    for r in range(R):
        for c in range(C):
            x = bx + c * cell + 4; y = by + r * cell + 4; s = cell - 8
            st = state[r][c]
            if st == 1:
                if colors:
                    col = hx(palette[colors[r][c]])
                    d.rounded_rectangle([x, y + 3, x + s, y + s + 3], 14, fill=tuple(int(v * .7) for v in col))
                    d.rounded_rectangle([x, y, x + s, y + s], 14, fill=col)
                    d.rounded_rectangle([x + s * .14, y + s * .1, x + s * .6, y + s * .28], 8, fill=(255, 255, 255, 120))
                else: jelly(img, x, y, s)
            elif st == 2: xmark(d, x, y, s, hx('#1E3A8A'), 8)
            elif st == 3: xmark(d, x, y, s, hx('#22C55E'), 5)
    for k in range(1, C // 5 + 1):
        if k * 5 < C: d.line([(bx + k * 5 * cell, by), (bx + k * 5 * cell, by + ph)], fill=(148, 163, 184, 150), width=3)
    for k in range(1, R // 5 + 1):
        if k * 5 < R: d.line([(bx, by + k * 5 * cell), (bx + pw, by + k * 5 * cell)], fill=(148, 163, 184, 150), width=3)
    return bx, by, cell

def topbar(img, level_text, hearts=5, score='1,250'):
    d = ImageDraw.Draw(img, 'RGBA')
    d.rounded_rectangle([60, 350, 400, 430], 40, fill=(255, 255, 255, 60))
    d.text((92, 364), level_text, font=F(PB, 40), fill='white')
    for i in range(5):
        cx = 650 + i * 56; col = '#EF4444' if i < hearts else (255, 255, 255, 80)
        d.ellipse([cx, 370, cx + 28, 398], fill=col); d.ellipse([cx + 20, 370, cx + 48, 398], fill=col)
        d.polygon([(cx + 2, 388), (cx + 46, 388), (cx + 24, 420)], fill=col)
    d.rounded_rectangle([770, 330, 1020, 410], 40, fill=(0, 0, 0, 0))

def pill(img, box, text, fill, fg='white', size=44):
    shadow(img, box, (box[3] - box[1]) // 2, 8, 10, 70)
    d = ImageDraw.Draw(img, 'RGBA')
    d.rounded_rectangle(box, (box[3] - box[1]) // 2, fill=fill)
    center_text(d, box[1] + (box[3] - box[1]) / 2 - size * .72, text, F(PB, size), fg, cx=(box[0] + box[2]) // 2)

lvl = json.load(open('assets/levels/level_021.json'))
sol, col, pal = lvl['solution'], lvl['colors'], lvl['palette']
R, C = len(sol), len(sol[0])
SUN = ['#4C1D95', '#BE185D', '#F97316']

def play_state(upto_row, extra_x=True):
    st = [[0] * C for _ in range(R)]
    for r in range(R):
        for c in range(C):
            if r <= upto_row:
                st[r][c] = 1 if sol[r][c] == '#' else 3
    if extra_x: st[upto_row + 2][0] = 2; st[upto_row + 2][9] = 2; st[upto_row + 3][0] = 2
    return st

# 1 gameplay
img = gradient(SUN); sparkles(img)
caption(img, 'Solve logic puzzles', 'one square at a time')
topbar(img, 'Level 21', 4)
board(img, sol, play_state(4), done_rows=range(0, 5), done_cols=[3, 4, 5, 6])
pill(img, (300, 1640, 780, 1750), 'Hint  x5', '#2563EB')
img.save(f'{OUT}/01_solve.png')

# 2 reveal
img = gradient(['#312E81', '#DB2777', '#FB923C']); sparkles(img, 40, 7)
caption(img, 'Reveal colorful pictures')
topbar(img, 'Level 21', 4)
st = [[1 if sol[r][c] == '#' else 0 for c in range(C)] for r in range(R)]
board(img, sol, st, colors=col, palette=pal, done_rows=range(R), done_cols=range(C))
d = ImageDraw.Draw(img, 'RGBA')
rnd = random.Random(5)
cols = ['#FBBF24', '#60A5FA', '#F472B6', '#34D399', '#FFFFFF', '#A78BFA']
for _ in range(90):
    x, y = rnd.randint(30, W - 30), rnd.randint(300, 1700); w, h = rnd.randint(10, 22), rnd.randint(18, 34)
    c = hx(rnd.choice(cols)); layer = Image.new('RGBA', (60, 60), (0, 0, 0, 0))
    ImageDraw.Draw(layer).rounded_rectangle([20, 12, 20 + w, 12 + h], 4, fill=(*c, 235))
    layer = layer.rotate(rnd.randint(0, 180)); img.paste(layer, (x - 30, y - 30), layer)
center_text(d, 1520, 'Beach ball', F(PB, 84), 'white')
for i in range(3):
    cx = 540 + (i - 1) * 140; cy = 1690
    pts = [(cx + math.cos(math.radians(a * 36 - 90)) * (62 if a % 2 == 0 else 26), cy + math.sin(math.radians(a * 36 - 90)) * (62 if a % 2 == 0 else 26)) for a in range(10)]
    d.polygon(pts, fill='#FBBF24', outline='#B45309')
img.save(f'{OUT}/02_reveal.png')

# 3 map
img = gradient(['#4C1D95', '#BE185D', '#FB923C', '#FDE68A']); sparkles(img, 30, 11)
d = ImageDraw.Draw(img, 'RGBA')
d.ellipse([-200, 1640, 1280, 2300], fill=hx('#9D174D')); d.ellipse([-400, 1500, 700, 2200], fill=hx('#BE185D'))
caption(img, '500 levels', '25 magical maps')
pts = []
for i in range(9):
    t = i / 8; y = 1650 - t * 1150
    x = 540 + math.sin(t * math.pi * 2.2) * 300; pts.append((x, y))
d.line(pts, fill=(0, 0, 0, 60), width=70, joint='curve'); d.line(pts, fill=(255, 255, 255, 120), width=54, joint='curve')
for i, (x, y) in enumerate(pts):
    n = i + 1; done = i < 6; cur = i == 6
    if cur:
        d.ellipse([x - 70, y - 70, x + 70, y + 70], fill=(255, 235, 140, 90))
    s = 96 if not cur else 116
    if done:
        sx = int(x - s / 2); sy = int(y - s / 2)
        jelly(img, sx, sy, s, '#FBBF24', '#B45309', '#FEF3C7')
        d = ImageDraw.Draw(img, 'RGBA')
    elif cur:
        jelly(img, int(x - s / 2), int(y - s / 2), s); d = ImageDraw.Draw(img, 'RGBA')
    else:
        d.rounded_rectangle([x - s / 2, y - s / 2, x + s / 2, y + s / 2], 20, fill=hx('#3730A3'))
    t = str(n); f = F(PB, 46)
    center_text(d, y - 34, t, f, 'white' if not done else '#78350F', cx=int(x))
    if done:
        for k in range(3): d.ellipse([x - 30 + k * 22, y + s / 2 + 6, x - 14 + k * 22, y + s / 2 + 22], fill='#FBBF24')
pill(img, (340, 1730, 740, 1850), 'Play', '#2563EB', size=56)
img.save(f'{OUT}/03_maps.png')

# 4 hint
img = gradient(SUN); sparkles(img, 24, 21)
caption(img, 'Smart hints', 'that teach you why')
topbar(img, 'Level 21', 5)
st = play_state(2, False)
board(img, sol, st, hl_row=5, done_rows=range(0, 3), done_cols=[])
d = ImageDraw.Draw(img, 'RGBA')
card = (90, 1560, 990, 1850); shadow(img, card, 44)
d = ImageDraw.Draw(img, 'RGBA'); d.rounded_rectangle(card, 44, fill=hx('#FFFBEB'), outline=hx('#FBBF24'), width=6)
d.text((140, 1580), 'Hint', font=F(PB, 52), fill=hx('#B45309'))
body = ['One block of 7 in 10 squares:', 'even pushed to either side,', 'the middle 4 are always filled.']
for i, t in enumerate(body): d.text((140, 1665 + i * 52), t, font=F(PM, 38), fill=hx('#78350F'))
img.save(f'{OUT}/04_hints.png')

# 5 languages
img = gradient(['#1E3A8A', '#7C3AED', '#EC4899', '#FB923C']); sparkles(img, 30, 31)
caption(img, 'Play in 38 languages')
langs = [('English', PB), ('Türkçe', PB), ('Deutsch', PB), ('Français', PB), ('Español', PB), ('Português', PB), ('Italiano', PB), ('Polski', PB),
         ('Nederlands', PB), ('Svenska', PB), ('Čeština', PB), ('Română', PB), ('Magyar', PB), ('Dansk', PB), ('Suomi', PB), ('Bahasa', PB),
         ('日本語', CJK), ('한국어', CJK), ('中文', CJK), ('Melayu', PB), ('Русский', CJK), ('Norsk', PB), ('Български', CJK), ('Tiếng Việt', CJK)]
y = 400; x = 70; row_h = 132
rnd = random.Random(9); pal2 = ['#2563EB', '#DB2777', '#F59E0B', '#7C3AED', '#0EA5E9', '#EF4444']
d = ImageDraw.Draw(img, 'RGBA')
for i, (name, fp) in enumerate(langs):
    f = F(fp, 52); w = d.textlength(name, font=f) + 80
    if x + w > W - 70: x = 70; y += row_h
    box = (x, y, x + w, y + 104)
    shadow(img, box, 46, 8, 10, 60); d = ImageDraw.Draw(img, 'RGBA')
    d.rounded_rectangle(box, 46, fill=hx(pal2[i % len(pal2)]))
    d.text((x + 40, y + 20), name, font=f, fill='white')
    x += w + 26
center_text(d, y + 170, '+ 14 more', F(PB, 64), (255, 232, 140))
img.save(f'{OUT}/05_languages.png')
print('ok')
