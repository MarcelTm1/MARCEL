#!/data/data/com.termux/files/usr/bin/bash
# MARCEL for Termux — installer
# Applies only the files managed by this repository and always saves a backup.

set -eu

MARCEL_BEGIN='# >>> MARCEL Termux theme >>>'
MARCEL_END='# <<< MARCEL Termux theme <<<'
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
TERMUX_DIR="$HOME/.termux"
BASHRC="$HOME/.bashrc"
BACKUP_ROOT="$HOME/.marcel-backups"

say() {
  printf '\033[1;36m[MARCEL]\033[0m %s\n' "$1"
}

fail() {
  printf '\033[1;31m[MARCEL]\033[0m %s\n' "$1" >&2
  exit 1
}

usage() {
  cat <<'EOF'
Usage:
  bash scripts/install.sh              Install or update MARCEL.
  bash scripts/install.sh --uninstall  Remove MARCEL-managed files and Bash block.
  bash scripts/install.sh --help       Show this message.
EOF
}

remove_bash_block() {
  temp_dir=${TMPDIR:-/tmp}
  [ -d "$temp_dir" ] || temp_dir="$HOME"
  temp_file=$(mktemp "$temp_dir/marcel.XXXXXX") || fail 'Unable to create a temporary file.'

  if [ -f "$BASHRC" ]; then
    sed "/^# >>> MARCEL Termux theme >>>$/,/^# <<< MARCEL Termux theme <<</d" "$BASHRC" > "$temp_file"
  else
    : > "$temp_file"
  fi

  mv "$temp_file" "$BASHRC"
}

uninstall() {
  remove_bash_block
  rm -f "$TERMUX_DIR/marcel-prompt.sh"
  say 'Removed the MARCEL Bash prompt block and managed prompt file.'
  say "Existing color and key settings were kept. Backups remain in $BACKUP_ROOT."
  say 'Restart Termux or run: exec bash'
}

install() {
  [ -f "$REPO_DIR/config/colors.properties" ] || fail 'Run the installer from a complete MARCEL repository clone.'
  [ -f "$REPO_DIR/config/termux.properties" ] || fail 'Missing config/termux.properties.'
  [ -f "$REPO_DIR/config/prompt.sh" ] || fail 'Missing config/prompt.sh.'

  mkdir -p "$TERMUX_DIR" "$BACKUP_ROOT"
  timestamp=$(date '+%Y%m%d-%H%M%S')
  backup_dir="$BACKUP_ROOT/$timestamp"
  mkdir -p "$backup_dir"

  for file in colors.properties termux.properties marcel-prompt.sh; do
    if [ -f "$TERMUX_DIR/$file" ]; then
      cp "$TERMUX_DIR/$file" "$backup_dir/$file"
    fi
  done

  if [ -f "$BASHRC" ]; then
    cp "$BASHRC" "$backup_dir/bashrc"
  fi

  cp "$REPO_DIR/config/colors.properties" "$TERMUX_DIR/colors.properties"
  cp "$REPO_DIR/config/termux.properties" "$TERMUX_DIR/termux.properties"
  cp "$REPO_DIR/config/prompt.sh" "$TERMUX_DIR/marcel-prompt.sh"

  remove_bash_block
  {
    printf '\n%s\n' "$MARCEL_BEGIN"
    printf '# Managed by https://github.com/MarcelTm1/MARCEL\n'
    printf '[ -f "$HOME/.termux/marcel-prompt.sh" ] && . "$HOME/.termux/marcel-prompt.sh"\n'
    printf '%s\n' "$MARCEL_END"
  } >> "$BASHRC"

  if command -v termux-reload-settings >/dev/null 2>&1; then
    termux-reload-settings
    say 'Terminal colors and extra keys were reloaded.'
  else
    say 'termux-reload-settings was not found. Restart Termux to load terminal settings.'
  fi

  say "Installed successfully. Backup saved to: $backup_dir"
  say 'Open a new Termux session or run: exec bash'
}

case "${1:-}" in
  '') install ;;
  --uninstall) uninstall ;;
  --help|-h) usage ;;
  *) usage; exit 2 ;;
esac
