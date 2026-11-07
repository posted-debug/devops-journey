# devops-journey

Учусь на DevOps-инженера с нуля: Linux → сети → Bash и Python → Docker, CI/CD, мониторинг → Kubernetes.
Ближайшая цель — первая работа с Linux (поддержка хостинга или младший сисадмин), дальше — DevOps.

Старт: 23 октября 2026 · 2–3 часа в день

## Прогресс

**Этап 0 — подготовка**

- [x] Ubuntu в WSL2, GitHub, ssh-ключи
- [x] tmux: сессии, сплиты, detach/attach — [шпаргалка](notes/tmux-cheatsheet.md)
- [x] OverTheWire Bandit, уровни 0–10
- [x] vimtutor — [шпаргалка](notes/VIM-cheatsheet.md)

**Этап 1 — Linux, Python, Git** · в процессе

- [x] Хендбук Яндекса «Основы Linux» — пройден целиком
- [ ] Брайан Уорд, «Внутреннее устройство Linux» — главы 1–3, глава 4 в процессе — [карточки](notes/WARD-cards.md)
- [ ] Bandit до 20+ уровня
- [x] Права и umask — [практика](linux/linux.md)
- [x] Шпаргалка по командам — [карточки](notes/LINUX-cheatsheet.md), задачи на понимание — [карточки](notes/LINUX-practice.md)
- [x] Bash-скрипты: очистка логов, проверка дисков, бэкап каталога — [bash/](bash/)
- [ ] Процессы и сигналы, пользователи, systemd, cron
- [ ] Python
- [ ] Git

**Этап 2 — сервер и сети** · следующий

- [ ] Сети: модель OSI, TCP/IP, DNS, HTTP — главы Уорда про сети
- [ ] VPS: вход по SSH-ключам, без root, ufw, fail2ban
- [ ] Веб-стек: nginx как прокси перед Apache, PHP, MySQL, WordPress
- [ ] Домен, DNS-записи (A, CNAME, MX, TXT), HTTPS через Let's Encrypt
- [ ] Журнал поломок: 502, 403, просроченный сертификат, DNS, полный диск, упавшая БД
- [ ] Разбор логов nginx скриптом: топ IP, ошибки 5xx, топ URL
- [ ] Мониторинг: проверка сайта с алертом в Telegram

**Этап 3 — Docker и Docker Compose**

**Этап 4 — CI/CD и Ansible**

**Этап 5 — мониторинг: Prometheus и Grafana**

**Этап 6 — Kubernetes**

Подробно о том, что изучено, — в [linux/linux.md](linux/linux.md).

## Структура

| Папка | Что там |
| --- | --- |
| [`linux/`](linux/) | прогресс по Linux и практические лабы |
| [`bash/`](bash/) | скрипты автоматизации |
| [`python/`](python/) | утилиты и CLI-скрипты |
| [`notes/`](notes/) | шпаргалки и карточки для повторения |

## Как учусь

- Команды и код пишу руками, нейросеть только объясняет и проверяет.
- Каждую тему сразу отрабатываю в терминале.
- Карточки для интервального повторения лежат прямо в шпаргалках (Obsidian, плагин Spaced Repetition).
