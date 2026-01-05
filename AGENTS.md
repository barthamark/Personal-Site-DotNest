# AGENTS

This repo is a DotNest Core SDK Orchard Core site with a custom Liquid theme.

## Key paths
- `src/DotNest.Core.SDK.Web` is the host web app.
- `src/Themes/PersonalSite.Theme` contains the theme (Liquid templates, assets, recipes).
- `Site Design/` contains the Tailwind v4 HTML reference and `styles/tailwind.css`.

## Theme workflow
- Global layout: `src/Themes/PersonalSite.Theme/Views/Layout.liquid` renders the header/footer directly and pulls the main menu via `Content["alias:main-menu"]`.
- Tailwind v4 is delivered via `@tailwindcss/browser@4`; custom tokens and utilities live in `src/Themes/PersonalSite.Theme/Views/Tailwind__Styles.liquid`.
- The legacy Tailwind v3 pipeline (`src/Themes/PersonalSite.Theme/Assets/css/site.css` and `src/Themes/PersonalSite.Theme/Targets/RunTailwindBuild.targets`) is currently unused while the CDN is active.
- Hero and widget overrides live in `src/Themes/PersonalSite.Theme/Views/Block__Hero.liquid`, `src/Themes/PersonalSite.Theme/Views/Widget__Badge.liquid`, `src/Themes/PersonalSite.Theme/Views/Widget__RichText.liquid`, and `src/Themes/PersonalSite.Theme/Views/Widget__ButtonGroup.liquid`.

## Styling notes
- Fonts are loaded from Google Fonts (DM Sans, DM Mono, Figtree) in the layout head.
- Use Tailwind v4 directives (`@import "tailwindcss"`, `@theme`, `@utility`, `@layer`) inside `Tailwind__Styles.liquid`.
- Lucide icons are initialized in the layout with `https://unpkg.com/lucide@latest` and `lucide.createIcons()`.

## Local development
- Run the site from `src/DotNest.Core.SDK.Web` with `dotnet run`.
- Recipes live in `src/Themes/PersonalSite.Theme/Recipes` for setup and content import.
- Recipe content IDs should be `[js:uuid()]` or 26-character lowercase alphanumeric IDs when they must be stable.
