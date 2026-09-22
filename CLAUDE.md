# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A shared Obsidian theme, community plugins, and default settings, reused across multiple vaults. The repo itself **is** an Obsidian vault (open it directly in Obsidian to edit theme/plugin settings live — changes land in the real files under `.obsidian/`).

## Layout

- `.obsidian/themes/Catppuccin/` — the theme
- `.obsidian/plugins/floating-toc/`, `.obsidian/plugins/obsidian-plugin-toc/` — community plugins (each is third-party plugin code: `manifest.json`, `main.js`, `styles.css`, `data.json`)
- `.obsidian/app.json`, `.obsidian/appearance.json`, `.obsidian/community-plugins.json`, `.obsidian/core-plugins.json`, `.obsidian/templates.json` — canonical default settings distributed to other vaults (`app.json` sets `attachmentFolderPath` to `00_Meta/Attachments`, `templates.json` sets the template `folder` to `00_Meta/Templates`)
- `00_Meta/Attachments/`, `00_Meta/Templates/Template.md` — vault content (not `.obsidian` config) that `attachmentFolderPath`/`templates.json` point at; scaffolded into other vaults, not kept in sync with them
- `install.sh` — deployment script (see below)

## How distribution works (`install.sh /path/to/vault`)

- Themes and plugins are **symlinked** into the target vault's `.obsidian/themes` and `.obsidian/plugins` — editing this repo updates every linked vault immediately, including live via Obsidian's UI since this repo is itself a vault.
- The five settings JSON files are **copied**, not linked, so each vault can diverge (enable an extra plugin, tweak core plugins, change its own `app.json`) without affecting others. Re-running `install.sh` resets a vault's settings back to these defaults — including overwriting any vault-local changes to those files.
- `00_Meta/Attachments/` and `00_Meta/Templates/` are **scaffolded**: created if missing, and any template file not already present in the target is copied in — but existing files are never overwritten, since this is vault content a vault owns once it exists.
- Vault-specific state (`workspace.json`, etc.) is never touched.
- Running the script against this repo's own `.obsidian/` is a no-op (it detects and skips this case).

## Adding a theme or plugin

Drop the folder into `.obsidian/themes/` or `.obsidian/plugins/`, then add its id to `.obsidian/community-plugins.json` (and `.obsidian/appearance.json`'s `cssTheme` if it becomes the active theme) — or do it live from Obsidian's UI with this vault open. Commit, then re-run `install.sh` on each consuming vault to pick it up.

## Notes

- No build, lint, or test commands — this is static config/data, not a program.
- `.obsidian/workspace.json`, `workspace-mobile.json`, `graph.json`, and `.obsidian/cache/` are gitignored (vault-local, not shared).
