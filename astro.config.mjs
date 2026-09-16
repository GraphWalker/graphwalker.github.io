import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import sitemap from '@astrojs/sitemap';
import { existsSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const publicDir = fileURLToPath(new URL('./public', import.meta.url));

// GitHub Pages serves directory indexes (e.g. /graphwalker-rs/ -> index.html),
// but the Astro dev server does not do this for files in public/. Mirror the
// hosting behaviour in dev/preview so links such as "Home" in the docs work.
function directoryIndexForPublic() {
  return {
    name: 'public-directory-index',
    configureServer(server) {
      server.middlewares.use((req, res, next) => {
        if (req.method !== 'GET' && req.method !== 'HEAD') return next();
        const urlPath = decodeURIComponent((req.url ?? '').split('?')[0]);
        if (!urlPath.endsWith('/')) return next();
        const candidate = path.join(publicDir, urlPath, 'index.html');
        if (existsSync(candidate)) {
          req.url = `${urlPath}index.html`;
        }
        next();
      });
    },
  };
}

export default defineConfig({
  site: 'https://graphwalker.github.io',
  output: 'static',
  trailingSlash: 'ignore',
  vite: {
    plugins: [tailwindcss(), directoryIndexForPublic()],
  },
  integrations: [sitemap()],
});