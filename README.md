# devops-journey

Учусь на DevOps с нуля. Начал 23.10.2026, занимаюсь 2–3 часа в день.

План такой: сначала первая работа в L1-поддержке хостинга или облака (цель — март–май 2027), потом сисадмин, потом DevOps, примерно через 2–3 года от старта. На стажировку в Яндекс больше не целюсь, поэтому алгоритмы и Go выкинул из ядра. Учу то, что реально спрашивают на L1–L2: Linux, сети, Bash, Nginx и разбор поломок.

Следующий этап начинается не по дате, а когда закрыты «ворота» — проверяемые критерии в конце каждого этапа.

## Где я сейчас

**Этап 1 — фундамент до первой работы.** Сейчас блок A.

Уже было:

- [x] Ubuntu в WSL2, GitHub, ssh-ключи
- [x] tmux — [шпаргалка](notes/tmux-cheatsheet.md), vimtutor — [шпаргалка](notes/VIM-cheatsheet.md)
- [x] Bandit 0–10
- [x] Хендбук Яндекса «Основы Linux»
- [x] Права, umask, inode, жёсткие и символические ссылки
- [x] Пайпы, grep / sed / awk / find / xargs, регулярки — [шпаргалка](notes/LINUX-cheatsheet.md), [задачи](notes/LINUX-practice.md)
- [x] Уорд, главы 1–3 — [карточки](notes/WARD-cards.md)

**Блок A (недели 3–6): Linux руками и Bash**

- [x] Процессы и сигналы: ps, top, kill, nohup, jobs; SIGTERM против SIGKILL
- [ ] systemd: systemctl, journalctl, свой unit-файл
- [ ] Пользователи, группы, sudo; suid/sgid, sticky bit
- [ ] Диски: df против du, df -i, lsblk, mount; lsof +L1
- [ ] apt, cron, ssh: ключи, ~/.ssh/config, scp, rsync
- [ ] Bash по 30 минут каждый день
- [ ] Каждый скрипт проходит shellcheck, trap
- [ ] awk и sed на настоящем логе nginx
- [x] Скрипт проверки места на диске — [check_disk.sh](bash/check_disk.sh)
- [ ] Скрипт бэкапа папки с ротацией (бэкап есть — [backup_dir.sh](bash/backup_dir.sh), ротации пока нет)
- [ ] Скрипт разбора лога nginx
- [ ] Bandit до 20
- [ ] Git: commit, branch, merge, .gitignore

**Блок B (недели 7–10): сети** — уже начал, Уорд гл. 9 до 9.12 — [шпаргалка](notes/NETWORK-cheatsheet.md)

**Блок C (недели 12–15): веб-стек на своём VPS** — nginx, домен, HTTPS, база, ломаю и чиню

**Блок D (недели 16–18): Docker, Zabbix, заявки**

Ворота 1: сайт на VPS по HTTPS, 5+ своих скриптов через shellcheck, 10 разобранных поломок, без гугла диагностирую «сайт не открывается».

**Дальше**

- Этап 2 — L1–L2 поддержка: 6–12 месяцев стажа, параллельно Python, Ansible, Git глубже
- Этап 3 — сисадмин: Ansible, PostgreSQL, GitLab CI, Zabbix / Prometheus / Grafana
- Этап 4 — DevOps: Kubernetes + Helm, Terraform, Yandex Cloud

Подробно, что изучено по неделям, — в [linux/linux.md](linux/linux.md).

## Структура

| Папка | Что там |
| --- | --- |
| [`linux/`](linux/) | прогресс по Linux и практические лабы |
| [`bash/`](bash/) | мои скрипты |
| [`python/`](python/) | пока пусто, Python после выхода на L1 |
| [`notes/`](notes/) | шпаргалки и карточки |

## Как учусь

- Команды и код пишу сам, нейросеть только объясняет и проверяет.
- Каждую тему сразу пробую в терминале.
- Повторяю карточками в Obsidian (Spaced Repetition).
