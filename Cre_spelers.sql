DROP TABLE spelers;

CREATE TABLE spelers (
spelnr  number(3)       not null,
naam    varchar2(20),
voorl   varchar2(3),
jaartoe number(4),
plaats  varchar2(10),
bondsnr number(4))
;

set feedback off

INSERT INTO spelers VALUES ( 6,'Honing','R',1977,'Den Haag',8467 );
INSERT INTO spelers VALUES ( 44,'Bakker','E',1980,'Rijswijk',1124 );
INSERT INTO spelers VALUES ( 83,'Martens','PK',1982,'Utrecht',1608 );
INSERT INTO spelers VALUES ( 2,'van der Wal','R',1975,'Den Haag',2411 );
INSERT INTO spelers VALUES ( 27,'Cools','DD',1983,'Utrecht',2513 );
INSERT INTO spelers VALUES ( 104,'Kok','D',1984,'Utrecht',7060 );
INSERT INTO spelers VALUES ( 7,'Sorgdrager','GWS',1981,'Den Haag',null);
INSERT INTO spelers VALUES ( 57,'O''Neal','M',1985,'Den Haag',6409 );
INSERT INTO spelers VALUES ( 112,'Winterdijk','IP',1984,'Rotterdam',1319 );
INSERT INTO spelers VALUES ( 8,'Cools','C',1980,'Rijswijk',2983 );

set feedback on

commit;
