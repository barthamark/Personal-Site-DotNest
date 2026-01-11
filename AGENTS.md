# AGENTS

This repo is a DotNest Core SDK Orchard Core site with a custom Liquid theme and Tailwind v4 via CDN.

## Skills and evidence
- Use the `orchard-core-theming` skill for all Orchard Core theming, Liquid, shapes, and recipe work.
- Only check Orchard Core source if the skill does not cover the topic; if that happens, report it so the skill can be updated.

## Key paths
- `src/DotNest.Core.SDK.Web` is the host web app.
- `src/Themes/PersonalSite.Theme` contains the theme (Liquid templates, assets, recipes).
- `src/Themes/PersonalSite.Theme/Design` contains the Tailwind v4 HTML reference and `styles/tailwind.css`.

## Theme workflow
- Global layout: `src/Themes/PersonalSite.Theme/Views/Layout.liquid` renders header/footer directly and pulls the main menu via `Content["alias:main-menu"]`.
- Menu rendering uses `item.DisplayText` and `item.LinkMenuItemPart.Url` only (no fallbacks to `TitlePart.Title`).
- Tailwind v4 is delivered via `@tailwindcss/browser@4`; tokens/utilities live in `src/Themes/PersonalSite.Theme/Views/Tailwind__Styles.liquid`.
- The legacy Tailwind v3 pipeline (`src/Themes/PersonalSite.Theme/Assets/css/site.css` and `src/Themes/PersonalSite.Theme/Targets/RunTailwindBuild.targets`) is unused while CDN is active.
- Page output is driven by BagPart blocks: `src/Themes/PersonalSite.Theme/Views/Content__Page.liquid`.
- Block and widget overrides live in `src/Themes/PersonalSite.Theme/Views/Block__*.liquid` and `src/Themes/PersonalSite.Theme/Views/Widget__*.liquid`.
- Hero left column uses a flex column stack in `src/Themes/PersonalSite.Theme/Views/Block__Hero.liquid`; the badge widget is `self-start` with no bottom margin.
- No light/dark toggle or `scheme-light` class; use data-theme wrappers instead of toggles.

## Styling notes
- Fonts are loaded from Google Fonts (DM Sans, DM Mono, Figtree) in the layout head.
- Use Tailwind v4 directives (`@import "tailwindcss"`, `@theme`, `@utility`, `@layer`) inside `Tailwind__Styles.liquid`.
- Use `.rich-text` to style HtmlFields; HtmlField content must be clean tags only (no classes).
- Section themes are applied with `data-theme` wrappers (set in `Content__Page.liquid`) and custom variants in `Tailwind__Styles.liquid`.
- Lucide icons are initialized in the layout with `https://unpkg.com/lucide@latest` and `lucide.createIcons()`.

## Content model and recipes
- Recipes live in `src/Themes/PersonalSite.Theme/Recipes`.
- `PersonalSite.Development.Setup` runs `PersonalSite.Export` (source of truth for content types and content items) and `PersonalSite.MediaTheme`.
- Content item IDs must be `[js:uuid()]` or 26-character lowercase alphanumeric strings when stable IDs are required; do not use GUIDs.
- DisplayText is the reliable title; `TitlePart.Title` is for UI only and must not be used for display in templates.
- Page BagPart uses `ContainedStereotypes: ["Block"]`.
- BlockCommon part stores the theme (PredefinedList): `DarkBlue`, `DarkPanel`, `LightGray`, `White`, mapped to `data-theme` values `dark-blue`, `dark-panel`, `light-gray`, `white`.
- ButtonGroup supports alignment via `ButtonGroup.Alignment` (Left/Center).
- CTA uses `StackSection` with `StackSection.HeaderAlignment = Center`; items render stacked (not a grid).
- Hero adds `Hero.BackgroundLabel` plus a `Background` BagPart for `IconText` items.
- GridWidget columns are `Two`, `Three`, or `Four` only; use `StackSection` for single-column layouts. GridWidget stores its items in the `Items` BagPart.
- Current key types in `PersonalSite.Export.recipe.json`:
  - Blocks: `Hero`, `StackSection`, `ContactForm`, `ContactOptions`.
  - Widgets: `Badge`, `RichText`, `ButtonGroup`, `IconCard`, `FeatureCard`, `ServiceCard`, `BulletItem`, `Stat`, `Testimonial`, `HighlightCard`, `BenefitItem`, `ProcessStep`, `Callout`, `TextNote`, `ArrowLink`, `GridWidget`, `IconText`, `ReasonItem`, `FaqList`, `FaqItem`, `ContactOption`.
  - Buttons: `Button` (no stereotype), used by `ButtonGroup`.
  - BlogPost summary field is named `Excerpt`.

## Local development
- Run the site from `src/DotNest.Core.SDK.Web` with `dotnet run`.

## Deployment script
- `Deploy-MediaTheme.ps1` runs `dotnet restore`, `dotnet tool restore`, then `dotnet tool run media-theme-deploy`.
- The deploy key comes from `-Key`, `MEDIA_THEME_DEPLOY_KEY`, or a gitignored `.env` file.
- For CI/CD, set `MEDIA_THEME_DEPLOY_KEY` as a secret or pass `-Key`; use `-SkipRestore` if restore is handled elsewhere.

## Git workflow
- Do not commit changes; the user handles all commits.
