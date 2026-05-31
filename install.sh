#!/usr/bin/env bash
set -e

echo "Starting installation of telegram-theme-noctalia..."

# 1. Install dependencies
echo "Checking dependencies (Python 3 and Pillow)..."
if command -v python3 >/dev/null 2>&1 && python3 -c "import PIL" >/dev/null 2>&1; then
    echo "Dependencies are already installed. Skipping package manager step."
else
    echo "Dependencies missing. Attempting to install via package manager..."
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --needed python python-pillow
    elif command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y python3 python3-pil
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y python3 python3-pillow
    else
        echo "Warning: Unsupported package manager. Please make sure Python 3 and Pillow are installed manually."
    fi
fi

# 2. Setup directory
mkdir -p ~/.local/bin

# 3. Download the script
echo "Downloading telegram-theme-noctalia..."
curl -sSL https://raw.githubusercontent.com/Alexandr-Sol/telegram-theme-noctalia/master/telegram-theme-noctalia -o ~/.local/bin/telegram-theme-noctalia
chmod +x ~/.local/bin/telegram-theme-noctalia

# 4. Generate config and run setup
echo "Setting up configuration..."
CONFIG_DIR="$HOME/.config/telegram-theme-noctalia"
CONFIG_FILE="$CONFIG_DIR/config"
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
    cat << 'EOF' > "$CONFIG_FILE"
[paths]
# JSON с цветами, сгенерированный Noctalia
colors = ~/.config/noctalia/colors.json
# Итоговый ZIP с темой для Telegram
output = ~/.cache/telegram-theme-noctalia/noctalia.tdesktop-theme

[pack]
# Генерировать тайловый PNG-паттерн в качестве фона чатов.
# Требует Python-пакет Pillow.
background = true
EOF
    echo "Created default config at $CONFIG_FILE"
fi

if [ -f "$HOME/.config/noctalia/colors.json" ]; then
    echo "Running first theme generation..."
    ~/.local/bin/telegram-theme-noctalia pack || true
fi

# 5. Check PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo ""
    echo "⚠️  WARNING: ~/.local/bin is not in your PATH."
    echo "You might want to add 'export PATH=\"\$HOME/.local/bin:\$PATH\"' to your ~/.bashrc or ~/.zshrc."
fi

echo ""
echo "✅ Installation complete!"
echo "Now go to Noctalia Settings -> Hooks -> Color Generation and add this command:"
echo "  ~/.local/bin/telegram-theme-noctalia pack"
