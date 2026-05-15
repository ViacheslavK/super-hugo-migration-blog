# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Hugo static blog site — "jUst QA" — a Ukrainian-language blog about QA, test automation, and software quality. Authored by Viacheslav Klevchenia (Lead SDET/QA Automation Engineer).

The project migrated content from another platform to Hugo and uses a custom fork of the Terminal theme.

## Common Commands

```bash
# Start local dev server (http://localhost:1313)
hugo server

# Build site to /public
hugo

# Build with drafts included
hugo server -D
```

Hugo Extended is required (for SCSS processing in the theme). The pinned version used for Cloudflare Pages builds is **0.161.1**.

## Deployment

The site is deployed via **Cloudflare Pages**. `build.sh` at the repo root downloads Hugo Extended 0.161.1 and runs `hugo`. Set Cloudflare's build command to `bash build.sh` and the output directory to `public`.

Preview deployments use a `*.pages.dev` URL that differs from the production domain (`slavaqa.pp.ua`). Always use `RelPermalink` (not `Permalink`) in layout templates so that CSS and asset URLs are relative and work on both the preview and production domains.

## Theme

The theme lives in `themes/terminal/` as a git submodule pointing to `https://github.com/ViacheslavK/super-hugo-terminal-theme.git` — a custom fork of the upstream Terminal theme. Do not edit files inside `themes/terminal/` directly; override layouts in the root `layouts/` directory instead.

After cloning, initialize the submodule:

```bash
git submodule update --init --recursive
```

### Theme version notes

- **v4.2.3**: `prism.js` was removed from theme assets and replaced by `code.js`. The root override `layouts/partials/footer.html` already reflects this.
- CSS assets are loaded via `resources.Match "css/*.css"` with minification and fingerprinting in `layouts/partials/head.html`. Bootstrap 5.2.3 is loaded from CDN before theme styles.

### Layout overrides

| File | Purpose |
| --- | --- |
| `layouts/partials/head.html` | Meta tags, CSS, Twitter Card, OG data |
| `layouts/partials/footer.html` | Replaces `prism.js` with `code.js` |
| `layouts/partials/mobile-menu.html` | Fixes `Language.Label` compatibility |
| `layouts/partials/extended_head.html` | Hook for extra `<head>` content |
| `layouts/_default/rss.xml` | Custom RSS feed template |

## Content Structure

Posts live in `content/posts/YYYY/MM/DD/` organized by publication date. Static pages (e.g., CV) are in `content/pages/`. Uploaded media is in `content/uploads/YYYY/`.

### Post Front Matter Format

Posts use TOML front matter (`+++` delimiters):

```toml
+++
title = "Post Title"
publishDate = '2023-02-05T11:29:14+01:00'
author = "В'ячеслав Клевченя"
tags = ["Tag1", "Tag2"]
featured_image = "filename.jpg"
showFullContent = false
readingTime = true
hideComments = false
+++
```

Use `publishDate` (not `date`) for scheduling publication time.

## Configuration

Main config is `config.toml`. Key settings:

- Default language: Ukrainian (`uk`)
- Paginate: 10 posts per page
- Theme color: `green` (options: orange, blue, red, green, pink)
- `[params.twitter]` section controls Twitter card metadata

## Build Output

The `public/` directory is the generated site (gitignored for deployment). The `resources/` directory is Hugo's internal SCSS/asset cache — it can be regenerated and deleted safely.
