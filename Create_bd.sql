CREATE TABLE Clientt
         (id_client char(10) PRIMARY KEY,
          Full_name varchar2(255),
          Date_of_birth date,
          Passport_data char(10),
          Phone_number varchar2(255) NULL,
          Health_Group char(1));                 
CREATE TABLE Uslugi
         (id_uslugi char(10) PRIMARY KEY,
          Nazvanie varchar2(255),
          Max_number_of_part char(10) NULL,
          Dlitelnost_zanyatiya varchar2(255), 
          Nalichie_oborydovania varchar2(255));
CREATE TABLE Uslugi_clientov
         (id_client char(10),
          id_uslugi char(10),
          CONSTRAINT Uslugi_clientov_pk PRIMARY KEY (id_client, id_uslugi),
          CONSTRAINT Clientt_uslugi_clientov_fk FOREIGN KEY (id_client)
                     REFERENCES Clientt(id_client),
          CONSTRAINT uslugi_uslugi_clientov_fk FOREIGN KEY (id_uslugi)
                     REFERENCES Uslugi(id_uslugi));  
CREATE TABLE Employee 
         (id_employee char(10) PRIMARY KEY,
          Full_name varchar2(255),
          Address varchar2(255), 
          Phone_number varchar2(255),
          Post varchar2(255),
          Email varchar2(255),
          Salary varchar2(255),
          Date_of_birth date);  
CREATE TABLE Predostablenie_uslugi
         (id_employee char(10),
          id_uslugi char(10),
          CONSTRAINT Predostablenie_uslugi_pk PRIMARY KEY (id_employee, id_uslugi),
          CONSTRAINT Employee_Predostablenie_uslugi_fk FOREIGN KEY (id_employee)
                     REFERENCES Employee(id_employee),
          CONSTRAINT Uslugi_Predostablenie_uslugi_fk FOREIGN KEY (id_uslugi)
                     REFERENCES Uslugi(id_uslugi));
CREATE TABLE Abonement
         (id_abonement char(10) PRIMARY KEY,
          Start_date date,
          End_date date,
          Dopysk_v_bassein varchar2(255) NULL,
          id_client char(10),
          CONSTRAINT Clientt_Abonement_fk FOREIGN KEY (id_client)
                     REFERENCES Clientt(id_client));
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
