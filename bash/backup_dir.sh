#!/usr/bin/env bash

# Завершать скрипт при ошибках и обращении к неопределенным переменным
set -euo pipefail

# Аргументы: 1 — что бэкапим, 2 — куда сохраняем (по умолчанию текущая папка)
SRC_DIR="${1:-}"
DEST_DIR="${2:-.}"

# 1. Проверка: передан ли первый аргумент
if [[ -z "$SRC_DIR" ]]; then
    echo "Ошибка: не указан каталог для бэкапа." >&2
    echo "Использование: $0 <каталог_источник> [каталог_назначения]" >&2
    exit 1
fi

# 2. Проверка: существует ли исходный каталог
if [[ ! -d "$SRC_DIR" ]]; then
    echo "Ошибка: каталог '$SRC_DIR' не найден." >&2
    exit 1
fi

# Полные пути: realpath раскрывает ".", ".." и убирает слеш в конце ("my_dir/" -> "/home/.../my_dir")
SRC_CLEAN=$(realpath "$SRC_DIR")
DEST_CLEAN=$(realpath -m "$DEST_DIR")   # -m: каталога назначения может ещё не быть

# 3. Архив нельзя класть внутрь архивируемой папки: tar упадёт с "file changed as we read it"
if [[ "$DEST_CLEAN/" == "$SRC_CLEAN/"* ]]; then
    echo "Ошибка: каталог назначения находится внутри '$SRC_CLEAN'. Укажи другой." >&2
    exit 1
fi

# 4. Создаем каталог назначения, если его еще нет
mkdir -p "$DEST_CLEAN"

# Вытаскиваем отдельно имя папки и путь до нее
DIR_NAME=$(basename "$SRC_CLEAN")
PARENT_DIR=$(dirname "$SRC_CLEAN")

# Формируем штамп времени и итоговое имя файла
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="${DIR_NAME}_${TIMESTAMP}.tar.gz"
TARGET_PATH="${DEST_CLEAN}/${ARCHIVE_NAME}"

echo "Архивация '$SRC_CLEAN'..."

# 5. Создание архива:
# -c (create), -z (gzip), -f (file), -C (перейти в родительский каталог перед упаковкой)
tar -czf "$TARGET_PATH" -C "$PARENT_DIR" "$DIR_NAME"

# Узнаем размер итогового архива (вырезаем первое поле через awk)
SIZE=$(du -h "$TARGET_PATH" | awk '{print $1}')

echo "[OK] Бэкап создан: $TARGET_PATH (Размер: $SIZE)"
