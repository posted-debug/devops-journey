#!/usr/bin/env bash

# Завершать скрипт при ошибках и обращении к неопределенным переменным
set -euo pipefail

# Порог заполненности в процентах (по умолчанию 80)
THRESHOLD="${1:-80}"

# Проверка: передано ли целое число от 1 до 100
if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]] || (( THRESHOLD < 1 || THRESHOLD > 100 )); then
    echo "Ошибка: укажите корректный процент от 1 до 100." >&2
    echo "Использование: $0 [порог_в_процентах]" >&2
    exit 1
fi

echo "Проверка дисков (порог: ${THRESHOLD}%)..."
ALERT_COUNT=0

# df -Ph: -P гарантирует вывод в одну строку, -h делает размеры читаемыми (K/M/G)
# awk: пропускает заголовок (NR>1), игнорирует виртуальные ФС и печатает нужные колонки
while read -r fs size used avail use_pct mount; do
    # Отрезаем символ '%' с конца строки средствами самого Bash (например, "85%" -> "85")
    usage="${use_pct%%%}"

    # Сравниваем текущую заполненность с порогом
    if (( usage >= THRESHOLD )); then
        echo "[!] ВНИМАНИЕ: Раздел $mount ($fs) заполнен на ${usage}% (Занято: $used из $size, Свободно: $avail)"
        ALERT_COUNT=$((ALERT_COUNT + 1))
    fi
done < <(df -Ph | awk 'NR>1 && $1 !~ /^(tmpfs|devtmpfs|udev|overlay|none)$/ {print $1, $2, $3, $4, $5, $6}')

# Итоговый статус
if (( ALERT_COUNT == 0 )); then
    echo "[OK] Все разделы в норме."
else
    echo "Найдено проблемных разделов: $ALERT_COUNT"
    exit 1
fi
