@echo off
:: Кодировка UTF-8, чтобы корректно отображался русский текст
chcp 65001 > nul

:: Формируем строку с текущей датой и временем (ГГГГ-ММ-ДД_ЧЧ-ММ)
set "current_time=%date:~10,4%-%date:~4,2%-%date:~7,2%_%time:~0,2%-%time:~3,2%"
:: Убираем случайные пробелы, если час состоит из одной цифры
set "current_time=%current_time: =0%"

echo Добавляем изменения...
git add .

echo Создаем коммит с именем "%current_time%"...
git commit -m "%current_time%"

echo Отправляем на сервер...
git push

echo Готово!
pause