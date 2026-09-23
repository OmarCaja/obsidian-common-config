<div align="center">

# obsidian-common-config

**One theme, one set of plugins, one default config — shared across every Obsidian vault you own.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

---

This repository **is** an Obsidian vault. Open it directly in Obsidian to tweak
the theme or plugin settings live — your edits land straight in the files
below, and a small script pushes them out to every other vault you use.

## How it works

`install.sh` pushes this vault's config into another vault three different ways:

| | Themes, plugins & reference notes | Settings (`app`, `appearance`, `community-plugins`, `core-plugins`, `templates`) | `00_Meta/` scaffolding (attachments + templates) |
|---|---|---|---|
| **Method** | Symlinked | Copied | Created if missing |
| **Why** | Edit once here, every vault picks it up instantly — even live, through Obsidian's UI | Each vault can still diverge (enable an extra plugin, tweak core plugins) without affecting the others | It's vault content a vault then owns — never overwritten once it exists |
| **To reset a vault** | Nothing to do, it's always current | Re-run `install.sh` | Delete the file/folder and re-run `install.sh` |

Vault-specific state — `workspace.json`, etc. — is never touched. Those
genuinely differ per vault.

## Contents

| Path | What it is |
|---|---|
| `.obsidian/themes/Minimal/` | Theme |
| `.obsidian/plugins/floating-toc/` | Community plugin — floating table of contents |
| `.obsidian/plugins/obsidian-plugin-toc/` | Community plugin — table of contents |
| `.obsidian/plugins/obsidian-minimal-settings/` | Community plugin — Minimal theme settings |
| `.obsidian/plugins/obsidian-style-settings/` | Community plugin — CSS variable controls for themes/snippets |
| `.obsidian/plugins/obsidian-hider/` | Community plugin — hides UI chrome (titlebar, status bar, etc.) |
| `.obsidian/plugins/editing-toolbar/` | Community plugin — Word-like editing toolbar |
| `.obsidian/app.json` | Attachment folder (`00_Meta/Attachments`) and other app settings |
| `.obsidian/appearance.json` | Active theme, appearance settings |
| `.obsidian/community-plugins.json` | Which community plugins are enabled |
| `.obsidian/core-plugins.json` | Which core plugins are enabled |
| `.obsidian/templates.json` | Template folder (`00_Meta/Templates`) |
| `00_Meta/Attachments/` | Where pasted images/files land, keeping the vault root clean |
| `00_Meta/Templates/Template.md` | Starter template, scaffolded into new vaults |
| `00_Meta/Obsidian Cheat Sheet.md` | Markdown/wikilink syntax reference, symlinked into every vault |

## Usage

Sync this config into a new or existing vault:

```bash
./install.sh /path/to/vault
```

Then open that vault in Obsidian and enable community plugins if prompted
(safe-mode default on a fresh vault).

Run it again any time — it's safe to repeat. It also cleans up after itself:
if a theme or plugin gets removed from this repo, the next `install.sh` run
drops the now-dangling symlink from every vault too.

## Adding a theme or plugin

1. Drop the folder into `.obsidian/themes/` or `.obsidian/plugins/`
2. Add its id to `.obsidian/community-plugins.json`
   (and `.obsidian/appearance.json`'s `cssTheme`, if it's the new active theme)
3. Commit, then re-run `install.sh` on each vault

Steps 1–2 can also be done live, from Obsidian's UI, with this vault open.

## License

[MIT](LICENSE)
