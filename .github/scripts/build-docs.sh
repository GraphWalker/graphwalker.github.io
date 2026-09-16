#!/usr/bin/env bash
#
# Regenerates the /graphwalker-rs static documentation site in this repo
# from the Markdown sources in GraphWalker/graphwalker-rs/doc.
#
# Usage:
#   ./build-docs.sh /absolute/path/to/graphwalker.github.io
#
set -euo pipefail

REPO_DIR="${1:?usage: build-docs.sh /absolute/path/to/graphwalker.github.io}"

BUILD_DIR="$(mktemp -d)"
trap 'rm -rf "$BUILD_DIR"' EXIT

echo "==> Cloning GraphWalker/graphwalker-rs"
git clone --depth 1 --quiet https://github.com/GraphWalker/graphwalker-rs.git "$BUILD_DIR/upstream"

echo "==> Preparing doc build"
cp -r "$BUILD_DIR/upstream/doc/." "$BUILD_DIR/docs/"
cd "$BUILD_DIR/docs"

# Build with the bundled just-the-docs gem instead of the remote theme,
# so the build does not depend on jekyll-remote-theme.
sed -i '/jekyll-remote-theme/d' Gemfile
sed -i '/remote_theme:/d' _config.yml
sed -i '/- jekyll-remote-theme/d' _config.yml
sed -i '/^plugins:$/d' _config.yml
if ! grep -q '^theme: just-the-docs' _config.yml; then
  sed -i '/^title:/i theme: just-the-docs' _config.yml
fi

echo "==> Building the docs site"
bundle install --quiet
bundle exec jekyll build --quiet --destination "$BUILD_DIR/out"

echo "==> Replacing public/graphwalker-rs/ in $REPO_DIR"
rm -rf "$REPO_DIR/public/graphwalker-rs"
mkdir -p "$REPO_DIR/public/graphwalker-rs"
cp -r "$BUILD_DIR/out/." "$REPO_DIR/public/graphwalker-rs/"

echo "==> Adding landing-page link to each docs page"
"$REPO_DIR/scripts/add-docs-home-link.sh" "$REPO_DIR/public/graphwalker-rs"

echo "==> Done. public/graphwalker-rs/ now mirrors GraphWalker/graphwalker-rs/doc"