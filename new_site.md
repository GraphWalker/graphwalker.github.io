# Plan: Re-vamp graphwalker.github.io around graphwalker-rs (Rust)

## Goal

Fully redesign and rewrite the public web site at https://graphwalker.github.io so it:

1. **Reflects the current product** — the Rust rewrite `graphwalker-rs` (https://github.com/GraphWalker/graphwalker-rs) — instead of the legacy Java project `graphwalker-project`.
2. **Looks modern** — a clean, contemporary developer-tool aesthetic (fast, light, dark-mode friendly) rather than the dated 2014 SinglePaged layout.
3. **Stays GitHub Pages compatible** and as low-maintenance as possible.
4. **Keeps a clear home for the deep documentation** and a small, honest pointer to the archived Java project.
5. **Use documentation in `graphwalker-rs/doc`** so when updates are made in graphwalker-rs and documented there, the public web site also gets updated with the same changes.

## Decisions made

These choices are locked in; the rest of this plan is built on them.

- **Landing style** → **rust-lang.org**: code-first, warm accent color (Rust orange `#DEA584` family), clean typography, dark-mode friendly.
- **Docs style** → **keep the current just-the-docs look** at `/graphwalker-rs/`. Docs stay a *generated artifact*, rebuilt nightly from `GraphWalker/graphwalker-rs/doc` by the existing sync workflow.
- **Stack** → **Astro** for the landing page + the pre-generated Jekyll/just-the-docs docs, deployed via **GitHub Actions + `deploy-pages`**.
- `rust-transition.md` has been deleted; this plan supersedes it.

## Current site state

- Landing page = Jekyll + `SinglePaged` theme (one page, sections from `_posts/`): `index.html`, `combo.css`, `site.js`.
  - `_posts/1999-12-31-graphwalker-rs.md` — "being rewritten in Rust" banner
  - `_posts/2000-01-01-intro.md` — home/Studio + gif
  - `_posts/2000-01-02-features.md` — Java/maven-centric features
  - `_posts/2000-01-05-usage.md` — vertex/edge explanation
  - `_posts/2000-01-06-documentation.md` — Java wiki, Google forum, Studio jar, Maven archetype/dependency
  - `_posts/2000-01-08-download.md` — `graphwalker-*.jar` downloads, graphwalker-project releases
  - `_posts/2000-01-09-articles.md` — MBT articles (language-neutral, keep)
- Deep docs = `graphwalker-rs/` static just-the-docs site, generated nightly from `GraphWalker/graphwalker-rs/doc` by `.github/workflows/sync-docs.yml` + `.github/scripts/build-docs.sh`.
- `_config.yml` → `source_link: .../graphwalker-project`; footer → org link; README → contributor docs.

---

## GitHub Pages — compatibility facts (why the deploy setup below)

- This is a **user/org site** (`graphwalker.github.io`), so Pages can only serve from the `main`/`master` branch — **no `gh-pages` branch for user sites**. Framework starters that default to publishing a `gh-pages` branch need adjustment.
- Three valid serving setups:
  1. **Native Jekyll on GitHub** — commit `main`, GitHub builds. Zero extra CI. Only Jekyll.
  2. **Prebuilt static committed to `main`** — build locally (or in CI) and commit HTML; add a `.nojekyll` file so GitHub doesn't re-run Jekyll over it.
  3. **GitHub Actions + `deploy-pages`** — build anything (Node/Rust/Go), upload the artifact, deploy. Requires Pages → Source = "GitHub Actions". Works for user sites.
- Whatever the stack: output must be plain HTML/CSS/JS (no server runtime), and **base path = `/`** (site is at the domain root).
- The nightly docs sync must keep working regardless of the landing stack.
- No symlinks/hard links in the repo on Pages; keep assets committed.

---

## Modern web site options (suggestions considered)

### GitHub Pages–compatible frameworks evaluated

| Option | Style on offer | Build | Language/Runtime | GitHub Pages fit |
|---|---|---|---|---|
| **Astro + Tailwind** (landing) | The 2026 default for dev-tool/marketing sites; zero-JS by default, islands, excellent Lighthouse | `npm run build` → `dist/` | Node.js | Setup 2 or 3 above |
| **Jekyll + modern theme** (e.g. Minimal Mistakes, Chirpy) or a **custom Tailwind layout** | Native GitHub Pages look; still a "blog-style" feel unless hand-styled | `jekyll build` | Ruby | Setup 1 (zero CI) |
| **Hugo** (themes: PaperMod, Congo, Docsy, Book) | Fast, modern blog/docs themes; single Go binary | `hugo` → `public/` | Go (single binary) | Setup 2 or 3 |
| **VitePress** | Docs-first (powers Vite/Vue docs); clean, minimal, immediate SPA nav | `npm run docs:build` | Node.js + Vue | Setup 2 or 3 |
| **Docusaurus** | Big-react docs base (versioning, Algolia) — heavier (~500 kB JS) | `npm run build` | Node.js + React | Setup 2 or 3 |
| **Eleventy / 11ty** | Minimal, markdown-first, full control | `npx @11ty/eleventy` | Node.js | Setup 2 or 3 |
| **Zola** | Rust-based SSG — thematically fits a Rust project; fast, single binary | `zola build` | Rust (single binary) | Setup 2 or 3 |
| **Plain HTML/CSS + Tailwind** (hand-rolled) | Total design control, near-zero build complexity; good if site stays ~1 page | `npx tailwind -i` | Node or none (CDN) | Setup 1 or 2 |

**Where we landed:** **Astro + Tailwind** for the landing page — zero-JS output, easy modern theming, best "re-vamp" ROI — with the docs kept exactly as they are today (just-the-docs). Fallback if a Node toolchain is later unwanted: modern Jekyll with a hand-rolled layout (setup 1, zero CI).

### Design reference

The landing page is modeled on **rust-lang.org** (the project is now a Rust tool, so the aesthetic is coherent): **code-first**, **warm accent color**, **clean type**. Other sites in the same family to borrow layout ideas from: linear.app, vercel.com, duckdb.org, astro.build.

Typical modern-page anatomy we will adopt:

1. Sticky top nav (logo, docs, GitHub, install/download button) + dark-mode toggle.
2. Hero: name + one-line pitch ("Model-based testing in Rust. Generate test paths from directed graphs."), two CTAs (Get started / View on GitHub), terminal window showing `graphwalker offline -m model.json "random(edge_coverage(100))"`.
3. Feature grid: generators, stop conditions, guards/actions, multi-model, requirements tracking, REST/WebSocket API, Studio, deterministic replay.
4. Quick-start section: 3-step install + run with copyable code blocks.
5. Documentation links (to `/graphwalker-rs/`), then Articles, then footer.
6. Legacy Java project: a single muted "Legacy (Java)" link in footer/nav, not a headline.

---

## Chosen architecture

```
graphwalker.github.io/
├─ src/                    # Astro landing (components, styles, content)
├─ astro.config.mjs        # output: 'static', site: 'https://graphwalker.github.io'
├─ public/
│  └─ graphwalker-rs/      # generated just-the-docs — copied to dist verbatim (nightly sync)
├─ images/ img/ resources/ # shared assets (keep)
└─ .github/workflows/
   ├─ pages.yml            # NEW: build Astro (dist = landing + graphwalker-rs) -> deploy-pages
   └─ sync-docs.yml        # EXISTING: nightly doc refresh from graphwalker-rs/doc (unchanged)
```

Two halves, clearly split:

- `/` — **landing page**, hand-authored in this repo with Astro.
- `/graphwalker-rs/` — **deep docs**, generated nightly from `GraphWalker/graphwalker-rs/doc` into `public/graphwalker-rs/`; the landing page links to it but never duplicates its content (satisfies Goal 5).

---

## Design decisions

1. **Split identities:** `/` = marketing/landing (this repo); `/graphwalker-rs/` = deep docs (generated artifact of the upstream repo). Clear ownership boundary.
2. **Branding:** keep the "GraphWalker" name; accent = Rust orange (`#DEA584` family) on a dark, code-first hero, as on rust-lang.org. Keep the existing `img/favicon.ico`.
3. **Dark/light mode:** toggle persisted in `localStorage`; default to `prefers-color-scheme`.
4. **Typography:** Fira Sans for headings/body and Source Code Pro (or system mono) for code/terminal — the rust-lang.org pairing — on the landing page. The docs half keeps its own font.
5. **No Java/Maven content anywhere** on the landing page (see content plan). A "Legacy (Java)" pointer goes in the footer only.
6. **Copy tone:** short, benefits-led, mirrors wording already used in the `graphwalker-rs` docs so the two halves agree ("generators", "stop conditions", "REST API", "WebSocket API", "Studio").
7. **Single source of truth for links:** `graphwalker-rs` GitHub URL and release URL in one constants/config file, so a future rename doesn't need a site-wide grep.
8. **Doc content ownership:** all documentation copy lives upstream in `GraphWalker/graphwalker-rs/doc`; this repo only surfaces it via the sync + links. Landing content must be re-checked against the docs after every sync to keep CLI examples and command syntax current.

---

## Content plan (landing page, Rust-centric)

One-page layout: nav → hero → features → quick start → studio → docs → articles → footer.

1. **Hero**
   - "GraphWalker" + tagline: *Model-based testing in Rust. Generate test paths from directed graphs.*
   - CTAs: **Get started** (`/graphwalker-rs/getting-started.html`), **View on GitHub**.
   - Terminal/hero graphic: `graphwalker offline -m model.json "random(edge_coverage(100))"` with a model graph, in a rust-lang.org-style code-first panel.
2. **Features**
   - Multiple path generators — random, quick random, weighted random, A*, shortest-all-paths, predefined, New York Street Sweeper.
   - Flexible stop conditions — edge/vertex coverage, reached element, time, length, requirement coverage, AND/OR combinations.
   - Guards and actions on edges.
   - Multi-model support via shared states.
   - Requirements tracking.
   - Interfaces: CLI (offline), REST API, WebSocket API, visual Studio.
   - Deterministic, seed-based replay.
3. **Quick start**
   - Install from prebuilt binaries (`GraphWalker/graphwalker-rs/releases`) or `cargo install graphwalker`.
   - 3 steps: create `model.json` → run `graphwalker offline ...` → drive tests (link to REST/WebSocket docs).
4. **Studio** — what it is (visual model editor + test runner), how to launch the `graphwalker-studio` binary, screenshot.
5. **Documentation** — links into `/graphwalker-rs/` (Getting Started, CLI, Generators, Stop Conditions, JSON format, REST, WebSocket, Studio).
6. **Articles** — reuse the existing MBT article list unchanged.
7. **Footer** — org GitHub link, repo license/source link, **Legacy (Java) project** pointer, "this site is open source".

Content to **delete/replace** from the old site:
- `graphwalker-cli-4.3.3.jar` / `graphwalker-studio-4.3.3.jar` download blocks → binary releases + `cargo install`.
- Maven archetype / `graphwalker-core` dependency instructions → gone.
- "Fork me on GitHub" ribbon → a standard GitHub-corner link to graphwalker-rs.
- Remove Wiki and forum links

### Deep docs (`/graphwalker-rs/`) — pipeline unchanged

- Keep `.github/workflows/sync-docs.yml` + `build-docs.sh` exactly as-is (just-the-docs from `GraphWalker/graphwalker-rs/doc`). This is what implements Goal 5.
- Verify the export includes the current page set (`cli, generators, stop-conditions, json-format, rest-api, websocket-api, studio, mcp, mcp-server, model-based-testing, getting-started, index`).
- Do **not** hand-edit generated HTML; any new doc page must be added upstream in `doc/` only.

---

## Build & deploy (chosen setup)

Deploy via **GitHub Actions + `deploy-pages`**:

- `.github/workflows/pages.yml`: on push to `main` → `actions/checkout` → `actions/setup-node` → `npm ci` → `npm run build` (Astro emits `dist/`) → `actions/configure-pages` → `actions/upload-pages-artifact` → `actions/deploy-pages`.
- GitHub → Settings → Pages → **Source: GitHub Actions** (deploy from the workflow, not a branch).
- **The one fiddly part — both halves must land at the site root:**
  - Astro must **not** copy `graphwalker-rs/` into `dist/` (set `publicDir`/`copyPublicDir` accordingly).
  - `deploy-pages` flattens the artifact, so in CI stage `dist/.` **and** `graphwalker-rs/` side by side into one artifact folder — producing a root that contains BOTH `index.html` and `graphwalker-rs/` — then upload that combined folder.
  - Test the artifact layout in a staging Pages build **before** merging to `main`.
- No `.nojekyll` needed with this setup (Pages serves the uploaded artifact; it never Jekyll-processes `main`).

---

## Implementation steps

### Phase 0 — Confirm remaining details (blocker)
- [ ] Confirm hero asset: reuse `img/Create-_and_run_a_model.gif` / `img/Studio.png`, or generate a new rendered model graph to match the code-first hero.
- [ ] Verify Studio default port in upstream docs (`http://localhost:9090/studio.html`) and confirm binary names before writing the Studio section.

### Phase 1 — Scaffold
- [ ] `npm create astro@latest` at repo root with `output: 'static'`, `site: 'https://graphwalker.github.io'`.
- [ ] Add Tailwind (Astro integration), a code/terminal component, and the Fira Sans + Source Code Pro font setup.
- [ ] Set up a constants file for canonical links: `github = GraphWalker/graphwalker-rs`, `githubReleases = graphwalker-rs/releases`, `docsBase = /graphwalker-rs/`, `legacyJava = graphwalker-project`.
- [ ] Keep `graphwalker-rs/`, `images/`, `img/`, `resources/`, LICENSE, and the sync workflow; remove Jekyll-only files (`Gemfile`, `Gemfile.lock`, `_config.yml`, `_posts/`, `_includes/`, `combo.css`, `site.js`, `index.html`, `_site/`).
- [ ] Create `.github/workflows/pages.yml` (build → stage `dist/ + graphwalker-rs/` → upload → deploy).

### Phase 2 — Landing content
- [ ] Hero section (copy + CTA + terminal graphic, rust-lang.org aesthetic).
- [ ] Features section (wording aligned with the `graphwalker-rs` docs).
- [ ] Quick-start with `cargo install` + prebuilt binaries + `graphwalker offline ...` example.
- [ ] Studio section (launch `graphwalker-studio`, verified port).
- [ ] Documentation section linking into `/graphwalker-rs/`.
- [ ] Articles section (copy the existing list as-is).
- [ ] Footer: org link, license, "source", **Legacy (Java) project** pointer.
- [ ] Dark/light toggle; favicon; SEO meta (`title`, `description`, OG tags).

### Phase 3 — Content copy pass
- [ ] Grep whole repo for `graphwalker-project`, `java -jar`, `*.jar`, `maven`, `4.3.x` and eliminate from the landing surface (intentional legacy pointer aside).
- [ ] Confirm feature/CLI examples match actual graphwalker-rs syntax (read the upstream `doc/` pages + README before writing).
- [ ] Re-check CLI examples against `graphwalker-rs/` after a fresh nightly sync so both halves agree.

### Phase 4 — Docs integration & links
- [ ] Confirm `/graphwalker-rs/` currently contains all pages referenced by the upstream README (`mcp`, `mcp-server`, …).
- [ ] Ensure `sync-docs.yml` + `build-docs.sh` are untouched and still work with the new repo layout (they build in their own temp clone, independent of the root).
- [ ] Replace old `http:` font/icon CDN references with bundled/modern assets (Google fonts with `display=swap`, inline SVG icons).
- [ ] Link-check the full site (`lychee` or a small script) — internal in-repo links AND `/graphwalker-rs/...` links.

### Phase 5 — README / meta
- [ ] Rewrite `README.md` for the new stack: run locally (`npm install && npm run dev`), how `graphwalker-rs/` docs are generated and refreshed nightly, how to contribute.
- [ ] Update `LICENSE.txt` note as appropriate (was MIT from SinglePaged — keep MIT, note new authorship/build).
- [ ] Note in README that `rust-transition.md` was removed (superseded by `new_site.md`).

### Phase 6 — Verification
- [ ] `npm run build` succeeds clean; inspect artifact root for correct sibling layout: `index.html` + `graphwalker-rs/`.
- [ ] Test locally (`npm run preview`), walk all pages incl. `/graphwalker-rs/...`.
- [ ] Lighthouse run on the landing page (target 90+ on mobile).
- [ ] Push to a staging branch + Pages preview build to confirm deploy-pages artifact layout **before** merging to `main`.
- [ ] After merge: HTTPS live check on https://graphwalker.github.io and https://graphwalker.github.io/graphwalker-rs/.
- [ ] Sitemap (`sitemap-index.xml`) and confirm no Java-era landing URL 404s permanently (`/download`, `/docs`, …).

---

## Open questions / decisions needed

- [ ] Keep the **Google Groups forum** as the community channel (landing or docs), or point at GitHub Issues/discussions for graphwalker-rs?
- [ ] **Analytics**: keep the current Google Analytics key, drop it, or switch to a privacy-first option?
- [ ] Should old **Java wiki content** be archived anywhere permanent, or is a GitHub footer link sufficient?
- [ ] Confirm the Studio **default port** (docs currently say `localhost:9090`) before publishing.

---

## Out of scope (for now)

- Editing the deep-docs content itself — owned by `GraphWalker/graphwalker-rs/doc`; surfaced here only via the nightly sync.
- Moving onto hosted docs platforms (Mintlify-style); requirement is a self-hosted/static GitHub Pages site.
- Changing the docs toolchain — docs stay just-the-docs/Jekyll generated from upstream `doc/`.