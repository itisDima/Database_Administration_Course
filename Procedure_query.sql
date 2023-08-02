create or replace PROCEDURE Business_count_tickets (p_date_from IN TIMESTAMP,
p_date_to IN TIMESTAMP)
IS
    v_temp NUMBER;
BEGIN 
    DELETE FROM TICKET_FLIGHTSSSS;
    COMMIT;
    v_temp:= 0;
    FOR curs_tic IN (SELECT 
                        COUNT(TICKET_FLIGHTS.FARE_CONDITIONS) AS FARE_CONDITIONS,
                        FLIGHTS.FLIGHT_ID AS FLIGHT_ID,
                        FLIGHTS.SCHEDULED_DEPARTURE AS SCHEDULED_DEPARTURE,
                        FLIGHTS.SCHEDULED_ARRIVAL AS SCHEDULED_ARRIVAL,
                        FLIGHTS.DEPARTURE_AIRPORT AS DEPARTURE_AIRPORT,
                        FLIGHTS.ARRIVAL_AIRPORT AS ARRIVAL_AIRPORT
                    FROM FLIGHTS
                    LEFT JOIN TICKET_FLIGHTS
                    ON FLIGHTS.FLIGHT_ID = TICKET_FLIGHTS.FLIGHT_ID
                    WHERE FARE_CONDITIONS = 'Business' AND SCHEDULED_DEPARTURE = p_date_from AND
                                                SCHEDULED_ARRIVAL = p_date_to 
                    GROUP BY FLIGHTS.FLIGHT_ID,
                             SCHEDULED_DEPARTURE,
                             SCHEDULED_ARRIVAL,
                             DEPARTURE_AIRPORT,
                             ARRIVAL_AIRPORT) 
                    LOOP

                                v_temp := curs_tic.FARE_CONDITIONS ;
                            INSERT INTO TICKET_FLIGHTSSSS
                            VALUES(curs_tic.FARE_CONDITIONS,
                                   curs_tic.FLIGHT_ID,
                                   curs_tic.SCHEDULED_DEPARTURE,
                                   curs_tic.SCHEDULED_ARRIVAL,
                                   curs_tic.DEPARTURE_AIRPORT,
                                   curs_tic.ARRIVAL_AIRPORT);
                            COMMIT;

                    END LOOP;
                    INSERT INTO log_table(from_date, too_date, rows_inserted, proc_end, success_flag)
                    VALUES(p_date_from, p_date_to, v_temp, sysdate, 'Y');
                    COMMIT;
                    EXCEPTION 
                    WHEN OTHERS THEN
                        BEGIN
                        INSERT INTO log_table(from_date, too_date, rows_inserted, proc_end, success_flag)
                        VALUES(p_date_from, p_date_to, v_temp, sysdate, 'N');
                        COMMIT;
                        END;
END; 