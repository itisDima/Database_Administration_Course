CREATE TABLE Abonement
         (id_abonement char(10) PRIMARY KEY,
          Start_date date,
          End_date date,
          Dopysk_v_bassein varchar2(255) NULL,
          id_client char(10),
          CONSTRAINT Clientt_Abonement_fk FOREIGN KEY (id_client)
                     REFERENCES Clientt(id_client));