# Telegram Theme Noctalia

[🇷🇺 Русский](README_RU.md) | [🇺🇸 English](README.md)
<p align="center">
  <img src="blue.png" width="30%">
  <img src="green.png" width="30%">
  <img src="orange.png" width="30%">
</p>

Скрипт для автоматической генерации и обновления темы Telegram Desktop на основе цветов из Noctalia.

## Установка

Самый простой способ установить скрипт и все зависимости (Python 3, Pillow) — выполнить эту команду в терминале:

```bash
curl -sSL https://raw.githubusercontent.com/Alexandr-Sol/telegram-theme-noctalia/master/install.sh | bash
```

Эта команда:
1. Установит нужные системные пакеты (поддерживаются Arch, Debian/Ubuntu, Fedora).
2. Скачает скрипт в `~/.local/bin/`.
3. Сделает его исполняемым.
4. Запустит первичную настройку.

## Настройка хука в Noctalia

Чтобы тема в Telegram обновлялась автоматически при смене цветов в Noctalia, нужно добавить хук:

1. Откройте настройки Noctalia.
2. Перейдите в раздел **Хуки** (Hooks) -> **Генерация цвета** (Color Generation).
3. Добавьте следующую команду:
   ```bash
   ~/.local/bin/telegram-theme-noctalia pack
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
- `~/.local/bin/telegram-theme-noctalia pack` — сгенерировать ZIP-архив темы `noctalia.tdesktop-theme` (обычно вызывается хуком).
- `~/.local/bin/telegram-theme-noctalia paths` — показать текущие пути к файлам конфигурации, цветам и результату.

## Удаление

Чтобы полностью удалить скрипт, конфигурацию и сгенерированные файлы, выполните две команды:

```bash
~/.local/bin/telegram-theme-noctalia uninstall
rm ~/.local/bin/telegram-theme-noctalia
```
