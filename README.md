# Epochfall demo: web deployment

This folder is a ready-to-deploy static site: the browser build of the Epochfall demo (`site/`,
exported by `tools/build_demo.ps1`), served by nginx from the `Dockerfile`.

The owner-supplied Bronze Age battle track is deliberately **not** in this build (it isn't licensed
for publishing); the Bronze Age uses the game's own battle theme here.

## Deploy on Coolify

1. Push this folder to a Git repository (GitHub, GitLab or any Git server Coolify can reach).
2. In Coolify: **+ New Resource → Application → (your Git source) → the repository**.
3. Build pack: **Dockerfile** (it's at the repository root). Port: **80**.
4. Set the domain, e.g. `https://demo.example.com`, and deploy. Coolify's proxy adds HTTPS.

The single-threaded web export needs no special headers, so it also runs inside an iframe or on
any plain static host.

## Updating

Run `tools/build_demo.ps1` from the project root: it rebuilds the demo, exports the web build and
copies it into `site/`. Commit and push; Coolify redeploys (automatically if the webhook is on).

## Test locally

```bash
docker build -t epochfall-demo . && docker run --rm -p 8080:80 epochfall-demo
```

Then open http://localhost:8080. Without Docker: `python -m http.server 8080 --directory site`.
