#!/usr/bin/env bash
# Symlinks this vault's theme/plugins into another vault's .obsidian/, and
# copies settings (copied, not symlinked, so each vault can still diverge).
# This repo IS the canonical vault (open it in Obsidian directly) — running
# this script against itself is a no-op.
#
# Usage: ./install.sh /path/to/vault
set -euo pipefail
shopt -s nullglob

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT="$(cd "${1:?usage: install.sh /path/to/vault}" && pwd)"
OBS="$VAULT/.obsidian"

if [ "$OBS" = "$REPO/.obsidian" ]; then
  echo "This is the source vault — nothing to install."
  exit 0
fi

mkdir -p "$OBS/themes" "$OBS/plugins"

for theme in "$REPO"/.obsidian/themes/*/; do
  name="$(basename "$theme")"
  ln -sfn "$theme" "$OBS/themes/$name"
done

for plugin in "$REPO"/.obsidian/plugins/*/; do
  name="$(basename "$plugin")"
  ln -sfn "$plugin" "$OBS/plugins/$name"
done

cp "$REPO"/.obsidian/{app,appearance,community-plugins,core-plugins,templates}.json "$OBS/"

# Scaffold 00_Meta (attachments + templates) if the vault doesn't have it yet.
# Created once, never overwritten — vault content, not shared config.
mkdir -p "$VAULT/00_Meta/Attachments" "$VAULT/00_Meta/Templates"
for tpl in "$REPO"/00_Meta/Templates/*; do
  name="$(basename "$tpl")"
  [ -e "$VAULT/00_Meta/Templates/$name" ] || cp "$tpl" "$VAULT/00_Meta/Templates/$name"
done

# Reference notes: symlinked, like themes/plugins, so an edit here shows everywhere.
ln -sfn "$REPO/00_Meta/Obsidian Cheat Sheet.md" "$VAULT/00_Meta/Obsidian Cheat Sheet.md"

# Drop symlinks left behind for a theme/plugin since removed from the repo.
# (glob without a trailing slash so already-broken symlinks still match)
for link in "$OBS"/themes/* "$OBS"/plugins/*; do
  [ -L "$link" ] || continue
  case "$(readlink "$link")" in
    "$REPO"/*) [ -e "$link" ] || rm "$link" ;;
  esac
done

echo "Linked themes/plugins and copied settings into $OBS"
echo "Restart Obsidian (or reload the vault) to pick them up."
