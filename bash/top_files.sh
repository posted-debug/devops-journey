#!/bin/bash
# Показывает N самых больших файлов в каталоге (без захода во вложенные).
# Использование: ./top_files.sh [каталог] [количество]
# По умолчанию: текущий каталог, 3 файла.

set -u

TARGET_DIR="${1:-.}"
COUNT="${2:-3}"

# Каталог существует?
if [ ! -d "$TARGET_DIR" ]; then
    echo "Ошибка: каталог $TARGET_DIR не найден" >&2
    exit 1
fi

# Количество — целое число больше нуля?
if ! [[ "$COUNT" =~ ^[0-9]+$ ]] || [ "$COUNT" -eq 0 ]; then
    echo "Ошибка: количество должно быть целым числом больше нуля" >&2
    exit 1
fi

# find печатает «размер<TAB>путь», sort сортирует по размеру,
# numfmt переводит байты в K/M/G
RESULT=$(find "$TARGET_DIR" -maxdepth 1 -type f -printf '%s\t%p\n' \
    | sort -rn \
    | head -n "$COUNT" \
    | numfmt --to=iec --field=1)

if [ -z "$RESULT" ]; then
    echo "В каталоге $TARGET_DIR нет файлов"
    exit 0
fi

echo "$RESULT"
