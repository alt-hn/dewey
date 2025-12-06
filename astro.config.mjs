// @ts-check
import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";

// Small Vite plugin to add CORS headers in dev so embedded previews
// that request dev-module CSS won't be blocked by the browser.
function viteCorsDevPlugin() {
  return {
    name: 'vite:cors-dev-plugin',
    configureServer(server) {
      server.middlewares.use((req, res, next) => {
        try {
          res.setHeader('Access-Control-Allow-Origin', '*');
        } catch (e) {
          // ignore
        }
        next();
      });
    },
  };
}

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind()],
  vite: {
    plugins: [viteCorsDevPlugin()],
  },
});
