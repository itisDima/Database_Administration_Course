# Домашнее задание №4. Скрипт создания хранимой процедуры.
Исходная схема БД для выполнения ДЗ - демонстрационная БД авиаперевозок PostreSQL, создание которой переписана под СУБД Oracle. Схема БД выглядит следующим образом:
![схема авиа](https://github.com/itisDima/database_administration_course/assets/140591592/7d04427b-9d0d-46a0-a0be-197709a44fa6)
Дз №3. Создать хранимую процедуру. 

Этот код представляет собой хранимую процедуру Business_count_tickets, которая принимает два параметра типа TIMESTAMP. В процедуре происходит следующее:

1. Удаляются все записи из таблицы TICKET_FLIGHTSSSS.
2. Выполняется коммит транзакции.
3. Инициализируется переменная v_temp со значением 0.
4. Для каждой записи, полученной из запроса, где подсчитывается количество билетов с условием FARE_CONDITIONS = 'Business' и датами вылета и прилета равными p_date_from и p_date_to, выполняется следующее:
    - Значение FARE_CONDITIONS записывается в переменную v_temp.
    - Вставляется новая запись в таблицу TICKET_FLIGHTSSSS с информацией о рейсе.
    - Выполняется коммит транзакции.
5. После завершения цикла вставляется запись в таблицу log_table с информацией о датах, количестве вставленных строк, дате завершения процедуры и флаге успешного выполнения.
6. Выполняется коммит транзакции.
7. В случае возникновения ошибки (исключения) в блоке EXCEPTION, также вставляется запись в таблицу log_table с информацией о датах, количестве вставленных строк, дате завершения процедуры и флаге неуспешного выполнения.