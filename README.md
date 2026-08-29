<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:020617,45:052E16,100:16A34A&height=210&section=header&text=MARCEL&fontSize=62&fontColor=F0FDF4&animation=fadeIn&fontAlignY=37&desc=Hacker%20style%20workspace%20for%20Termux&descAlignY=58&descSize=17" alt="MARCEL — Hacker style workspace for Termux" width="100%" />
</p>

<p align="center">
  <a href="https://github.com/MarcelTm1/MARCEL/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-22C55E?style=for-the-badge&labelColor=020617" alt="MIT License" /></a>
  <a href="https://github.com/MarcelTm1/MARCEL/stargazers"><img src="https://img.shields.io/github/stars/MarcelTm1/MARCEL?style=for-the-badge&color=FACC15&labelColor=020617" alt="GitHub stars" /></a>
  <a href="https://github.com/MarcelTm1/MARCEL/issues"><img src="https://img.shields.io/github/issues/MarcelTm1/MARCEL?style=for-the-badge&color=A78BFA&labelColor=020617" alt="GitHub issues" /></a>
</p>

<p align="center">
  <strong>MARCEL</strong> is a clean, hacker-inspired visual setup for <a href="https://termux.dev/">Termux</a>: a dark terminal palette, a touch-friendly key bar, an ASCII startup banner, and a focused Bash prompt.
</p>

## Preview

```text
███╗   ███╗ █████╗ ██████╗  ██████╗███████╗██╗
████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██║
██╔████╔██║███████║██████╔╝██║     █████╗  ██║
██║╚██╔╝██║██╔══██║██╔══██╗██║     ██╔══╝  ██║
██║ ╚═╝ ██║██║  ██║██║  ██║╚██████╗███████╗██║
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝
[ SYSTEM ONLINE ]  secure shell / termux

╭─[u0_a123@termux]─[~]
╰─❯
```

## Features

| Component | What it does |
| :-- | :-- |
| **Hacker palette** | Black-blue background with green terminal accents and readable contrast. |
| **ASCII MARCEL** | Displays the MARCEL wordmark once when a new interactive Bash session starts. |
| **Parser-safe key bar** | Uses the simple quoted-key format supported by Termux, avoiding the `extra-keys` popup error. |
| **Focused prompt** | Shows the current user and directory without noisy decorations. |
| **Safe installer** | Creates a timestamped backup before every install and changes only MARCEL-managed files. |
| **No root or plugins** | The theme uses Termux configuration and Bash only. |

> The startup banner is plain terminal output, not a toast or Android popup. It appears once per new interactive shell. Set `MARCEL_NO_BANNER=1` for a session without it.

## Install

Termux reads terminal preferences from `~/.termux/termux.properties`; changes can be applied with `termux-reload-settings` or by restarting Termux.[1] Clone the repository locally so you can inspect the files before running the installer.

```bash
pkg update && pkg install -y git
git clone https://github.com/MarcelTm1/MARCEL.git
cd MARCEL
bash scripts/install.sh
```

Then open a new Termux session or run:

```bash
exec bash
```

## Disable the startup banner

To start the current shell without the ASCII banner:

```bash
MARCEL_NO_BANNER=1 exec bash
```

The default MARCEL setup does not create a recurring popup. If an old version of MARCEL is still loaded in the current session, run `exec bash` after updating the files.

## Commands

| Command | Purpose |
| :-- | :-- |
| `marcel-help` | Shows shortcuts and customization commands. |
| `marcel-banner` | Shows the ASCII MARCEL banner manually. |
| `termux-reload-settings` | Reloads colors and extra keys after configuration changes.[1] |

## Customize

MARCEL is plain text and easy to edit:

```bash
nano ~/.termux/colors.properties
nano ~/.termux/termux.properties
termux-reload-settings
```

The extra-key layout intentionally uses quoted values and two rows:

```text
ESC  /  -  HOME  UP  END  PGUP
TAB  CTRL  ALT  LEFT  DOWN  RIGHT  PGDN
```

This follows the style shown in the official Termux properties template.[2]

## Update

```bash
cd ~/MARCEL
git pull --ff-only
bash scripts/install.sh
exec bash
```

Each update creates a fresh backup in `~/.marcel-backups/<timestamp>/`.

## Remove

The uninstall command removes the MARCEL prompt integration but keeps the current colors and key layout:

```bash
cd ~/MARCEL
bash scripts/install.sh --uninstall
exec bash
```

To restore an older configuration, copy the desired files from `~/.marcel-backups/<timestamp>/` back into `~/.termux/`, then run `termux-reload-settings`.

## Contributing

Ideas, improvements, and device-specific feedback are welcome. Open an [issue](https://github.com/MarcelTm1/MARCEL/issues) with your Termux version, Android version, and a clear description of the behaviour. For code changes, create a focused pull request with a concise explanation.

## License

Distributed under the [MIT License](LICENSE).

## References

[1] [Termux Wiki — Terminal Settings](https://wiki.termux.com/wiki/Terminal_Settings)  
[2] [termux/termux-tools — default `termux.properties`](https://github.com/termux/termux-tools/blob/master/termux.properties)

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:020617,45:052E16,100:16A34A&height=110&section=footer" alt="Decorative footer" width="100%" />
</p>
