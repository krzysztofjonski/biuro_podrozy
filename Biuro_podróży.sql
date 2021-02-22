/*******Projekt biuro podró¿y*******/

/*****TWORZENIE BAZY DANYCH*****/
/*stworzenie bazy danych o nazwie KandK*/

create database KandK
USE [KandK]
GO
/*****TABELE BAZY DANYCH KANDK*****/

/*TABELA CENTRALA*/
create table Centrala
(
CentralaID int identity (1, 1) primary key,
NazwaCe nvarchar(6),
AdresCe nvarchar(20),
MiastoCe nvarchar(12),
NrTelCe nvarchar (9) unique
)

/*TABELA FILIA*/
create table Filia
(
FiliaID int identity (1, 1) primary key,
CentralaID int NOT NULL,
NazwaFi nvarchar (3) NOT NULL,
DniOtwarciaFi nvarchar (5) NOT NULL,
GodzOtwarciaFi nvarchar (11) NOT NULL,
AdresFi nvarchar (30) NOT NULL,
MiastoFi nvarchar (12) NOT NULL,
NrTelFi nvarchar (9) NOT NULL unique
)

/*TABELA PRACOWNIK*/
create table Pracownik
(
PracownikID int identity (1, 1) primary key,
FiliaID int NOT NULL,
Nazwisko nvarchar (15) NOT NULL,
Imie nvarchar(15) NOT NULL,
DataUrodzenia DATE NOT NULL,
DataZatrudnienia DATE NOT NULL,
NumerTelPr nvarchar (9) NOT NULL unique,
TypPrID int NOT NULL
)

/*TABELA TYPPRACOWNIKA*/
create table TypPracownika
(
TypPrID int identity (1, 1) primary key,
Typ nvarchar(10)
)

/*TABELA WYCIECZKA*/
create table Wycieczka
(
WycieczkaID int identity (1, 1) primary key,
NazwaWy nvarchar (6) NOT NULL,
FiliaID int NOT NULL,
MiastoWy nvarchar (15) NOT NULL,
KrajWy nvarchar (10) NOT NULL,
AutokarID int NOT NULL,
TypWycieczkiID int NOT NULL,
)

/*TABELA PRACOWNIKWYCIECZKA*/
create table PracownikWycieczka
(
WycieczkaID int NOT NULL,
PracownikID int NOT NULL,
primary key (WycieczkaID, PracownikID) 
)

/*TABELA FAKTURA*/
CREATE table Faktura
(
FakturaID int identity (1, 1) primary key,
PracownikID int NOT NULL,
WycieczkaID int NOT NULL,
NumerFak nvarchar (12) NOT NULL 
)





/*TABELA AUTOKAR*/
create table Autokar
(
AutokarID int identity (1, 1) primary key,
LiczbaMiejsc int NOT NULL,
)

/*TABELA PROGRAM*/
create table Program
(
ProgramID int identity (1, 1) primary key,
WycieczkaID int NOT NULL,
NazwaPr nvarchar(30) NOT NULL,
CzasTrwania nvarchar(2) NOT NULL,
Zakwaterowanie nvarchar(20) NOT NULL,
Wyzywienie nvarchar (15) NOT NULL,
CenaZaOsobe money NOT NULL
)

/*TABELA TYPWYCIECZKI*/
create table TypWycieczki
(
TypWycieczkiID int identity (1, 1) primary key,
Typ nvarchar (11) NOT NULL,
)

/*****WPROWADZANIE DANYCH DO TABEL*****/


/*INSERT CENTRALA*/
insert into Centrala (NazwaCe, AdresCe, MiastoCe, NrTelCe)
values ('CENGDA',	'ul. Piotrkowska 1',	'Gdañsk',	'500000000'),
	   ('CENWAW',	'ul. Zamkowa 1',      	'Warszawa',	'500000001')


/*INSERT FILIA*/
insert into Filia (CentralaID, NazwaFi, DniOtwarciaFi, GodzOtwarciaFi, AdresFi, MiastoFi, NrTelFi)
values ('1',	'GDA',	'Pn-Pt',	'8:00-16:00',	'ul. Korzenna 32',  	'Gdañsk',	'500000002'),
	   ('2',	'WAW',	'Pn-Pt',	'8:00-16:00',	'ul. Lêborska 5',	    'Warszawa',	'500000003'),
       ('2',	'KAT',	'Pn-Pt',	'8:00-16:00',	'ul. Stokrotki 65',	    'Katowice',	'500000004'),
       ('1',	'POZ',	'Pn-Pt',	'8:00-16:00',	'ul. D³uga 24',	        'Poznañ',	'500000005'),
       ('2',	'LOD',	'Pn-Pt',	'8:00-16:00',	'ul. Budowlanych 45', 	'£ódŸ',	    '500000006'),
       ('2',	'KRK',	'Pn-Pt',	'8:00-16:00',	'ul. Leszczyñskich 87',	'Kraków',	'500000007'),
       ('1',	'BIA',	'Pn-Pt',	'8:00-16:00',	'ul. Martwa 15',	    'Bia³ystok','500000008'),
       ('1',	'GDY',	'Pn-Pt',	'8:00-16:00',	'ul. Koœcielna 2',	    'Gdynia',	'500000009'),
       ('2',	'WRO',	'Pn-Pt',	'8:00-16:00',	'ul. ¯ywa 12',	        'Wroc³aw',	'500000010')

/*INSERT PRACOWNIK*/
insert into Pracownik (FiliaID, Nazwisko, Imie, DataUrodzenia, DataZatrudnienia, NumerTelPr, TypPrID)
values ('1',	'Bala',	  'Krzysztof',	'1965-05-01',	'2014-05-01',	'500000002',	'1'),
       ('1', 	'Kasa',	  'Mariusz',	'1990-03-17',	'2012-07-01',	'500000003',	'1'),
       ('2',	'Piróg',  'Stanis³aw', 	'1968-09-18',	'2011-01-01',	'500000004', 	'1'),
       ('2',	'Kartez', 'Pawe³',	    '1975-03-25',	'2015-03-01',	'500000005',	'1'),
       ('3',	'Kopa',   'Piotr',	    '1978-05-14',	'2011-05-01',	'500000006',	'1'),
       ('3',	'Janik',  'Tomasz',	    '1985-06-16',	'2014-06-01',	'500000007',	'1'),
       ('4',	'Fa³a',	  'Krystyna',  	'1976-05-01',	'2011-03-01',	'500000008',	'1'),
       ('4',   	'Bingo',  'Dominik',	'1987-07-19',	'2012-07-01',	'500000009',	'1'),
       ('5',   	'Sak',    'Alina',  	'1984-09-13',	'2013-08-01',	'500000010',	'1'),
       ('5',    'Burno',  'Anna',	    '1959-09-11',	'2014-09-01',	'500000011',  	'1'),
       ('6',	'Zawisek','Monika', 	'1990-07-19',	'2010-01-01',	'500000012',	'1'),
       ('6',	'Motysia','Krystian',	'1990-01-17',	'2011-03-01',	'500000013',	'1'),
       ('7',	'Wieczkowski','Albert',	'1986-02-15',	'2010-10-01',	'500000014',	'1'),
       ('7',	'Bielewicz','Jolanta',	'1978-03-16',	'2012-05-01',	'500000015',	'1'),
       ('8',	'Lipa',	  'Karolina',  	'1960-02-02',	'2019-09-01',	'500000016',	'1'),
       ('8',	'Zommer',	'Natalia', 	'1987-12-05',	'2018-07-01',	'500000017',	'1'),
       ('9',	'Fabczyñski','Konrad',	'1987-06-04',	'2015-09-01',	'500000018',	'1'),
       ('9',	'Fabecki',	'Krzysztof','1968-12-15',	'2016-03-01',	'500000019',	'1'),
       ('1',	'Nowak',	'Anna',	    '1985-12-12',	'2014-08-01',	'500000020',	'2'),
       ('2',    'Kowalski',	'Marzena',	'1969-08-25',	'2013-01-01',	'500000021',	'2'),
       ('3',	'Mazur',	'Dominika',	'1963-10-13',	'2011-10-01',	'500000022',	'2'),
       ('4',	'D¹browski','Dawid',	'1996-10-25',	'2010-08-01',	'500000023',	'2'),
       ('5',	'Niwka',	'Adrian',	'1988-09-14',	'2020-01-01',	'500000024',	'2'),
       ('6',	'Sagan',	'Andrzej',	'1996-04-15',	'2010-05-01',	'500000025',	'2'),
       ('7',	'Grzyb',	'Renata',	'1989-09-12',	'2015-09-01',	'500000026',	'2'),
       ('8',	'Kamiñski',	'Robert',	'1984-07-13',	'2018-08-01',	'500000027',	'2'),
       ('9',	'Koz³owska','Emilia',	'1985-12-18',	'2014-07-01',	'500000028',	'2')
       
/*INSERT TYPPRACOWNIKA*/
insert into TypPracownika (Typ)
values ('kierowca'),
       ('pilot')

/*INSERT WYCIECZKA*/
insert into Wycieczka (NazwaWy, FiliaID, MiastoWy, KrajWy, AutokarID, TypWycieczkiID)
values ('WypWAW',	'1',	'Warszawa',	  'Polska',	    '1',	'1'),
       ('WypZAK',	'1',	'Zakopane',	  'Polska',	    '1',	'1'),
       ('WypATE',	'1',	'Ateny',	  'Grecja',     '1',	'2'),
       ('WypPOZ',	'2',	'Poznañ',	  'Polska',  	'2',	'1'),
       ('WypBER',	'2',	'Berlin',	  'Niemcy',   	'2',    '2'),
       ('WypPRA',	'2',	'Praga',	  'Czechy',	    '2',	'2'),
       ('WypGDA',	'3',	'Gdañsk',	  'Polska',	    '3',	'1'),
       ('WypKUD', 	'3',	'KudowaZdrój','Polska',	    '3',	'1'),
       ('WypMED',	'3',	'Mediolan',	  'W³ochy',	    '3',	'2'),
       ('WypKO£',	'4',	'Ko³obrzeg',  'Polska',	    '4',    '1'),
       ('WypHAM',	'4',	'Hamburg',	  'Niemcy',	    '4',	'2'),
       ('WypPAR',	'4',	'Pary¿',	  'Francja',	'4',	'2'),
       ('WypZAK',	'5',	'Zakopane',	  'Polska',	    '5',	'1'),
       ('WypGDY',	'5',	'Gdynia',	  'Polska',	    '5',	'1'),
       ('WypSZC',	'5',	'Szczecin',   'Polska',	    '5',	'1'),
       ('WypBAR',	'6',	'Barcelona',  'Hiszpania',  '6',	'2'),
       ('WypWER',	'6',	'Werona',	  'W³ochy',	    '6',	'2'),
       ('WypGDA',	'6',	'Gdañsk',	  'Polska',	    '6',	'1'),
       ('WypCZE',	'7',	'Czêstochowa','Polska',	    '7',	'1'),
       ('WypLIC',  	'7',	'Licheñ',	  'Polska',	    '7',	'1'),
       ('WypPAR',	'7',	'Pary¿',	  'Francja',	'7',	'2'),
       ('WypKOP',	'8',	'Kopenhaga',  'Dania',	    '8',	'2'),
       ('WypPRA',	'8',	'Praga',	  'Czechy',	    '8',	'2'),
       ('WypRZY',	'8',	'Rzym',	      'W³ochy',	    '8',	'2'),
       ('WypZAK',	'8',	'Zakopane',	  'Polska',	    '3',	'1'),
       ('WypGDY',	'9',	'Gdynia',	  'Polska',	    '9',	'1'),
       ('WypMED',	'9',	'Mediolan',	  'W³ochy',	    '9',	'2'),
       ('WypKOL',	'9',	'Ko³obrzeg',  'Polska',	    '9',	'1'),
       ('WypBER',	'9',	'Berlin',	  'Niemcy',  	'1',	'2'),
       ('WypSZC',	'9',	'Szczecin',	  'Polska',	    '2',	'1')

----------DO ZROBIENIA /*INSERT PRACOWNIKWYCIECZKA*/
insert into PracownikWycieczka (WycieczkaID, PracownikID)
values  ('1', '1'),
		('1', '2'),
		('1', '19'),
		('2', '1'),
		('2', '2'),
		('2', '19'),
		('3', '1'),
		('3', '2'),
		('3', '19'),
		('4', '3'),
		('4', '4'),
		('4', '20'),
		('5', '3'),
		('5', '4'),
		('5', '20'),
		('6', '3'),
		('6', '4'),
		('6', '20'),
		('7', '5'),
		('7', '6'),
		('7', '21'),
		('8', '5'),
		('8', '6'),
		('8', '21'),
		('9', '5'),
		('9', '6'),
		('9', '21'),
		('10', '7'),
		('10', '8'),
		('10', '22'),
		('11', '7'),
		('11', '8'),
		('11', '22'),
		('12', '7'),
		('12', '8'),
		('12', '22'),
		('13', '9'),
		('13', '10'),
		('13', '23'),
		('14', '9'),
		('14', '10'),
		('14', '23'),
		('15', '9'),
		('15', '10'),
		('15', '23'),
		('16', '11'),
		('16', '12'),
		('16', '24'),
		('17', '11'),
		('17', '12'),
		('17', '24'),
		('18', '11'),
		('18', '12'),
		('18', '24'),
		('19', '13'),
		('19', '14'),
		('19', '25'),
		('20', '13'),
		('20', '14'),
		('20', '25'),
		('21', '13'),
		('21', '14'),
		('21', '25'),
		('22', '15'),
		('22', '16'),
		('22', '26'),
		('23', '15'),
		('23', '16'),
		('23', '26'),
		('24', '15'),
		('24', '16'),
		('24', '26'),
		('25', '5'),
		('25', '6'),
		('25', '21'),
		('26', '17'),
		('26', '18'),
		('26', '27'),
		('27', '17'),
		('27', '18'),
		('27', '27'),
		('28', '17'),
		('28', '18'),
		('28', '27'),
		('29', '1'),
		('29', '2'),
		('29', '19'),
		('30', '3'),
		('30', '4'),
		('30', '20')

/*INSERT FAKTURA*/
insert into Faktura (PracownikID, WycieczkaID, NumerFak)
values ('19',	'1',	'GDA/0000001'),
	   ('19',	'2',	'GDA/0000002'),
	   ('19',	'3',	'GDA/0000003'),
	   ('19',    '1',    'GDA/0000004'),
       ('20',	'4',	'WAW/0000001'),
       ('20',	'5',	'WAW/0000002'),
       ('20',   '4',    'WAW/0000003'),
       ('20',	'6',	'WAW/0000004'),
       ('21',	'7',	'KAT/0000001'),
       ('21',	'8',	'KAT/0000002'),
       ('21',	'9',	'KAT/0000003'),
       ('22',	'10',	'POZ/0000001'),
       ('22',	'11',	'POZ/0000002'),
       ('22',	'12',	'POZ/0000003'),
       ('22',	'11',	'POZ/0000004'),
       ('23',	'13',	'LOD/0000001'),
       ('23',	'14',	'LOD/0000002'),
       ('23',	'15',	'LOD/0000003'),
       ('24',	'16',	'KRK/0000001'),
       ('24',	'17',	'KRK/0000002'),
       ('24',	'18',	'KRK/0000003'),
       ('25',	'19',	'BIA/0000001'),
       ('25',	'20',	'BIA/0000002'),
       ('25',	'21',	'BIA/0000003'),
       ('26',	'22',	'BIA/0000004'),
       ('26',	'23',	'GDY/0000001'),
       ('26',	'24',	'GDY/0000002'),
       ('26',	'25',	'GDY/0000003'),
       ('27',	'26',	'GDY/0000004'),
       ('27',	'27',	'WRO/0000001'),
       ('27',	'28',	'WRO/0000002'),
       ('27',	'29',	'WRO/0000003'),
       ('27',	'30',	'WRO/0000004')

TRUNCATE TABLE FAKTURA 

SELECT * FROM Faktura


/*INSERT AUTOKAR*/
insert into Autokar (LiczbaMiejsc)
values ('50'),
       ('100'),
	   ('150'),
	   ('120'),
	   ('130'),
	   ('141'),
	   ('90'),
	   ('105'),
	   ('110')

/*INSERT PROGRAM*/
insert into Program (WycieczkaID, NazwaPr, CzasTrwania, Zakwaterowanie, Wyzywienie, CenaZaOsobe)
values ('30',	'Pe³nia Relaksu',	    '7',	'hotel',	        'niepe³ne',	'850.00'),
	   ('30',	'Pe³nia Relaksu',	    '7',	'hotel',	        'pe³ne',	'1000.00'),
	   ('30',	'Pe³nia Relaksu',	    '7',	'pensjonat',	    'pe³ne',	'900.00'),
	   ('29',	'Natura w mieœcie',     '9',	'pensjonat',	    'pe³ne',	'2000.00'),
	   ('29',	'Natura w mieœcie',	    '9',	'pole namiotowe',	'niepe³ne',	'1650.00'),
	   ('28',	'Czas to odpoczynek',   '10',	'motel',	        'niepe³ne',	'1200.00'),
	   ('28',	'Czas to odpoczynek',   '10',	'pensjonat',	    'niepe³ne',	'1500.00'),
	   ('27',	'Zwiedzanie z klas¹',   '5',	'apartament',	    'pe³ne',	'1840.00'),
	   ('26',	'Wypoczynek na pla¿y',  '6',	'hotel',	        'pe³ne',	'900.00'),
	   ('26',	'Wypoczynek na pla¿y',  '6',	'pensjonat',	    'niepe³ne',	'500.00'),
	   ('25',	'Natura',	            '8',	'hotel',	        'pe³ne',	'900.00'),
	   ('25',	'Blisko natury',	    '8',	'hotel',	        'pe³ne',	'1750.00'),
	   ('24',	'Zwiedzanie na czas',	'7',	'apartament',	    'pe³ne',	'1698.00'),
	   ('24',	'Gra na orientacje',  '8',	'pole namiotowe',	'pe³ne',	'1352.00'),
	   ('23',	'Podchody',	            '8',    'motel',        	'pe³ne',	'1369.00'),
	   ('23',	'Viva Praga',	        '8',	'pole namiotowe',	'niepe³ne',	'1258.00'),
	   ('22',	'Tygrysie wczasy',	    '8',	'hotel',	        'niepe³ne',	'1368.00'),
	   ('21',	'Kolory Pary¿a',	    '7',	'apartament',	    'niepe³ne',	'1297.00'),
	   ('20',	'Kwiaty Lichenia',	    '7',	'apartament',    	'pe³ne',	'1895.00'),
	   ('19',	'Na kolana',        	'7',	'apartament',    	'pe³ne',	'1398.00'),
	   ('18',	'Ekspres',	            '7',	'hotel',	        'pe³ne',	'2100.00'),
	   ('17',	'Ma³e jest piêkne',	    '9',	'hotel',	        'pe³ne',	'2500.00'),
	   ('16',	'Wie¿owce i hulajnogi',	'8',	'hotel',	        'pe³ne',	'2600.00'),
	   ('15',	'Polska Wyspa',	        '7',	'pole namiotowe',	'niepe³ne',	'1485.00'),
	   ('14',	'Niezapomniane chwile',	'7',	'motel',         	'niepe³ne',	'1793.00'),
	   ('14',	'Porty i statki',   	'6',	'motel',	        'niepe³ne',	'1358.00'),
	   ('13',	'Szalony wyjazd',	    '6',	'hotel',	        'niepe³ne',	'1568.00'),
	   ('12',	'Relaks pe³n¹ par¹',	'6',	'hotel',	        'pe³ne',	'1359.00'),
	   ('12',	'Wczasy pod gwiazdami',	'9',	'hotel',	        'pe³ne',	'1485.00'),
	   ('11',	'Ham-burger',           '8',	'hotel',	        'pe³ne',	'1354.00'),
	   ('10',	'Na sportowo',	        '4',	'hotel',	        'pe³ne',	'2514.00'),
	   ('9',	'Na leniucha',       	'7',	'apartament',     	'pe³ne',	'1987.00'),
	   ('8',	'Aktywne zwiedzanie',	'8',	'hotel',	        'niepe³ne',	'1369.00'),
	   ('8',	'Zwiedzanie od kuchni',	'8',	'hotel',	        'niepe³ne',	'1483.00'),
	   ('7',	'Na luzaku',	        '7',	'apartament',     	'niepe³ne',	'1397.00'),
	   ('6',    'Zwiedzanie z klas¹',	'8',	'apartament',	    'pe³ne',	'1200.00'),
	   ('6',	'Zwiedzanie z klas¹',	'7',	'pensjonat',	    'pe³ne',	'1500.00'),
	   ('5',	'Czas to odpoczynek',	'5',	'hotel',	        'niepe³ne',	'1840.00'),
	   ('5',	'Beer and Wurst',	    '6',	'pensjonat',     	'niepe³ne',	'900.00'),
	   ('4',	'Poznañskie Kozio³ki',  '8',	'pensjonat',     	'pe³ne',	'500.00'),
	   ('4',	'Poznañskie Kozio³ki',	'8',	'hotel',	        'niepe³ne',	'600.00'),
	   ('3',	'Blisko Zeusa',	        '8',	'motel',	        'niepe³ne',	'1750.00'),
	   ('3',	'Zwiedzanie na czas',	'7',	'apartament',	    'niepe³ne',	'1698.00'),
	   ('3',	'Gra orientacyjna',	    '8',	'pole namiotowe',	'niepe³ne',	'1352.00'),
	   ('2',	'Kolory Zakopanego',    '8',	'pole namiotowe',	'niepe³ne',	'1369.00'),
	   ('2',	'Góry i doliny',	    '8',	'pole namiotowe',	'pe³ne',	'1258.00'),
	   ('2',	'Tygrysie wczasy',    	'7',	'hotel',	        'pe³ne',	'1368.00'),
	   ('1',	'Oblicza Warszawy', 	'7',	'apartament',	    'niepe³ne',	'1297.00'),
	   ('1',	'Historia Stolicy',	    '7',	'hotel',	        'pe³ne',	'1895.00'),
	   ('1',	'Klasyczna Warszawa',  	'7',	'pensjonat',	    'niepe³ne',	'1398.00')

/*INSERT TYPWYCIECZKI*/
insert into TypWycieczki (Typ)
values ('krajowa'),
       ('zagraniczna')


/*****TWORZENIE RELACJI I UNIQUE*****/
/*ALTER CENTRALA*/
alter table Centrala
	add constraint Centrala_NrTelCeCheck
		check
			(NrTelCe like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

/*ALTER FILIA*/
alter table Filia
	add constraint Filia_NrTelFiCheck
		check
			(NrTelFi like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

alter table Filia
	add constraint FK_CentralaFilia
		foreign key (CentralaID) REFERENCES Centrala(CentralaID)

/*ALTER PRACOWNIK*/
alter table Pracownik
	add constraint Pracownik_NumerTelPrCheck
		check
		(NumerTelPr like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

alter table Pracownik
	add constraint FK_FiliaPracownik
		foreign key (FiliaID) REFERENCES Filia(FiliaID)

alter table Pracownik
	add constraint FK_TypPracownikaPracownik 
		foreign key (TypPrID) REFERENCES TypPracownika(TypPrID)

/*ALTER WYCIECZKA*/
alter table Wycieczka
	add constraint FK_FiliaWycieczka
		foreign key (FiliaID) REFERENCES Filia(FiliaID)

alter table Wycieczka
	add constraint FK_TypWycieczkiWycieczka
		foreign key (TypWycieczkiID) REFERENCES TypWycieczki(TypWycieczkiID)


/*ALTER PRACOWNIKWYCIECZKA*/
alter table PracownikWycieczka
	add constraint FK_WycieczkaID
		foreign key (WycieczkaID) REFERENCES Wycieczka(WycieczkaID)
	

alter table PracownikWycieczka
	add constraint FK_PracownikID
		foreign key (PracownikID) REFERENCES Pracownik(PracownikID)

/*ALTER FAKTURA*/

alter table Faktura
	add constraint FK_WycieczkaFaktura
		foreign key (WycieczkaID) REFERENCES Wycieczka(WycieczkaID)

alter table Faktura
	add constraint FK_PracownikFaktura
		foreign key (PracownikID) REFERENCES Pracownik(PracownikID)

/*ALTER AUTOKAR*/
alter table Wycieczka
	add constraint FK_AutokarWycieczka
		foreign key (AutokarID) REFERENCES Autokar(AutokarID)

/*ALTER PROGRAM*/
alter table Program
	add constraint FK_WycieczkaProgram
		foreign key (WycieczkaID) REFERENCES Wycieczka(WycieczkaID)

/*****TWORZENIE WIDOKÓW*****/

/*****TWORZENIE PROCEDUR*****/

/*Wypisz filie z danej centrali*/
create procedure wypiszFilie(
@centralaID int = null
)
as
begin
if @centralaID is not null
select * from Filia where CentralaID = @centralaID
else
select * from Filia
end;

exec wypiszFilie 1

/*****TWORZENIE ZAPYTAÑ*****/

/*Wypisz wszystkich pracowników z FiliaID = 1, podajac nazwe filii oraz typ pracownika*/
create view PracownicyZFilii_1
as
select p.PracownikID, p.FiliaID, Nazwisko, p.Imie, f.NazwaFi, t.Typ from Pracownik p left join Filia f
	on p.FiliaID = f.FiliaID left join TypPracownika t
		on t.TypPrID = p.TypPrID
where p.FiliaID = 1

select * from PracownicyZFilii_1

/*Wiek pracowników*/
create view WiekPracowników
as
select p.Nazwisko, p.Imie, DATEDIFF(YEAR, p.DataUrodzenia, GETDATE()) Wiek from Pracownik p

select * from WiekPracowników

/*srednia wieku*/
create view SredniaWieku
as
select avg(DATEDIFF(YEAR, p.DataUrodzenia, GETDATE())) srednia_wieku_pracownika from Pracownik p

select * from SredniaWieku

/*Wypisz wszystkich pracownikow biura na stanowisku 'pilot'*/
create view PracownikBiuraPilot
as
select Nazwisko, p.Imie, f.NazwaFi, t.Typ from Pracownik p left join Filia f
	on p.FiliaID = f.FiliaID left join TypPracownika t
		on t.TypPrID = p.TypPrID
		where t.Typ = 'PILOT'

select * from PracownikBiuraPilot

/*Do jakich miejsc filia 1 oragnizuje wycieczki?*/
create view WycieczkiFilii_1
as
select w.FiliaID, w.MiastoWy, w.KrajWy from Wycieczka w
where FiliaID = 1

select * from WycieczkiFilii_1

/*Program wycieczki do Zakopanego*/
create view WycieczkiDoZakopanego
as
select p.*, w.MiastoWy from Program p left join Wycieczka w
	on p.WycieczkaID = w.WycieczkaID
	where w.MiastoWy = 'Zakopane'

select * from WycieczkiDoZakopanego

create view Wycieczki_10
as
select * from Program p
where p.CzasTrwania >= 10

select * from Wycieczki_10

/*ile jest wycieczek zagranicznych podlegajacych pod centrale nr 1*/
create view WycieczkiCentrali_1
as
select c.CentralaID, f.FiliaID, w.NazwaWy, w.MiastoWy, w.KrajWy, t.Typ from Centrala c left join Filia f
on c.CentralaID = f.CentralaID left join Wycieczka w
on f.FiliaID = w.FiliaID left join TypWycieczki t
on w.TypWycieczkiID = t.TypWycieczkiID
where c.CentralaID = 1 and t.Typ = 'zagraniczna'

select * from WycieczkiCentrali_1

/*pole namiotowe*/
create view PoleNamiotowe
as
select w.WycieczkaID, w.NazwaWy, w.MiastoWy, p.Zakwaterowanie from Wycieczka w left join Program p
on w.WycieczkaID = p.WycieczkaID
where p.Zakwaterowanie = 'pole namiotowe'

select * from PoleNamiotowe


/*
Widok pokazujacy pracownikowi z filii 3 jakie ma wyciczki do zaoferowania swoim klientom
*/

create view WycieczkiDlaFilii_3
as
select f.FiliaID, w.WycieczkaID, w.NazwaWy, p.NazwaPr, p.Wyzywienie, p.Zakwaterowanie, w.MiastoWy, w.KrajWy, a.LiczbaMiejsc from Filia f left join Wycieczka w
on f.FiliaID = w.FiliaID left join Program p
on w.WycieczkaID = p.WycieczkaID left join Autokar a
on w.AutokarID = a.AutokarID
where f.FiliaID = 3

select * from WycieczkiDlaFilii_3

/* wypisz pracownikow o nazwiku na litere B, pokazujac do ktorej nalezy centrali*/
create view PracownicyB
as
select c.CentralaID, p.* from Pracownik p left join Filia f
on p.FiliaID = f.FiliaID left join Centrala c
on f.CentralaID = c.CentralaID
where p.Nazwisko like 'B%'

select * from PracownicyB


/*Wycieczka ktora droga, ktora tania*/
create view TYP_CENA
as
select *, 
case when p.CenaZaOsobe >= 1000 
then 'DROGA' else 'TANIA' end TYP_CENA
from Program p

select * from TYP_CENA
where TYP_CENA = 'DROGA'

/*Wypisz WYCIECZKI z danej FILII*/
create procedure wypiszWYCIECZKI(
@FiliaID int = null
)
as
begin
if @FiliaID is not null
select * from Wycieczka where FiliaID = @FiliaID
else
select * from Wycieczka
end;

exec wypiszWYCIECZKI 2


create function IloscFaktur1 (@IDPracownik int)
returns int
as
begin
	declare @IloscFaktur int
	set @IloscFaktur=0
	select @IloscFaktur = COUNT(*) from Faktura f
	where f.PracownikID = @IDPracownik
	return @IloscFaktur
end


select f.PracownikID, dbo.IloscFaktur1(PracownikID) iloscFaktur from Faktura f
group by f.PracownikID

/*jaka ilosc jest wycieczk dla podanej liczby dni*/

create function IloscWycieczek (@CzasTrwania int)
returns int
as
begin
	declare @IloscWycieczek int
	set @IloscWycieczek = 0
	select @IloscWycieczek = COUNT(*) from Program p
	where p.CzasTrwania = @CzasTrwania
	return @IloscWycieczek
end

select p.CzasTrwania, dbo.IloscWycieczek (CzasTrwania) IloscWycieczek from Program p
group by p.CzasTrwania


/*trigger*/

create trigger WyzwalaczNowaCentrala
on Centrala
for insert 
as
begin
	declare @nowaCentrala nvarchar(100);
	select top 1 @nowaCentrala = NazwaCe 
		from 	inserted;
	print @nowaCentrala
end

insert into Centrala(NazwaCe, NrTelCe)
values ('CENZAK', '500000300')


create trigger WyzwalaczNowyPracownik
on Pracownik
for insert 
as

	declare @nowyPracownik nvarchar(100);
	declare @wiek nvarchar(3);
	select top 1 @nowyPracownik = Nazwisko from inserted
	select @wiek = DATEDIFF(YEAR, DataUrodzenia, GETDATE()) from inserted
	IF @wiek >= 18
	print @nowyPracownik + ' ' + @wiek
ELSE
BEGIN
PRINT 'PRACOWNIK NIEPE£NOLETNI'
 RAISERROR ( 'ZBYT M£ODY',16,1)
 ROLLBACK
end


insert into Pracownik (FiliaID, Nazwisko, Imie, DataUrodzenia, DataZatrudnienia, NumerTelPr, TypPrID)
values ('9', 'mars', 'mars', '2005-09-02', '2020-01-25', '500000029', '1')


