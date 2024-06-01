CREATE TABLE Clientt
         (id_client char(10) PRIMARY KEY,
          Full_name varchar2(255),
          Date_of_birth date,
          Passport_data char(10),
          Phone_number varchar2(255) NULL,
          Health_Group char(1));