
  CREATE TABLE PRODUCTEN 
   (	CODE VARCHAR2(5), 
	NAAM VARCHAR2(20), 
	OMSCHRIJVING VARCHAR2(50)
   );
 

Insert into PRODUCTEN (CODE, NAAM, OMSCHRIJVING) values ('B23GQ',null,null);
Insert into PRODUCTEN (CODE, NAAM, OMSCHRIJVING) values ('B23GZ','Potloden',null);
Insert into PRODUCTEN (CODE, NAAM, OMSCHRIJVING) values ('B24AE','Papier','A4 wit papier 80 gr');
Insert into PRODUCTEN (CODE, NAAM, OMSCHRIJVING) values ('B25RG',null,null);
Insert into PRODUCTEN (CODE, NAAM, OMSCHRIJVING) values ('B21ZC','Paperclips','Gekleurde paperclips 100 stuks');
Insert into PRODUCTEN (CODE, NAAM, OMSCHRIJVING) values ('B26GD','Inkt',null);

commit;