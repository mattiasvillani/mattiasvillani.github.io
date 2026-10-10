#!/usr/bin/env python3
"""Make small thumbnails of the paper images listed in _data/publist.yml.

The Research page shows each image at ~150px, so it loads
images/publications/thumbs/<name>.jpg instead of the full-size original.
Run this after adding a paper image:

    python scripts/make_thumbnails.py          # only missing/outdated thumbnails
    python scripts/make_thumbnails.py --force  # regenerate all

Requires Pillow (pip install pillow).
"""
import re
import sys
from pathlib import Path

from PIL import Image

SIZE = 320  # px, about 2x the displayed width
QUALITY = 80

root = Path(__file__).resolve().parent.parent
src_dir = root / "images" / "publications"
thumb_dir = src_dir / "thumbs"
force = "--force" in sys.argv[1:]

publist = (root / "_data" / "publist.yml").read_text(encoding="utf-8")
names = sorted(set(re.findall(r"^\s*image:\s*[\"']?([^\"'\s#]+)", publist, flags=re.M)))

thumb_dir.mkdir(exist_ok=True)
made = 0
missing = []
for name in names:
    src = src_dir / name
    thumb = thumb_dir / (name.split(".")[0] + ".jpg")
    if not src.exists():
        missing.append(name)
        continue
    if not force and thumb.exists() and thumb.stat().st_mtime >= src.stat().st_mtime:
        continue
    im = Image.open(src).convert("RGB")
    im.thumbnail((SIZE, SIZE), Image.LANCZOS)
    im.save(thumb, quality=QUALITY, optimize=True, progressive=True)
    made += 1
    print(f"wrote {thumb.relative_to(root)}")

print(f"{made} thumbnail(s) written, {len(names) - made - len(missing)} up to date")
if missing:
    print("WARNING: listed in publist.yml but not found in images/publications:")
    for name in missing:
        print(f"  {name}")
    sys.exit(1)
