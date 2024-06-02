--drop table seat
CREATE TABLE seat AS SELECT * FROM SEATS
SELECT * FROM seat;
--drop table log_seats
SELECT * FROM SEATS;
CREATE TABLE log_seats -- таблица для записи логов триггера
  (log_id_trg NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id_trg VARCHAR(9),
  log_date_trg DATE,
  old_count_seats VARCHAR(9),
  new_count_seats VARCHAR(9),
  seats_num VARCHAR(9),
  code_air VARCHAR(9));
                       
-- create trigger                                
CREATE OR REPLACE TRIGGER seats_validation 
AFTER INSERT ON seat 
FOR EACH ROW 
DECLARE 
  v_fare_conditions seat.fare_conditions%TYPE; 
BEGIN 
  v_fare_conditions := :NEW.FARE_CONDITIONS; 
  IF v_fare_conditions NOT IN ('Economy', 'Comfort', 'Business') THEN 
    RAISE_APPLICATION_ERROR(-20001, 'Недопустимое значение fare_conditions!'); 
  ELSE 
    INSERT INTO log_seats 
    (user_id_trg, log_date_trg, old_count_seats, new_count_seats, seats_num, code_air) 
    VALUES 
    (USER, SYSDATE, NULL, NULL, :NEW.SEAT_NO, :NEW.AIRCRAFT_CODE); 
  END IF; 
END seat_log_trg;   
-- insert test data
INSERT INTO seat(AIRCRAFT_CODE, SEAT_NO, FARE_CONDITIONS)
VALUES ('CR2', '32R', 'Ecss');
-- select logs tables
SELECT * FROM log_seats;