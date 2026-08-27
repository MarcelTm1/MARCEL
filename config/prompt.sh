# MARCEL for Termux — interactive Bash prompt
# This file is sourced by a managed block in ~/.bashrc.

[[ $- == *i* ]] || return

marcel_welcome() {
  printf '\n\033[38;5;45m┌──────────────────────────────────────────────┐\033[0m\n'
  printf '\033[38;5;45m│\033[0m  \033[1;38;5;117mMARCEL\033[0m  \033[38;5;250m—  a clean Termux workspace\033[0m       \033[38;5;45m│\033[0m\n'
  printf '\033[38;5;45m│\033[0m  \033[38;5;141mType \033[1mmarcel-help\033[0m\033[38;5;141m for shortcuts and tips.\033[0m  \033[38;5;45m│\033[0m\n'
  printf '\033[38;5;45m└──────────────────────────────────────────────┘\033[0m\n\n'
}

marcel-help() {
  cat <<'EOF'
MARCEL shortcuts

  marcel-help    Show this help
  marcel-welcome Show the MARCEL welcome card
  clear          Clear the screen as usual

Edit the theme

  nano ~/.termux/colors.properties
  nano ~/.termux/termux.properties
  termux-reload-settings
EOF
}

marcel-welcome() {
  marcel_welcome
}

PS1='\[\e]0;MARCEL • \w\a\]\[\e[38;5;45m\]╭─\[\e[38;5;117m\][\u@termux]\[\e[38;5;45m\]─\[\e[38;5;111m\][\w]\n\[\e[38;5;45m\]╰─\[\e[38;5;81m\]❯\[\e[0m\] '

if [[ -z ${MARCEL_WELCOME_SHOWN:-} ]]; then
  marcel_welcome
  export MARCEL_WELCOME_SHOWN=1
fi
