# MARCEL // HACKER MODE — interactive Bash prompt
# This file is sourced by a managed block in ~/.bashrc.

[[ $- == *i* ]] || return

marcel_banner() {
  printf '\n\033[1;38;5;46m'
  cat <<'EOF'
███╗   ███╗ █████╗ ██████╗  ██████╗███████╗██╗
████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██║
██╔████╔██║███████║██████╔╝██║     █████╗  ██║
██║╚██╔╝██║██╔══██║██╔══██╗██║     ██╔══╝  ██║
██║ ╚═╝ ██║██║  ██║██║  ██║╚██████╗███████╗██║
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝
EOF
  printf '\033[0m\033[38;5;46m[ SYSTEM ONLINE ]\033[0m  \033[38;5;244msecure shell / termux\033[0m\n\n'
}

marcel-help() {
  cat <<'EOF'
MARCEL // HACKER MODE

  marcel-help       Show this help
  marcel-banner     Show the ASCII MARCEL banner
  MARCEL_NO_BANNER=1  Start without the banner

Edit the theme

  nano ~/.termux/colors.properties
  nano ~/.termux/termux.properties
  termux-reload-settings
EOF
}

marcel-banner() {
  marcel_banner
}

PS1='\[\e]0;MARCEL • \w\a\]\[\e[38;5;46m\]╭─\[\e[38;5;117m\][\u@termux]\[\e[38;5;46m\]─\[\e[38;5;111m\][\w]\n\[\e[38;5;46m\]╰─\[\e[38;5;81m\]❯\[\e[0m\] '

# The banner is shown once per interactive shell, never as a popup/toast.
if [[ ${MARCEL_NO_BANNER:-0} != 1 ]]; then
  marcel_banner
fi
