REM   Script: start_course
REM   create tables for sql course

create table kantoren	(kantnr		number(2) not null,	naam		varchar2(15),	plaats		varchar2(10) ) ;

INSERT 	INTO KANTOREN VALUES (10,'BOEKHOUDING','AMSTERDAM') ;

INSERT 	INTO KANTOREN VALUES (20,'ONDERZOEK','UTRECHT') ;

INSERT 	INTO KANTOREN VALUES (30,'VERKOOP','DEN HAAG') ;

INSERT 	INTO KANTOREN VALUES (40,'PRODUCTIE','ARNHEM') ;

alter table kantoren add constraint pk_kantoren primary key (kantnr) ;

create table werknemers 
 ( 
 persnr number(4) not null, 
 naam varchar2(10), 
 functie varchar2(9), 
 mgr number(4), 
 sal number(5), 
 toeslag number(5), 
 kantnr number(2), 
 primary key (persnr), 
 constraint werknemer_mgr foreign key (mgr) references werknemers(persnr)) ;

alter table werknemers disable constraint werknemer_mgr ;

insert into werknemers values (3381,'SMITS','KLERK',7902,2400,NULL,20) ;

insert into werknemers values (3462,'ALKEMA','VERKOPER',4621,2600,300,30) ;

insert into werknemers values (3518,'WALSTRA','VERKOPER',4621,2250,500,30) ;

insert into werknemers values (3930,'PIETERS','MANAGER',6221,3975,NULL,20) ;

insert into werknemers values (4510,'VERGEER','VERKOPER',4621,2250,1400,30) ;

insert into werknemers values (4621,'KLAASEN','MANAGER',6221,3850,NULL,30) ;

insert into werknemers values (5810,'HEUVEL','MANAGER',6221,3450,NULL,10) ;

insert into werknemers values (5931,'SANDERS','ANALIST',3930,4000,NULL,20) ;

insert into werknemers values (6221,'KRAAY','DIRECTEUR',NULL,6000,NULL,10) ;

insert into werknemers values (6500,'DROST','VERKOPER',4621,2500,0,30) ;

insert into werknemers values (6681,'ADELAAR','KLERK',5931,2100,NULL,20) ;

insert into werknemers values (7900,'APPEL','KLERK',4621,1950,NULL,30) ;

insert into werknemers values (7902,'VERMEULEN','ANALIST',3930,3900,NULL,20) ;

insert into werknemers values (8222,'MANDERS','KLERK',5810,2300,NULL,10) ;

alter table werknemers enable constraint werknemer_mgr ;

create index I_WERKNEMERS_F on werknemers(functie) ;

create index I_WERKNEMERS_S on werknemers(sal) ;

create table ziekenhuizen (ziekhnr number(2) not null,naam varchar2(15), plaats varchar2(15), telefoon varchar2(12), totbed number(4) ) ;

insert into ziekenhuizen values ( 10,'AMC','Amsterdam','020-6532617',502 ) ;

insert into ziekenhuizen values ( 15,'Diaconessen','Utrecht','030-2646362',587 ) ;

insert into ziekenhuizen values ( 20,'Antonius','Nieuwegein','030-6045632',412 ) ;

insert into ziekenhuizen values ( 25,'Zuiderzee','Lelystad','0320-255522',845 ) ;

create table afdelingen 
 (ziekhnr number(2) not null, 
 afdnr number(2) not null, 
 naam varchar2 (15), 
 totbed number(4) ) ;

INSERT INTO AFDELINGEN VALUES (10,3,'Intensive Care',21) ;

INSERT INTO AFDELINGEN VALUES (10,6,'Psychiatrie',67) ;

INSERT INTO AFDELINGEN VALUES (15,3,'Intensive Care',10) ;

INSERT INTO AFDELINGEN VALUES (15,4,'Hartafdeling',53) ;

INSERT INTO AFDELINGEN VALUES (20,1,'Hersteloord',10) ;

INSERT INTO AFDELINGEN VALUES (20,6,'Psychiatrie',118) ;

INSERT INTO AFDELINGEN VALUES (20,2,'Kinder',34) ;

INSERT INTO AFDELINGEN VALUES (25,4,'Hartafdeling',55) ;

INSERT INTO AFDELINGEN VALUES (15,1,'Hersteloord',13) ;

INSERT INTO AFDELINGEN VALUES (25,2,'Kinder',24) ;

create table stafleden (ziekhnr number(2) not null, afdnr number(2) not null, persnr number(4) not null, naam varchar2(15), functie varchar2(15), dienst varchar2(6), sal number(5) ) ;

INSERT INTO STAFLEDEN VALUES (10,6,3526,'Dinter B.','Verpleegster','A',17400) ;

insert into stafleden values (10,6,3198,'Hursman J.','Zaalknecht','A',13500) ;

insert into stafleden values (15,4,2342,'Keyzer W.','Assistent','A',18300) ;

insert into stafleden values (20,6,2315,'Horst D.','Verpleegster','N',18300) ;

Insert into stafleden values (20,6,8574,'Beek G.','Zaalknecht','N',12600) ;

insert into stafleden values (20,2,3257,'Mensink C.','Assistent','N',17000) ;

insert into stafleden values (20,1,8632,'Riksen G.','Verpleegster','D',20200) ;

insert into stafleden values (20,1,5342,'Coolen R.','Verpleegster','A',16300) ;

insert into stafleden values (25,4,6543,'Arends R.','Assistent','D',17000) ;

insert into stafleden values (25,2,9835,'Fleskes H.','Verpleegster','A',19400) ;

Create table patienten (patnr number(5) not null, naam varchar2(15), plaats varchar2(15), gebdat date, mv varchar2(1), ziekfnr number(7) ) ;

insert into patienten values (11321,'Koopmans M.','Utrecht',to_date('11-dec-1966','DD-mon-YYYY','nls_date_language=american'),'M',3542764) ;

insert into patienten values (12816,'Schouten W.','Den Haag',to_date('23-apr-1973','DD-mon-YYYY','nls_date_language=american'),'V',7466384) ;

insert into patienten values (19381,'Elbers M.','Amsterdam',to_date('01-jan-1976','DD-mon-YYYY','nls_date_language=american'),'V',9753728) ;

insert into patienten values (25218,'Dekker B.','Utrecht',to_date('05-nov-1954','DD-mon-YYYY','nls_date_language=american'),'M',8466355) ;

insert into patienten values (30940,'Lammers T.','Arnhem',to_date('12-apr-1943','DD-mon-YYYY','nls_date_language=american'),'V',3452718) ;

insert into patienten values (38911,'Jong H.','Nijmegen',to_date('12-jan-1982','DD-mon-YYYY','nls_date_language=american'),'M',4656238) ;

insert into patienten values (39410,'Manders G.','Den Bosch',to_date('11-dec-1970','DD-mon-YYYY','nls_date_language=american'),'M',2794710) ;

insert into patienten values (45630,'Ravenhorst P.' ,'Eindhoven' ,to_date('04-feb-1948', 'DD-mon-YYYY', 'nls_date_language=american' ),'M',9872513) ;

insert into patienten values (48220,'Feenstra A.','Breda',to_date('27-feb-1977','DD-mon-YYYY','nls_date_language=american'),'V',3529976) ;

insert into patienten values (50333,'Horst E.','Utrecht',to_date('12-apr-1964','DD-mon-YYYY','nls_date_language=american'),'M',1232988) ;

create table bezetting 
 (patnr number(5) not null, 
 ziekhnr number(2) not null, 
 afdnr number(2) not null, 
 bednr number(2) not null )  ;

insert into bezetting values (11321,10,3,1)  ;

insert into bezetting values (12816,10,3,2)  ;

insert into bezetting values (19381,10,3,3)  ;

insert into bezetting values (25218,15,4,1)  ;

insert into bezetting values (30940,15,4,2)  ;

insert into bezetting values (38911,20,6,1)  ;

insert into bezetting values (39410,20,6,2)  ;

insert into bezetting values (45630,20,6,3)  ;

insert into bezetting values (48220,20,2,1)  ;

insert into bezetting values (50333,25,4,1)  ;

create table nummers (nummer number(3),tekst varchar2(250)) ;

insert into nummers values (1,'Een')  ;

insert into nummers values (1,'One')  ;

insert into nummers values (2,'Twee')  ;

insert into nummers values (2,'Two')  ;

insert into nummers values (3,'Drie')  ;

insert into nummers values (3,'Three')  ;

insert into nummers values (4,'Vier')  ;

insert into nummers values (4,'Four')  ;

insert into nummers values (5,'Vijf')  ;

insert into nummers values (5,'Five')  ;

insert into nummers values (6,'Zes')  ;

insert into nummers values (6,'Six')  ;

insert into nummers values (7,'Seven')  ;

insert into nummers values (7,'Zeven')  ;

insert into nummers values (8,'Acht')  ;

insert into nummers values (8,'Eight')  ;

insert into nummers values (9,'Nine')  ;

insert into nummers values (9,'Negen')  ;

insert into nummers values (10,'Tien')  ;

insert into nummers values (11,'Elf')  ;

insert into nummers values (12,'Twaalf')  ;

insert into nummers values (13,'Dertien')  ;

insert into nummers values (14,'Veertien')  ;

insert into nummers values (15,'Vijftien')  ;

insert into nummers values (16,'Zestien')  ;

insert into nummers values (17,'Zeventien')  ;

insert into nummers values (18,'Achttien')  ;

insert into nummers values (19,'Negentien')  ;

insert into nummers values (20,'Twintig')  ;

insert into nummers values (21,'Eenentwintig')  ;

insert into nummers values (22,'Twintig')  ;

insert into nummers values (23,'Drieentwintig')  ;

insert into nummers values (24,'Vierentwintig')  ;

insert into nummers values (25,'Vijentwintig')  ;

insert into nummers values (26,'Zesentwintig')  ;

insert into nummers values (27,'Zevenentwintig')  ;

insert into nummers values (28,'Achtentwintig')  ;

insert into nummers values (29,'Negenentwintig')  ;

insert into nummers values (30,'Dertig')  ;

insert into nummers values (31,'Eenendertig')  ;

insert into nummers values (32,'Tweeendertig')  ;

insert into nummers values (33,'Drieendertig')  ;

insert into nummers values (34,'Vierendertig')  ;

insert into nummers values (35,'Vijfendertig')  ;

insert into nummers values (36,'Zesendertig')  ;

insert into nummers values (37,'Zevenendertig')  ;

insert into nummers values (38,'Achtendertig')  ;

insert into nummers values (39,'Negenendertig')  ;

INSERT INTO nummers VALUES (40, 'Veertig')  ;

INSERT INTO nummers VALUES (41, 'Eenenveertig')  ;

INSERT INTO nummers VALUES (42, 'Tweeenveertig')  ;

INSERT INTO nummers VALUES (43, 'Drieenveertig')  ;

INSERT INTO nummers VALUES (44, 'Vierenveertig')  ;

INSERT INTO nummers VALUES (45, 'Vijfenveertig')  ;

INSERT INTO nummers VALUES (46, 'Zesenveertig')  ;

INSERT INTO nummers VALUES (47, 'Zevenenveertig')  ;

INSERT INTO nummers VALUES (48, 'Achtenveertig')  ;

INSERT INTO nummers VALUES (49, 'Negenenveertig')  ;

INSERT INTO nummers VALUES (50, 'Vijftig')  ;

INSERT INTO nummers VALUES (51, 'Eenenvijftig')  ;

INSERT INTO nummers VALUES (52, 'Tweeenvijftig')  ;

INSERT INTO nummers VALUES (53, 'Drieenvijftig')  ;

INSERT INTO nummers VALUES (54, 'Vierenvijftig')  ;

INSERT INTO nummers VALUES (55, 'Vijfenvijftig')  ;

INSERT INTO nummers VALUES (56, 'Zesenvijftig')  ;

INSERT INTO nummers VALUES (57, 'Zevenenvijftig')  ;

INSERT INTO nummers VALUES (58, 'Achtenvijftig')  ;

INSERT INTO nummers VALUES (59, 'Negenenvijftig')  ;

INSERT INTO nummers VALUES (60, 'Zestig')  ;

INSERT INTO nummers VALUES (61, 'Eenenzestig')  ;

INSERT INTO nummers VALUES (62, 'Tweeenzestig')  ;

INSERT INTO nummers VALUES (63, 'Drieenzestig')  ;

INSERT INTO nummers VALUES (64, 'Vierenzestig')  ;

INSERT INTO nummers VALUES (65, 'Vijfenzestig')  ;

INSERT INTO nummers VALUES (66, 'Zesenzestig')  ;

INSERT INTO nummers VALUES (67, 'Zevenenzestig')  ;

INSERT INTO nummers VALUES (68, 'Achtenzestig')  ;

INSERT INTO nummers VALUES (69, 'Negenenzestig')  ;

INSERT INTO nummers VALUES (70, 'Zeventig')  ;

INSERT INTO nummers VALUES (71, 'Eenenzeventig')  ;

INSERT INTO nummers VALUES (72, 'Tweeenzeventig')  ;

create table onbekenden 
(naam varchar2(15)) ;

insert into onbekenden values ('ie%$aaa') ;

insert into onbekenden values ('i%$aaa') ;

insert into onbekenden values ('ie%$aa%') ;

insert into onbekenden values ('ie_$$bb') ;

insert into onbekenden values ('i__e_b_c') ;

commit


