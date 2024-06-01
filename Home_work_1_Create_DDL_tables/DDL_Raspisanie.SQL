CREATE TABLE Raspisanie
         (Number_zapici char(10) PRIMARY KEY,
          Date_ date,
          Start_time date,
          End_time date,
          id_uslugi char(10),
          id_employee char(10),
          CONSTRAINT Uslugi_Raspisanie_fk FOREIGN KEY (id_uslugi)
                     REFERENCES Uslugi(id_uslugi),
          CONSTRAINT Employee_Raspisanie_fk FOREIGN KEY (id_employee)
                     REFERENCES Employee(id_employee));