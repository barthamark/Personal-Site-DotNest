# AGENTS

This repo contains static HTML pages extracted from `MagicPatterns.md` (React + Tailwind). The goal is to keep pages in Tailwind v4 style, avoid arbitrary classes, and keep the look consistent across pages.

## How pages are built

1) Find the relevant React page/component in `MagicPatterns.md` and flatten it into static HTML (no React, no router, no framer-motion).
2) Replace any dynamic behavior (state, animations, dynamic dates) with static markup.
3) Reuse the same layout language and utility classes from the original, but keep everything v4-friendly and tokenized.
4) Use the shared nav pattern with `home.html` as the root page and deep links like `home.html#services` from other pages.

## Tailwind v4 guidance

- Tokens live in `styles/tailwind.css` under `@theme`. Add tokens when the same color or value repeats.
- Avoid arbitrary classes (no `[#...]`, no `leading-[...]`, no `aspect-[...]`). Prefer tokens instead.
- Existing tokens:
  - `--color-dark-blue`, `--color-dark-panel`, `--color-light-blue`, `--color-light-blue-strong`, `--color-light-bg`, `--color-light-text`
  - `--aspect-4-5`, `--leading-hero`
- Use built-in Tailwind colors for one-off brand accents (e.g., `bg-blue-100`, `text-violet-600`) instead of new tokens.

## Component utilities

Shared styles are defined with `@utility` in `styles/tailwind.css`:
- Base: `btn`
- Variants: `btn-primary`, `btn-outline`, `btn-ghost`, `btn-ghost-inverse`
- Sizes: `btn-sm`, `btn-md`, `btn-lg`

Layout and content helpers:
- `page-container` for the repeated `max-w-7xl` shell + responsive padding
- `site-nav`, `nav-link`, `nav-link-mobile`, `nav-link-active` for the shared header
- `site-footer` for the shared footer styling
- `card`, `card-compact`, `card-hover`, `card-strong`, `card-dark` for card shells
- `pill` for the hero/header badge
- `tag` for blog category labels

Use these classes instead of repeating long utility strings.

## Lucide icons

- Replace inline SVG symbols with Lucide icons:
  - Use: `<i data-lucide="icon-name" class="..." aria-hidden="true"></i>`
- Include the script at the end of each HTML page:
  - `<script src="https://unpkg.com/lucide@latest"></script>`
  - `<script>lucide.createIcons();</script>`

## Build workflow

- Add new HTML files to `tailwind.config.js` under `content` so Tailwind scans them.
- Regenerate CSS after changes:
  - `npm run build:css`
- `styles/tailwind.generated.css` is generated and should stay in sync with the HTML.

## Quick checklist for new pages

- Static HTML extracted from `MagicPatterns.md`
- No React or motion code
- Tokenized colors and sizes
- Buttons use `btn` utilities
- Lucide icons included and initialized
- Page added to `tailwind.config.js`
- `npm run build:css` run
