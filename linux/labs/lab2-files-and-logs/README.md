# Лаба 2: файлы, поиск и логи

Песочница для практики команд из хендбука Яндекса «Основы Linux»:
логи с уровнями INFO / WARNING / ERROR, конфиг и его бэкап, пустые файлы.

Примеры задач на этих файлах:

```bash
grep ERROR logs/*.log                        # все ошибки во всех логах
grep -c WARNING logs/app.log                 # сколько предупреждений
find . -type f -empty                        # пустые файлы
diff config/app.conf backup/app.conf.bak     # отличается ли конфиг от бэкапа
cat logs/*.log | awk '{print $1}' | sort | uniq -c   # сколько строк каждого уровня
```
