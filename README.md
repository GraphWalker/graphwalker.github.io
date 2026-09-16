# graphwalker.github.io

Public website for [GraphWalker](https://graphwalker.github.io) — a model-based testing tool written in Rust.

The site has two halves:

| Path | What it is | How it's built |
|---|---|---|
| `/` (root) | Marketing landing page | Astro + Tailwind (`src/`) |
| `/graphwalker-rs/` | Deep documentation | Generated nightly from [`GraphWalker/graphwalker-rs/doc`](https://github.com/GraphWalker/graphwalker-rs/tree/main/doc) via Jekyll/just-the-docs |

## Getting started

The dev shell provides everything you need:

```sh
nix develop          # enter the dev shell (node 22, ruby, lychee)
npm install          # install JS dependencies
npm run dev          # start Astro dev server at localhost:4321
npm run build        # build the full site to dist/
npm run preview      # preview the built site
npm run check        # type-check Astro files
```

## Repository structure

```
├─ src/
│   ├─ pages/index.astro      # landing page
│   ├─ components/             # section components (Nav, Hero, Features, …)
│   ├─ styles/global.css       # Tailwind + font imports + theme tokens
│   └─ constants.ts            # canonical links and articles list
├─ public/                     # static assets copied verbatim to dist/
│   └─ graphwalker-rs/         # generated documentation (do not edit — synced nightly)
├─ .github/workflows/
│   ├─ pages.yml               # builds Astro and deploys to GitHub Pages
│   └─ sync-docs.yml           # refreshes public/graphwalker-rs from upstream nightly
├─ flake.nix                   # NixOS dev shell
└─ astro.config.mjs
```

## Documentation sync

The `public/graphwalker-rs/` folder is a static HTML site generated from the Markdown source in the upstream [`graphwalker-rs` repo's `doc/` folder](https://github.com/GraphWalker/graphwalker-rs/tree/main/doc).

The GitHub Action `.github/workflows/sync-docs.yml` runs daily at 03:00 UTC and:

1. Clones `GraphWalker/graphwalker-rs`
2. Builds the docs site with Jekyll
3. Commits the result here

**To add or edit documentation, make changes in the upstream `graphwalker-rs` repo**, not here.

## Local docs rebuild (optional)

```sh
npm run docs:rebuild        # clones upstream and rebuilds public/graphwalker-rs locally
```

Requires Ruby and Bundler (available in the Nix dev shell).

## Deploying

Pushes to `main` trigger `.github/workflows/pages.yml`, which builds the Astro site (including the checked-in `public/graphwalker-rs/` docs, copied verbatim into the output) and deploys to GitHub Pages via `actions/deploy-pages`.

## Contributing

1. Fork and clone this repo.
2. `nix develop` (or install Node 22 + npm manually).
3. `npm install && npm run dev`.
4. Make changes, `npm run build` to verify, then push a PR.