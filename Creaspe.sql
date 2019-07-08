DROP TABLE auto PURGE;
DROP TABLE sponsoren PURGE;
DROP TABLE sponsoren_jeugd PURGE;
DROP TABLE wedstrijden_virtueel PURGE;
DROP TABLE wedstrijden PURGE;
DROP TABLE teams PURGE;
DROP TABLE boetebedragen PURGE;
DROP TABLE spelers PURGE;
DROP TABLE cursussen PURGE;
DROP TABLE cursisten PURGE;
DROP TABLE personen PURGE;
DROP TABLE medewerkers PURGE;
DROP TABLE locaties PURGE;
DROP TABLE producten PURGE;
DROP TABLE webadres PURGE;
DROP TABLE werknemers PURGE;
DROP TABLE kantoren PURGE;

CREATE TABLE kantoren	
( kantnr NUMBER(2) NOT NULL
, naam   VARCHAR2(15)
, plaats VARCHAR2(10)  );

INSERT INTO kantoren VALUES (10,'BOEKHOUDING','AMSTERDAM');
INSERT INTO kantoren VALUES (20,'ONDERZOEK','UTRECHT');
INSERT INTO kantoren VALUES (30,'VERKOOP','DEN HAAG');
INSERT INTO kantoren VALUES (40,'PRODUCTIE','ARNHEM');

ALTER TABLE kantoren ADD CONSTRAINT pk_kantoren PRIMARY KEY (kantnr);

CREATE TABLE werknemers 
( persnr  NUMBER(4) NOT NULL
, naam    VARCHAR2(10)
, functie VARCHAR2(9)
, mgr     NUMBER(4)
, sal     NUMBER(5)
, toeslag NUMBER(5)
, kantnr  NUMBER(2)
, PRIMARY KEY (persnr)
, CONSTRAINT werknemer_mgr FOREIGN KEY (mgr) REFERENCES werknemers(persnr)  );

ALTER TABLE werknemers DISABLE CONSTRAINT werknemer_mgr;
 
INSERT INTO werknemers VALUES (3381,'SMITS','KLERK',7902,2400,NULL,20);
INSERT INTO werknemers VALUES (3462,'ALKEMA','VERKOPER',4621,2600,300,30);
INSERT INTO werknemers VALUES (3518,'WALSTRA','VERKOPER',4621,2250,500,30);
INSERT INTO werknemers VALUES (3930,'PIETERS','MANAGER',6221,3975,NULL,20);
INSERT INTO werknemers VALUES (4510,'VERGEER','VERKOPER',4621,2250,1400,30);
INSERT INTO werknemers VALUES (4621,'KLAASEN','MANAGER',6221,3850,NULL,30);
INSERT INTO werknemers VALUES (5810,'HEUVEL','MANAGER',6221,3450,NULL,10);
INSERT INTO werknemers VALUES (5931,'SANDERS','ANALIST',3930,4000,NULL,20);
INSERT INTO werknemers VALUES (6221,'KRAAY','DIRECTEUR',NULL,6000,NULL,10);
INSERT INTO werknemers VALUES (6500,'DROST','VERKOPER',4621,2500,0,30);
INSERT INTO werknemers VALUES (6681,'ADELAAR','KLERK',5931,2100,NULL,20);
INSERT INTO werknemers VALUES (7900,'APPEL','KLERK',4621,1950,NULL,30);
INSERT INTO werknemers VALUES (7902,'VERMEULEN','ANALIST',3930,3900,NULL,20);
INSERT INTO werknemers VALUES (8222,'MANDERS','KLERK',5810,2300,NULL,10);

ALTER TABLE werknemers ENABLE CONSTRAINT werknemer_mgr;

CREATE INDEX i_werknemers_f ON werknemers(functie);

CREATE INDEX i_werknemers_s ON werknemers(sal);



CREATE TABLE spelers 
( spelnr  NUMBER(3)    NOT NULL
, naam    VARCHAR2(20)
, voorl   VARCHAR2(3)
, jaartoe NUMBER(4)
, plaats  VARCHAR2(10)
, bondsnr NUMBER(4)   );


INSERT INTO spelers VALUES ( 6,'Honing','R',2003,'Den Haag',8467 );
INSERT INTO spelers VALUES ( 44,'Bakker','E',2007,'Rijswijk',1124 );
INSERT INTO spelers VALUES ( 83,'Martens','PK',2008,'Utrecht',1608 );
INSERT INTO spelers VALUES ( 2,'van der Wal','R',2000,'Den Haag',2411 );
INSERT INTO spelers VALUES ( 27,'Cools','DD',2009,'Utrecht',2513 );
INSERT INTO spelers VALUES ( 104,'Kok','D',2011,'Utrecht',7060 );
INSERT INTO spelers VALUES ( 7,'Sorgdrager','GWS',2007,'Den Haag',null);
INSERT INTO spelers VALUES ( 57,'O''Neal','M',2011,'Den Haag',6409 );
INSERT INTO spelers VALUES ( 112,'Winterdijk','IP',2010,'Rotterdam',1319 );
INSERT INTO spelers VALUES ( 8,'Cools','C',2006,'Rijswijk',2983 );


CREATE TABLE teams  
( teamnr  NUMBER(2)   GENERATED ALWAYS AS IDENTITY
, spelnr  NUMBER(3)   NOT NULL
, divisie VARCHAR2(6) NOT NULL    );


INSERT INTO teams VALUES (DEFAULT,2,'ere');
INSERT INTO teams VALUES (DEFAULT,27,'tweede');


CREATE TABLE wedstrijden
( teamnr NUMBER(2) NOT NULL
, spelnr NUMBER(3) NOT NULL
, gewonnen NUMBER(3) DEFAULT(0) NOT NULL
, verloren NUMBER(3) DEFAULT(0) NOT NULL   );


INSERT INTO wedstrijden VALUES (1,6,9,1);
INSERT INTO wedstrijden VALUES (1,44,7,5);
INSERT INTO wedstrijden VALUES (1,83,3,3);
INSERT INTO wedstrijden VALUES (1,2,4,8);
INSERT INTO wedstrijden VALUES (1,57,5,0);
INSERT INTO wedstrijden VALUES (1,8,0,1);
INSERT INTO wedstrijden VALUES (2,27,11,2);
INSERT INTO wedstrijden VALUES (2,104,8,4);
INSERT INTO wedstrijden VALUES (2,112,4,8);
INSERT INTO wedstrijden VALUES (2,8,4,4);


CREATE TABLE boetebedragen
( boetenr NUMBER(2) NOT NULL
, spelnr  NUMBER(3) NOT NULL
, datum   DATE
, bedrag  NUMBER(7,2)    );

INSERT INTO boetebedragen
VALUES (1,6,to_date('07-JAN-2013 12:30:00' , 'DD-MON-YYYY HH24:MI:SS' ) ,200);
INSERT INTO boetebedragen
VALUES (2,44,to_date('17-FEB-2014 13:45:00' , 'DD-MON-YYYY HH24:MI:SS' ) , 100);
INSERT INTO boetebedragen
VALUES (3,27,to_date('28-NOV-2013 09:20:30' , 'DD-MON-YYYY HH24:MI:SS' ) ,100);
INSERT INTO boetebedragen
VALUES (4,104,to_date('19-JUN-2014 16:10:45' , 'DD-MON-YYYY HH24:MI:SS' ) , 50);
INSERT INTO boetebedragen
VALUES (5,44,to_date('07-JAN-2013 12:30:00' , 'DD-MON-YYYY HH24:MI:SS' ) ,200);
INSERT INTO boetebedragen
VALUES (6,8,to_date('07-JAN-2013 20:05:10' , 'DD-MON-YYYY HH24:MI:SS' ) ,200);
INSERT INTO boetebedragen
VALUES (7,44,to_date('18-OCT-2014 21:00:25' , 'DD-MON-YYYY HH24:MI:SS' ) , 30);
INSERT INTO boetebedragen
VALUES (8,27,to_date('08-JAN-2015 11:32:00' , 'DD-MON-YYYY HH24:MI:SS' ) , 75);



CREATE TABLE wedstrijden_virtueel
( teamnr NUMBER(2) NOT NULL
, spelnr NUMBER(3) NOT NULL
, gewonnen NUMBER(3) DEFAULT(0) NOT NULL
, verloren NUMBER(3) DEFAULT(0) NOT NULL  
, aantal AS (gewonnen+verloren)          );


INSERT INTO wedstrijden_virtueel VALUES (1,6,9,1,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (1,44,7,5,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (1,83,3,3,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (1,2,4,8,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (1,57,5,0,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (1,8,0,1,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (2,27,11,2,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (2,104,8,4,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (2,112,4,8,DEFAULT);
INSERT INTO wedstrijden_virtueel VALUES (2,8,4,4,DEFAULT);




CREATE TABLE sponsoren 
( id      VARCHAR2(4)
, bedrijf VARCHAR2(25)
, teamnr  NUMBER(3)
, bedrag  NUMBER(5)     );


INSERT INTO sponsoren VALUES ('11','VijfhartIT',1,10000);
INSERT INTO sponsoren VALUES ('12','Bouwnu',1,2000);
INSERT INTO sponsoren VALUES ('13','Garage Hoek',1,5000);
INSERT INTO sponsoren VALUES ('14','Bloemenland',2,1000);
INSERT INTO sponsoren VALUES ('15','Installatiebedrijf Numan',2,2000);
INSERT INTO sponsoren VALUES ('16','Makelaardij Tevreden',3,2000);
INSERT INTO sponsoren VALUES ('17','AA Computers',1,2000);
INSERT INTO sponsoren VALUES ('18','Berk Advocaten',4,1000);


CREATE TABLE sponsoren_jeugd  
( id     VARCHAR2(4)
, naam   VARCHAR2(25)
, team   VARCHAR2(3)
, bedrag NUMBER(5)     );


INSERT INTO sponsoren_jeugd VALUES ('11','Rijschool Opweg','A1',1000);
INSERT INTO sponsoren_jeugd VALUES ('12','VijfhartIT','B1',800);
INSERT INTO sponsoren_jeugd VALUES ('13','Slot Schilderwerken','C1',800);
INSERT INTO sponsoren_jeugd VALUES ('14','Slager Bakker','D1',500);
INSERT INTO sponsoren_jeugd VALUES ('15','Mediaexpo','E1',500);
INSERT INTO sponsoren_jeugd VALUES ('16','Tapijthal Fokkens','F1',500);
INSERT INTO sponsoren_jeugd VALUES ('17','Slot Schilderwerken','C2',500);
INSERT INTO sponsoren_jeugd VALUES ('18','Slot Schilderwerken','C3',500);
INSERT INTO sponsoren_jeugd VALUES ('19','123 Transport','E3',500);
INSERT INTO sponsoren_jeugd VALUES ('20','Veenstra Repro','F2',500);
INSERT INTO sponsoren_jeugd VALUES ('21','Vierhout Fietsen','F3',500);
INSERT INTO sponsoren_jeugd VALUES ('22','AA Computers','B2',500);
INSERT INTO sponsoren_jeugd VALUES ('23','Outdoor Sports Willem','D2',500);
INSERT INTO sponsoren_jeugd VALUES ('24','Tapijthal Fokkens','D3',500);
INSERT INTO sponsoren_jeugd VALUES ('25','Paal en Perk Hoveniers','E2',500);
INSERT INTO sponsoren_jeugd VALUES ('26','Makelaardij Tevreden','A2',500);







CREATE TABLE auto
( kenteken  VARCHAR2(8) NOT NULL
, chassisnr NUMBER(7)
, merk      VARCHAR2(12)
, prijs     NUMBER(7,2) DEFAULT 0   );

INSERT INTO auto VALUES ('FJ-13-ZP', 3456722, 'Honda', 25166.25);
INSERT INTO auto VALUES ('FB-12-GL', 3225661, 'Citroen', 12322.35);
INSERT INTO auto VALUES ('TS-43-GF', NULL, 'Volvo', 32415.32);



CREATE TABLE locaties	
( kantnr NUMBER(2) NOT NULL
, naam   VARCHAR2(15)
, plaats VARCHAR2(10) );

INSERT INTO locaties VALUES (15,'Administratie','Groningen');
INSERT INTO locaties VALUES (25,'Opleidingen','Assen');
INSERT INTO locaties VALUES (35,'Opleidingen','Zwolle');


CREATE TABLE medewerkers 
( persnr  NUMBER(4) NOT NULL
, naam    VARCHAR2(15)
, functie VARCHAR2(15)
, mgr     NUMBER(4)
, sal     NUMBER(5)
, kantnr  NUMBER(2)  );


INSERT INTO medewerkers VALUES (3381,'Alberts','Assistent',7902,2400,25);
INSERT INTO medewerkers VALUES (3462,'Venema','Docent',4621,3850,35);
INSERT INTO medewerkers VALUES (3518,'Vermeer','Docent',4621,3650,35);
INSERT INTO medewerkers VALUES (3930,'Willems','Manager',6221,3975,25);
INSERT INTO medewerkers VALUES (4510,'Boer','Docent',4621,3575,35);
INSERT INTO medewerkers VALUES (4621,'Braam','Manager',6221,3850,35);
INSERT INTO medewerkers VALUES (5810,'Velde','Manager',6221,3450,15);
INSERT INTO medewerkers VALUES (5931,'Mors','Docent',3930,4000,25);
INSERT INTO medewerkers VALUES (6221,'Poorta','Directeur',Null,6000,15);
INSERT INTO medewerkers VALUES (6500,'Westra','Docent',4621,3700,35);
INSERT INTO medewerkers VALUES (6681,'Pels','Assistent',5931,2100,25);
INSERT INTO medewerkers VALUES (7900,'Meerveld','Assistent',4621,1950,35);
INSERT INTO medewerkers VALUES (7902,'Dirks','Docent',3930,3900,25);
INSERT INTO medewerkers VALUES (8222,'Sietsma','Boekhouder',5810,2300,15);



CREATE TABLE personen 
( NAAM     VARCHAR2(20)
, STRAAT   VARCHAR2(20)
, NUMMER   NUMBER(4)
, POSTCODE VARCHAR2(6)
, PLAATS   VARCHAR2(20)
, NR       NUMBER(2)  );

INSERT INTO personen VALUES('Bloem','Kastanjelaan',23,'3511NM','UTRECHT',1);
INSERT INTO personen VALUES('Appel','Middellaan',37,'5611AM','EINDHOVEN',2);
INSERT INTO personen VALUES('Reker','Keizersgracht',565,'1041AC','AMSTERDAM',3);
INSERT INTO personen VALUES('Meer','Coolsingel',312,'2083BD','ROTTERDAM',4);
INSERT INTO personen VALUES('Pas','Oranjesingel',32,'6511NM','NIJMEGEN',5);
INSERT INTO personen VALUES('Kraayenhof','Steenstraat',77,'6809TG','ARNHEM',6);
INSERT INTO personen VALUES('Smeets','Spui',87,'2567XX','DEN HAAG',7);
INSERT INTO personen VALUES('Brink','Boterdiep',6,'9711LB','GRONINGEN',8);


CREATE TABLE cursisten 
( NR      NUMBER(4)
, CURS_NR NUMBER(2)   );

INSERT INTO cursisten VALUES(1,1);
INSERT INTO cursisten VALUES(2,8);
INSERT INTO cursisten VALUES(3,5);
INSERT INTO cursisten VALUES(4,2);
INSERT INTO cursisten VALUES(5,6);
INSERT INTO cursisten VALUES(6,1);
INSERT INTO cursisten VALUES(7,7);
INSERT INTO cursisten VALUES(8,3);


CREATE TABLE cursussen 
( NR       NUMBER(2)
, NAAM     VARCHAR2(20)
, AANT_DAG NUMBER(2)
, PRIJS    NUMBER(6));


INSERT INTO cursussen VALUES(1,'PL/SQL',1,500);
INSERT INTO cursussen VALUES(2,'Oracle Forms',6,2700);
INSERT INTO cursussen VALUES(3,'Generatoren',5,2500);
INSERT INTO cursussen VALUES(4,'Oracle Forms deel 2',3,1500);
INSERT INTO cursussen VALUES(5,'SQL/SQL*Plus',4,2000);
INSERT INTO cursussen VALUES(6,'Procedurele Extentie',2,1000);
INSERT INTO cursussen VALUES(7,'Oracle Reports',2,1000);
INSERT INTO cursussen VALUES(8,'Oracle DBA',5,2500);





CREATE TABLE producten 
( code VARCHAR2(5)
, naam VARCHAR2(20)
, omschrijving VARCHAR2(50)    );
 

INSERT INTO producten VALUES ('B23GQ',null,null);
INSERT INTO producten VALUES ('B23GZ','Potloden',null);
INSERT INTO producten VALUES ('B24AE','Papier','A4 wit papier 80 gr');
INSERT INTO producten VALUES ('B25RG',null,null);
INSERT INTO producten VALUES ('B21ZC','Paperclips','Gekleurde paperclips 100 stuks');
INSERT INTO producten VALUES ('B26GD','Inkt',null);



CREATE TABLE webadres 
( adres VARCHAR2(60)   );

INSERT INTO webadres VALUES ('http://www.vijfhart.nl/pls/5hart/oracle_web_kalender');
INSERT INTO webadres VALUES ('http://www.vijfhart.nl/pls/5hart/webpagina.php?p_nr=2');
INSERT INTO webadres VALUES ('http://www.vijfhart.nl/pls/5hart/oracle_cursus_lijst');



  


COMMIT;
