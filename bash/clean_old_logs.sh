#!/bin/bash
# Удаляет .log-файлы старше N суток (без захода во вложенные каталоги).
# Использование: ./clean_old_logs.sh [-n] <каталог> [дней]
#   -n     пробный запуск: показать, что будет удалено, но ничего не удалять
#   дней   по умолчанию 3

set -u

DRY_RUN=0
if [ "${1:-}" = "-n" ]; then
    DRY_RUN=1
    shift
fi

TARGET_DIR="${1:-}"
DAYS="${2:-3}"

# Каталог передан?
if [ -z "$TARGET_DIR" ]; then
    echo "Использование: $0 [-n] <каталог> [дней]" >&2
    exit 2
fi

# Каталог существует?
if [ ! -d "$TARGET_DIR" ]; then
    echo "Ошибка: каталог $TARGET_DIR не найден" >&2
    exit 1
fi

# Дни — целое число?
if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: число дней должно быть целым числом" >&2
    exit 1
fi

# -mmin считает в минутах: дни * 1440 = ровно N суток.
# -print0 + mapfile -d '' — чтобы не ломаться на именах с пробелами.
mapfile -d '' FILES < <(find "$TARGET_DIR" -maxdepth 1 -type f -name '*.log' \
    -mmin +$((DAYS * 1440)) -print0)

if [ "${#FILES[@]}" -eq 0 ]; then
    echo "Удалять нечего"
    exit 0
fi

echo "Файлы старше $DAYS сут.:"
printf '  %s\n' "${FILES[@]}"

if [ "$DRY_RUN" -eq 1 ]; then
    echo "Пробный запуск: найдено ${#FILES[@]}, ничего не удалено"
    exit 0
fi

rm -- "${FILES[@]}"
echo "Удалено файлов: ${#FILES[@]}"
