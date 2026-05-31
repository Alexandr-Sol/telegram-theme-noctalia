# Telegram Theme Noctalia

[🇷🇺 Русский](README_RU.md) | [🇺🇸 English](README.md)
<p align="center">
  <img src="blue.png" width="30%">
  <img src="green.png" width="30%">
  <img src="orange.png" width="30%">
</p>

Скрипт для автоматической генерации и обновления темы Telegram Desktop на основе цветов из Noctalia.

## Зависимости

- **Python 3**
- **Pillow** (библиотека для работы с изображениями, нужна для генерации паттерна фона)

Рекомендуется устанавливать Pillow через системный пакетный менеджер:

```bash
# Для Arch Linux / CachyOS / Manjaro:
sudo pacman -S python python-pillow

# Для Ubuntu / Debian:
sudo apt install python3 python3-pil
```

## Установка

Запустите первоначальную настройку (сделайте скрипт исполняемым `chmod +x`, если необходимо):
```bash
/ПУТЬ_К_СКРИПТУ/telegram-theme-noctalia install
```

## Настройка хука в Noctalia

Чтобы тема в Telegram обновлялась автоматически при смене цветов в Noctalia, нужно добавить хук:

1. Откройте настройки Noctalia.
2. Перейдите в раздел **Хуки** (Hooks) -> **Генерация цвета** (Color Generation).
3. Добавьте следующую команду:
   ```bash
   /ПУТЬ_К_СКРИПТУ/telegram-theme-noctalia pack
   ```

## Применение темы в Telegram

При запуске команды `pack` скрипт генерирует архив с темой и сохраняет его по пути:
```
~/.cache/telegram-theme-noctalia/noctalia.tdesktop-theme
```

Чтобы применить тему:
1. Откройте файловый менеджер и найдите файл `noctalia.tdesktop-theme` в скрытой папке `~/.cache/telegram-theme-noctalia/`.
2. Перетащите этот файл в Telegram (например, в чат "Избранное").
3. Нажмите на отправленный файл в чате Telegram.
4. Появится окно предпросмотра темы — нажмите **"Применить"**.

Теперь при смене цветов в Noctalia файл темы будет автоматически обновляться, и Telegram сразу подхватит новые цвета.

## Использование

Доступные команды скрипта:
- `telegram-theme-noctalia install` — создать базовый конфиг и запустить первую генерацию.
- `telegram-theme-noctalia pack` — сгенерировать ZIP-архив темы `noctalia.tdesktop-theme` (обычно вызывается хуком).
- `telegram-theme-noctalia paths` — показать текущие пути к файлам конфигурации, цветам и результату.
- `telegram-theme-noctalia uninstall` — удалить конфиг и директорию с кэшем.
