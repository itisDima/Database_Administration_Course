CREATE TABLE Predostablenie_uslugi
         (id_employee char(10),
          id_uslugi char(10),
          CONSTRAINT Predostablenie_uslugi_pk PRIMARY KEY (id_employee, id_uslugi),
          CONSTRAINT Employee_Predostablenie_uslugi_fk FOREIGN KEY (id_employee)
                     REFERENCES Employee(id_employee),
          CONSTRAINT Uslugi_Predostablenie_uslugi_fk FOREIGN KEY (id_uslugi)
                     REFERENCES Uslugi(id_uslugi));