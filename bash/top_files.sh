#!/bin/bash
mkdir -p ~/edu_rules/scripts

cat > ~/edu_rules/scripts/top_files.sh << 'EOF'
#!/bin/bash

TARGET_DIR="$HOME/edu_rules/big"

#Проверка существования каталога
if [ -d "$TARGET_DIR" ]; then

#Вывод файлов по размеру
ls -hsS "$TARGET_DIR" | grep -v "total" | head -n 3

#Если папка не обнаружена
else
echo "Папка не найдена" && exit 1

fi
EOF

cat > ~/edu_rules/scripts/clean_old_logs.sh << 'EOF'
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
EOF

ls -l ~/edu_rules/scripts
