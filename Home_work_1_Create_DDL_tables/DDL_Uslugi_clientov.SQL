CREATE TABLE Uslugi_clientov
         (id_client char(10),
          id_uslugi char(10),
          CONSTRAINT Uslugi_clientov_pk PRIMARY KEY (id_client, id_uslugi),
          CONSTRAINT Clientt_uslugi_clientov_fk FOREIGN KEY (id_client)
                     REFERENCES Clientt(id_client),
          CONSTRAINT uslugi_uslugi_clientov_fk FOREIGN KEY (id_uslugi)
                     REFERENCES Uslugi(id_uslugi));