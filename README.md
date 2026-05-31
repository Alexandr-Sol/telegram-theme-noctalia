# Telegram Theme Noctalia

[🇷🇺 Русский](README_RU.md) | [🇺🇸 English](README.md)

<p align="center">
  <img src="blue.png" width="30%">
  <img src="green.png" width="30%">
  <img src="orange.png" width="30%">
</p>

A script for automatically generating and updating a Telegram Desktop theme based on Noctalia colors.

## Dependencies

- **Python 3**
- **Pillow** (image processing library, required for generating the background pattern)

It is recommended to install Pillow via your system package manager:

```bash
# For Arch Linux / CachyOS / Manjaro:
sudo pacman -S python python-pillow

# For Ubuntu / Debian:
sudo apt install python3 python3-pil
```

## Installation

Run the initial setup (make the script executable with `chmod +x` if necessary):
```bash
/PATH_TO_SCRIPT/telegram-theme-noctalia install
```

## Noctalia Hook Setup

To automatically update the Telegram theme when Noctalia colors change, you need to add a hook:

1. Open Noctalia settings.
2. Go to **Hooks** -> **Color Generation**.
3. Add the following command:
   ```bash
   /PATH_TO_SCRIPT/telegram-theme-noctalia pack
   ```
   *(Replace `/PATH_TO_SCRIPT/` with the actual path to the script).*

## Applying the Theme in Telegram

When the `pack` command runs, the script generates a theme archive and saves it at:
```
~/.cache/telegram-theme-noctalia/noctalia.tdesktop-theme
```

To apply the theme:
1. Open your file manager and find the `noctalia.tdesktop-theme` file in the hidden `~/.cache/telegram-theme-noctalia/` folder.
2. Drag and drop this file into Telegram (e.g., into "Saved Messages").
3. Click on the sent file directly in the Telegram chat.
4. A theme preview window will appear — click **"Apply"**.

Now, whenever the colors change in Noctalia, the theme file will automatically update, and Telegram will instantly apply the new colors!

## Usage

Available script commands:
- `/PATH_TO_SCRIPT/telegram-theme-noctalia install` — create the basic config and run the initial generation.
- `/PATH_TO_SCRIPT/telegram-theme-noctalia pack` — generate the `noctalia.tdesktop-theme` ZIP archive (usually triggered by a hook).
- `/PATH_TO_SCRIPT/telegram-theme-noctalia paths` — show current paths to the config, colors, and output file.
- `/PATH_TO_SCRIPT/telegram-theme-noctalia uninstall` — remove the config and cache directory.
