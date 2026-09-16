#!/usr/bin/env bash
# Inserts a "GraphWalker" link back to the landing page (/) into every
# generated just-the-docs page under the given docs directory, placed just
# above the "Home" item in the sidebar nav.
#
# Idempotent: pages that already contain the link are left untouched, so it
# is safe to re-run on an already-processed directory.
#
# Usage: add-docs-home-link.sh <dir-containing-html-files>
set -euo pipefail

DOCS_DIR="${1:-}"
if [ -z "$DOCS_DIR" ] || [ ! -d "$DOCS_DIR" ]; then
  echo "Usage: $0 <dir-containing-html-files>" >&2
  exit 1
fi

LINK='<a href="/" class="graphwalker-site-link">← GraphWalker</a>'
STYLE='<style>.graphwalker-site-link{display:block;text-align:center;padding:9px 12px;margin:0 8px 12px;border:1px solid rgba(120,130,150,.35);border-radius:8px;font-size:12px;font-weight:600;color:#b7410e;text-decoration:none}.graphwalker-site-link:hover{border-color:#b7410e}</style>'

count=0
for file in "$DOCS_DIR"/*.html; do
  [ -f "$file" ] || continue
  if grep -q 'class="graphwalker-site-link"' "$file"; then
    continue
  fi
  # Inject the stylesheet into <head> if not already present.
  if ! grep -q 'graphwalker-site-link{display' "$file"; then
    sed -i "s|</head>|${STYLE}\n</head>|g" "$file"
  fi
  # Put the link just above the sidebar nav (which lists "Home" first).
  sed -i "s#<nav aria-label=\"Main\"#${LINK}\n<nav aria-label=\"Main\"#g" "$file"
  count=$((count + 1))
done

echo "add-docs-home-link: processed $count page(s) in $DOCS_DIR"