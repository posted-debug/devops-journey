# Linux

Изучаю Linux как основу для DevOps. Старт: 23 октября 2026.

## Источники

- Яндекс, «Основы Linux» — пройден целиком.
- Брайан Уорд, «Внутреннее устройство Linux» — главы 1–3 прочитаны, глава 4 до 4.2.1, глава 9 (сеть) до 9.12. Дальше читаю не подряд, а главу под тему недели.
- OverTheWire Bandit — уровни 0–10.
- vimtutor — пройден.

## Изучено

**Неделя 1**

- Терминал: устройство команд, история, справка `man` и `--help`.
- Файлы и каталоги: `ls`, `cd`, `pwd`, `cp`, `mv`, `rm`, `mkdir -p`, `touch`, `cat`.
- Файловая система: пути, основные каталоги, inode, жёсткие и символические ссылки.
- Переменные окружения, `PATH`, алиасы.
- Просмотр и архивы: `less`, `head`, `tail`, `tar`.
- Поиск: `find`, `grep`, `wc`, основы регулярных выражений.
- Потоки и коды возврата: `>`, `>>`, `2>`, `2>&1`, `/dev/null`, `$?`.
- Логика и подстановки: `|`, `&&`, `||`, `$(...)`, `{1..6}`.
- Редакторы: nano, Vim. tmux. Основы SSH.

**Неделя 2**

- Права: `rwx`, числовая запись (r=4, w=2, x=1), `chmod`, почему скрипту нужно `r` + `x`, а не только `x`.
- `umask`: файлы от 666, каталоги от 777; расчёт umask под нужные права; действует до конца сессии.
- Кавычки: одинарные — буквально, двойные — с подстановкой `$VAR` и `$(...)`.
- Процессы: `ps aux`, `ps -ef`, столбцы, состояния R/S/D/T/Z.
- Обработка текста: `awk` (поля, условия, `END`), `sort`, `uniq -c`, основы `sed`.
- Первые bash-скрипты: `#!/bin/bash`, `if [ ]`, `exit`, переменные, `-d`, `-z`.
- Устройства: блочные, символьные, каналы, сокеты; `/dev` как виртуальная ФС; `/dev/null`, `/dev/zero`, `/dev/urandom`.
- `dd` (`if`, `of`, `bs`, `count`), `mount`/`umount`, `lsblk`, имена дисков `sd*`, `nvme*`, `vd*`.

**Неделя 3**

- Уорд, глава 3: типы файлов устройств, major/minor, sysfs (`/sys/devices`, `/sys/block`), `udevadm info` и `monitor`, devtmpfs и правила udev, имена устройств (`sd*`, `vd*`, `nvme*`, `dm-*`, `tty*`, `pts`), SCSI и `lsscsi`.
- Уорд, глава 4: таблицы разделов MBR и GPT, основные/расширенные/логические разделы, `parted -l`, `fdisk`, `blockdev --rereadpt`, выравнивание разделов на SSD, VFS.
- Процессы и сигналы: `ps aux`, `top`, `kill`, `nohup`, `jobs`, `&`, `fg`; SIGTERM против SIGKILL; зомби и сироты.
- Уорд, глава 9 до 9.12: слои сети, TCP и UDP, IP, маски и CIDR, маршруты и шлюз (`ip route`), `ping`, `traceroute`, `dig`, интерфейсы (`ip a`), netplan и NetworkManager, `/etc/hosts`, `/etc/resolv.conf`, `/etc/nsswitch.conf`. Вместо старых `ifconfig`/`route`/`netstat` — `ip` и `ss`.
- Скрипты: `check_disk.sh` (разбор `df -P` через awk, `${var%%%}`, `while read` + `< <(...)`), `backup_dir.sh` (`tar -C`, `realpath`, имя архива с датой), `set -euo pipefail`.

## Дальше

Блок A по плану v3 (недели 3–6):

- systemd: `systemctl`, `journalctl`, свой unit-файл.
- Пользователи, группы, `sudo`; suid/sgid, sticky bit.
- Диски: `df` против `du`, `df -i`, `lsof +L1`.
- `apt`, `cron`, ssh-ключи, `~/.ssh/config`, `scp`, `rsync`.
- Bash каждый день, awk и sed на логе nginx, ротация в `backup_dir.sh`.
- Bandit до 20, Git-минимум.

Потом блок B — сети до конца (DNS, HTTP, TLS, файрвол).

## Карточки

- [Шпаргалка по командам](../notes/LINUX-cheatsheet.md)
- [Задачи на понимание: права, потоки, find, grep, awk, sed](../notes/LINUX-practice.md)
- [Уорд, главы 1–4](../notes/WARD-cards.md)
- [Сеть: Уорд, глава 9](../notes/NETWORK-cheatsheet.md)

## Практика

- [Лаба 2: файлы, поиск и логи](labs/lab2-files-and-logs/)
- [Bash-скрипты](../bash/)
