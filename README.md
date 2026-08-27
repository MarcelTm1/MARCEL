<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0B1020,45:1E3A8A,100:06B6D4&height=210&section=header&text=MARCEL&fontSize=62&fontColor=F8FAFC&animation=fadeIn&fontAlignY=37&desc=A%20clean%2C%20neon%20workspace%20for%20Termux&descAlignY=58&descSize=17" alt="MARCEL — a clean, neon workspace for Termux" width="100%" />
</p>

<p align="center">
  <a href="https://github.com/MarcelTm1/MARCEL/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-22D3EE?style=for-the-badge&labelColor=0F172A" alt="MIT License" /></a>
  <a href="https://github.com/MarcelTm1/MARCEL/stargazers"><img src="https://img.shields.io/github/stars/MarcelTm1/MARCEL?style=for-the-badge&color=FACC15&labelColor=0F172A" alt="GitHub stars" /></a>
  <a href="https://github.com/MarcelTm1/MARCEL/issues"><img src="https://img.shields.io/github/issues/MarcelTm1/MARCEL?style=for-the-badge&color=A78BFA&labelColor=0F172A" alt="GitHub issues" /></a>
</p>

<p align="center">
  <strong>MARCEL</strong> is a polished, touch-friendly visual setup for <a href="https://termux.dev/">Termux</a>. It brings a midnight-blue terminal palette, a practical extra-key bar, and a compact Bash prompt—without root access, plugins, or opaque one-line installers.
</p>

## Overview

MARCEL is designed for people who use Termux as a real workspace. The goal is not to add unnecessary frameworks; it is to make the terminal feel focused, readable, and fast on a phone.

| Component | What it adds |
| :-- | :-- |
| **Midnight palette** | High-contrast navy, cyan, and violet colors for long sessions. |
| **Mobile key bar** | Two rows with navigation, modifiers, and editor-friendly symbols. |
| **Bash prompt** | A minimal two-line prompt with the current user and directory. |
| **Welcome card** | A small, non-intrusive greeting with a built-in `marcel-help` command. |
| **Safe installer** | Timestamped backups before every installation; no root and no remote shell piping. |

> MARCEL changes only `~/.termux/colors.properties`, `~/.termux/termux.properties`, `~/.termux/marcel-prompt.sh`, and one clearly marked block in `~/.bashrc`. Existing versions of those files are copied to `~/.marcel-backups/<timestamp>/` first.

## Install

Termux stores terminal preferences in `~/.termux/termux.properties`; after editing, they can be applied with `termux-reload-settings` or by restarting Termux.[1] The following commands clone the repository locally so that you can inspect the installer before running it.

```bash
pkg update && pkg install -y git
git clone https://github.com/MarcelTm1/MARCEL.git
cd MARCEL
bash scripts/install.sh
```

After the installer finishes, open a new Termux session or run:

```bash
exec bash
```

## What you get

```text
╭─[u0_a123@termux]─[~]
╰─❯
```

The extra-key row is optimized for common command-line navigation and editing:

```text
ESC  /  -  HOME  UP  END  :
TAB  CTRL  ALT  LEFT  DOWN  RIGHT  ~
```

Several keys offer a useful swipe-up alternative. For example, swipe up on `LEFT` for `HOME`, or on `UP` for `PGUP`.

## Commands

| Command | Purpose |
| :-- | :-- |
| `marcel-help` | Shows the available MARCEL shortcuts and editing hints. |
| `marcel-welcome` | Shows the welcome card again. |
| `termux-reload-settings` | Reloads terminal colors and extra keys after you modify a Termux configuration file.[1] |

## Customization

MARCEL is intentionally plain text and easy to adapt. Copy a configuration file, change it, then reload the settings.

```bash
nano ~/.termux/colors.properties
nano ~/.termux/termux.properties
termux-reload-settings
```

The Termux configuration format uses simple `key=value` properties. The included extra-key syntax follows the examples in the official Termux configuration template.[2]

## Update

```bash
cd ~/MARCEL
git pull --ff-only
bash scripts/install.sh
```

A new backup is created at every install or update, so your previous setup remains available under `~/.marcel-backups/`.

## Remove

To remove the MARCEL prompt integration while keeping the current colors and extra-key layout, run:

```bash
cd ~/MARCEL
bash scripts/install.sh --uninstall
exec bash
```

The command removes only the MARCEL-managed Bash block and prompt file. To restore an earlier configuration, copy the desired files from `~/.marcel-backups/<timestamp>/` back into `~/.termux/`, then run `termux-reload-settings`.

## Contributing

Ideas, improvements, and device-specific feedback are welcome. Please open an [issue](https://github.com/MarcelTm1/MARCEL/issues) with your Termux version, Android version, and a clear description of the behaviour you observed. For code changes, create a focused pull request with a concise explanation of the improvement.

## License

Distributed under the [MIT License](LICENSE).

## References

[1] [Termux Wiki — Terminal Settings](https://wiki.termux.com/wiki/Terminal_Settings)  
[2] [termux/termux-tools — default `termux.properties`](https://github.com/termux/termux-tools/blob/master/termux.properties)

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0B1020,45:1E3A8A,100:06B6D4&height=110&section=footer" alt="Decorative footer" width="100%" />
</p>
