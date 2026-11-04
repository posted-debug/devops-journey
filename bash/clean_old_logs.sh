#!/bin/bash

TARGET_DIR="$HOME/edu_rules/logs"

#Существует ли папка?

if [ ! -d "$TARGET_DIR" ]; then
echo "Папка $TARGET_DIR не найдена" >&2
exit 1
fi

#Поиск и проверка наличия файлов
FILES=$(find "$TARGET_DIR" -maxdepth 1 -name "*.log" -mtime +2)

#Выход, если нечего удалять
if [ -z "$FILES" ]; then
echo "Удалять нечего"
exit 0
fi

#Вывод списка файлов к удалению
echo "Файлы к удалению: $FILES"
echo "Всего удалено: $(echo "$FILES" | wc -l)"

#Удаление файлов
find "$TARGET_DIR" -maxdepth 1 -name "*.log" -mtime +2 -delete
