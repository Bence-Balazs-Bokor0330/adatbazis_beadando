--diakok tábla

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE diakok
(
    diak_azon int NOT NULL,
    nev NVARCHAR(50) NOT NULL,
    szul_datum DATE NOT NULL,
    lakcim NVARCHAR(255) NOT NULL,
    email_cim NVARCHAR(255) NOT NULL,
    oktato_fk int NOT NULL,
    CONSTRAINT pk_diak PRIMARY KEY (diak_azon)
)

--(
--	[SZALLAS_ID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]

--jelentése : "Hozz létre egy elsődleges kulcshoz tartozó klaszteres indexet, amit csak akkor frissít statisztikailag, ha kell, hibát dobjon a duplikált kulcsnál, engedje a hatékony sor- és oldalzárolást, és a táblát az alapértelmezett fájlcsoportba rakja."


--ezek a sorok legyenek benne? géza sql file-jabol szedtem ki
 
--autók tábla


SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE autok
(
    auto_azon int NOT NULL,
    marka NVARCHAR(50) NOT NULL,
    rendszam NVARCHAR(10) NOT NULL,
    evjarat int NOT NULL,
    CONSTRAINT pk_auto PRIMARY KEY (auto_azon)
)


--oktatok tábla


SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE oktatok
(
    oktato_azon int NOT NULL,
    nev NVARCHAR(50) NOT NULL,
    telefonszam NVARCHAR(50) NOT NULL,
    miota_tanit int NOT NULL,
    auto_fk int NOT NULL,
    CONSTRAINT pk_oktato PRIMARY KEY (oktato_azon)
)


--utvonalak tábla


SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE utvonalak
(
    utvonal_azon int NOT NULL,
    indulas NVARCHAR(100) NOT NULL,
    erkezes NVARCHAR(100) NOT NULL,
    hossz DECIMAL(6, 3) NOT NULL,
    CONSTRAINT pk_utvonal PRIMARY KEY (utvonal_azon)
)


--orak tábla


SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE orak
(
    ora_azon int NOT NULL,
    diak_fk int NOT NULL,
    utvonal_fk int NOT NULL,
    vizsga bit NOT NULL,
    datum date NOT NULL
    CONSTRAINT pk_ora PRIMARY KEY (ora_azon)
)



INSERT INTO diakok (diak_azon, nev, szul_datum, lakcim, email_cim, oktato_fk) VALUES
(1, N'Kiss Dániel', N'1998.04.23', N'1024 Budapest, Rózsa u. 12.', 'daniel.kiss@gmail.com', 6),
(2, N'Tóth Eszter', N'1995.11.12', N'4026 Debrecen, Béke tér 8.', 'eszter.toth@gmail.com', 1),
(3, N'Szabó Péter', N'2001.07.04', N'6723 Szeged, Tavasz u. 44.', 'peter.szabo@gmail.com', 11),
(4, N'Varga Júlia', N'2003.02.28', N'7400 Kaposvár, Hársfa u. 7.', 'julia.varga@gmail.com', 7),
(5, N'Horváth Ádám', N'1996.08.15', N'8000 Székesfehérvár, Arany J. u. 3.', 'adam.horvath@gmail.com', 13),
(6, N'Balogh Emese', N'2005.12.05', N'4032 Debrecen, Csillag u. 19.', 'emese.balogh@gmail.com', 15),
(7, N'Lakatos Gergely', N'2002.09.17', N'6000 Kecskemét, Vörösmarty u. 22.', 'gergely.lakatos@gmail.com', 12),
(8, N'Molnár Zsófia', N'2004.03.30', N'9022 Győr, Baross G. u. 18.', 'zsofia.molnar@gmail.com', 3),
(9, N'Farkas Levente', N'1999.10.09', N'3527 Miskolc, Madarász V. u. 5.', 'levente.farkas@gmail.com', 10),
(10, N'Németh Anna', N'2000.05.06', N'9700 Szombathely, Hunyadi J. u. 2.', 'anna.nemeth@gmail.com', 8),
(11, N'Papp Bence', N'2003.01.17', N'1085 Budapest, Kőris u. 3.', 'bence.papp@gmail.com', 5),
(12, N'Simon Katalin', N'1996.09.04', N'8800 Nagykanizsa, Kodály Z. u. 6.', 'katalin.simon@gmail.com', 9),
(13, N'Oláh Zoltán', N'1997.06.23', N'2143 Kistarcsa, Kossuth L. u. 25.', 'zoltan.olah@gmail.com', 4),
(14, N'Jakab Veronika', N'2005.02.14', N'6500 Baja, Váci M. u. 11.', 'veronika.jakab@gmail.com', 14),
(15, N'Fekete Márk', N'1995.08.01', N'4024 Debrecen, Hatvan u. 20.', 'mark.fekete@gmail.com', 2),
(16, N'Vass Petra', N'2004.10.30', N'8200 Veszprém, Rákóczi u. 8.', 'petra.vass@gmail.com', 2),
(17, N'Bodnár Tamás', N'2000.03.13', N'7100 Szekszárd, Kölcsey u. 4.', 'tamas.bodnar@gmail.com', 7),
(18, N'Kocsis Laura', N'2002.07.20', N'7621 Pécs, Irgalmasok utcája 2.', 'laura.kocsis@gmail.com', 14),
(19, N'Török Norbert', N'1999.12.18', N'8600 Siófok, Fő tér 5.', 'norbert.torok@gmail.com', 6),
(20, N'Fehér Nóra', N'2006.11.09', N'1143 Budapest, Stefánia út 45.', 'nora.feher@gmail.com', 13),
(21, N'Gábor Dániel', N'2001.05.25', N'3300 Eger, Széchenyi u. 33.', 'daniel.gabor@gmail.com', 12),
(22, N'Csóka Mária', N'1997.06.12', N'5700 Gyula, Kossuth tér 17.', 'maria.csoka@gmail.com', 10),
(23, N'Barta István', N'2003.04.01', N'9200 Mosonmagyaróvár, Deák F. u. 21.', 'istvan.barta@gmail.com', 8),
(24, N'Pálfi Dóra', N'2004.01.19', N'2500 Esztergom, Petőfi u. 9.', 'dora.palfi@gmail.com', 5),
(25, N'Major Levente', N'1995.03.30', N'7100 Szekszárd, Dózsa Gy. u. 12.', 'levente.major@gmail.com', 3),
(26, N'Tálos Nikolett', N'1998.02.16', N'1238 Budapest, Ócsai út 91.', 'nikolett.talos@gmail.com', 15),
(27, N'Rácz Attila', N'2000.09.08', N'2721 Pilis, Rét u. 18.', 'attila.racz@gmail.com', 11),
(28, N'Sebők Judit', N'2001.12.27', N'8000 Székesfehérvár, Jókai u. 15.', 'judit.sebok@gmail.com', 9),
(29, N'Bognár László', N'1999.07.05', N'8800 Nagykanizsa, Ady E. u. 13.', 'laszlo.bognar@gmail.com', 1),
(30, N'Illés Fanni', N'2005.08.26', N'1041 Budapest, István u. 1.', 'fanni.illes@gmail.com', 4);



INSERT INTO autok (auto_azon, marka, rendszam, evjarat) VALUES
(1, N'Toyota', N'GHT-928', 2010),
(2, N'Ford', N'BXR-517', 2016),
(3, N'Volkswagen', N'MNL-384', 2012),
(4, N'Opel', N'KZA-746', 2020),
(5, N'Renault', N'VEC-105', 2018),
(6, N'Honda', N'PRD-661', 2011),
(7, N'Kia', N'JTY-492', 2017),
(8, N'Hyundai', N'LCB-738', 2009),
(9, N'Skoda', N'DWE-206', 2015),
(10, N'Peugeot', N'RKM-874', 2013),
(11, N'Mazda', N'HZB-319', 2021),
(12, N'Fiat', N'NPV-552', 2014),
(13, N'Citroën', N'AXR-680', 2008),
(14, N'Suzuki', N'QLM-433', 2022),
(15, N'Seat', N'WET-109', 2007);



INSERT INTO oktatok (oktato_azon, nev, telefonszam, miota_tanit, auto_fk) VALUES
(1, N'Kovács László', N'06301294857', 2005, 15),
(2, N'Nagy Erika', N'06702938412', 2010, 14),
(3, N'Tóth Gábor', N'06203471856', 2003, 2),
(4, N'Szabó Zoltán', N'06308756493', 2007, 12),
(5, N'Varga Katalin', N'06209834175', 2012, 13),
(6, N'Kiss Péter', N'06703471286', 2009, 8),
(7, N'Horváth Anikó', N'06301283749', 2011, 11),
(8, N'Balogh István', N'06704329518', 2004, 10),
(9, N'Farkas Judit', N'06205791834', 2015, 5),
(10, N'Lakatos Bence', N'06309871245', 2008, 3),
(11, N'Szűcs Dóra', N'06702461389', 2013, 7),
(12, N'Juhász Gergely', N'06208734129', 2006, 4),
(13, N'Molnár Csilla', N'06303579124', 2016, 1),
(14, N'Németh András', N'06709812463', 2002, 9),
(15, N'Takács Lili', N'06204395781', 2020, 6);



INSERT INTO utvonalak (utvonal_azon, indulas, erkezes, hossz) VALUES
(1, N'Bartók Béla út', N'Váci út', 5.7),
(2, N'Üllői út', N'Október huszonharmadika utca', 3.8),
(3, N'Nagykörút', N'Fehérvári út', 4.5),
(4, N'Rákóczi út', N'Szépvölgyi út', 6.3),
(5, N'Andrássy út', N'Thököly út', 3.2),
(6, N'Tétényi út', N'Béke utca', 7.1),
(7, N'Mester utca', N'Hűvösvölgyi út', 8.4),
(8, N'Lehel utca', N'Hengermalom út', 4.9),
(9, N'Kerepesi út', N'Kós Károly sétány', 2.6),
(10, N'Szentendrei út', N'Fő utca (Óbuda)', 6.8),
(11, N'Váci út', N'Fogarasi út', 5.1),
(12, N'Pesti út', N'Ady Endre út', 9.2),
(13, N'Thököly út', N'Margit körút', 4.0),
(14, N'Kiskörút', N'Haller utca', 3.6),
(15, N'Ferihegyi út', N'Róbert Károly körút', 10.4),
(16, N'Sibrik Miklós út', N'Árpád fejedelem útja', 11.2),
(17, N'Soroksári út', N'Tímár utca', 5.9),
(18, N'Béke utca', N'Nagy Lajos király útja', 2.1),
(19, N'Táncsics Mihály utca', N'Villányi út', 7.6),
(20, N'Budaörsi út', N'Kőbányai út', 12.0);



INSERT INTO orak (ora_azon, diak_fk, utvonal_fk, vizsga, datum) VALUES
(1, 17, 3, 0, N'2025.05.01'),
(2, 1, 11, 1, N'2025.04.26'),
(3, 12, 9, 1, N'2025.04.21'),
(4, 21, 14, 0, N'2025.04.16'),
(5, 15, 14, 0, N'2025.04.11'),
(6, 24, 12, 0, N'2025.04.06'),
(7, 12, 19, 1, N'2025.04.01'),
(8, 29, 13, 1, N'2025.03.27'),
(9, 14, 5, 1, N'2025.03.22'),
(10, 24, 18, 0, N'2025.03.17'),
(11, 22, 5, 0, N'2025.03.12'),
(12, 30, 16, 1, N'2025.03.07'),
(13, 6, 1, 0, N'2025.03.02'),
(14, 13, 1, 0, N'2025.02.25'),
(15, 28, 14, 1, N'2025.02.20'),
(16, 27, 1, 0, N'2025.02.15'),
(17, 4, 1, 0, N'2025.02.10'),
(18, 1, 18, 0, N'2025.02.05'),
(19, 27, 9, 1, N'2025.01.31'),
(20, 1, 3, 0, N'2025.01.26'),
(21, 5, 19, 0, N'2025.01.21'),
(22, 24, 1, 0, N'2025.01.16'),
(23, 18, 20, 1, N'2025.01.11'),
(24, 14, 20, 1, N'2025.01.06'),
(25, 29, 17, 0, N'2025.01.01'),
(26, 1, 7, 1, N'2024.12.27'),
(27, 23, 7, 1, N'2024.12.22'),
(28, 27, 20, 1, N'2024.12.17'),
(29, 30, 10, 1, N'2024.12.12'),
(30, 18, 9, 1, N'2024.12.07'),
(31, 22, 13, 0, N'2024.12.02'),
(32, 25, 20, 1, N'2024.11.27'),
(33, 19, 4, 1, N'2024.11.22'),
(34, 9, 7, 1, N'2024.11.17'),
(35, 18, 11, 1, N'2024.11.12'),
(36, 13, 6, 1, N'2024.11.07'),
(37, 2, 6, 0, N'2024.11.02'),
(38, 20, 17, 1, N'2024.10.28'),
(39, 23, 8, 0, N'2024.10.23'),
(40, 24, 12, 1, N'2024.10.18'),
(41, 25, 2, 0, N'2024.10.13'),
(42, 4, 12, 0, N'2024.10.08'),
(43, 15, 3, 1, N'2024.10.03'),
(44, 20, 11, 0, N'2024.09.28'),
(45, 28, 8, 1, N'2024.09.23'),
(46, 12, 18, 0, N'2024.09.18'),
(47, 23, 5, 0, N'2024.09.13'),
(48, 5, 3, 1, N'2024.09.08'),
(49, 13, 6, 0, N'2024.09.03'),
(50, 18, 10, 0, N'2024.08.29'),
(51, 4, 12, 1, N'2024.08.24'),
(52, 4, 9, 0, N'2024.08.19'),
(53, 19, 1, 0, N'2024.08.14'),
(54, 17, 7, 0, N'2024.08.09'),
(55, 21, 16, 1, N'2024.08.04'),
(56, 11, 20, 1, N'2024.07.30'),
(57, 23, 1, 0, N'2024.07.25'),
(58, 4, 12, 1, N'2024.07.20'),
(59, 25, 1, 1, N'2024.07.15'),
(60, 30, 4, 0, N'2024.07.10'),
(61, 7, 2, 0, N'2024.07.05'),
(62, 10, 3, 0, N'2024.06.30'),
(63, 12, 18, 0, N'2024.06.25'),
(64, 24, 18, 0, N'2024.06.20'),
(65, 10, 3, 0, N'2024.06.15'),
(66, 29, 16, 1, N'2024.06.10'),
(67, 7, 11, 1, N'2024.06.05'),
(68, 13, 18, 0, N'2024.05.31'),
(69, 30, 19, 0, N'2024.05.26'),
(70, 13, 1, 1, N'2024.05.21'),
(71, 11, 20, 0, N'2024.05.16'),
(72, 25, 12, 1, N'2024.05.11'),
(73, 7, 19, 1, N'2024.05.06'),
(74, 8, 7, 1, N'2024.05.01'),
(75, 9, 11, 0, N'2024.04.26'),
(76, 6, 9, 1, N'2024.04.21'),
(77, 4, 8, 0, N'2024.04.16'),
(78, 4, 11, 1, N'2024.04.11'),
(79, 23, 12, 0, N'2024.04.06'),
(80, 26, 1, 1, N'2024.04.01'),
(81, 14, 5, 0, N'2024.03.27'),
(82, 24, 13, 1, N'2024.03.22'),
(83, 11, 2, 0, N'2024.03.17'),
(84, 3, 4, 1, N'2024.03.12'),
(85, 5, 10, 0, N'2024.03.07'),
(86, 28, 4, 1, N'2024.03.02'),
(87, 12, 19, 0, N'2024.02.26'),
(88, 4, 8, 0, N'2024.02.21'),
(89, 28, 4, 1, N'2024.02.16'),
(90, 21, 7, 1, N'2024.02.11'),
(91, 9, 13, 0, N'2024.02.06'),
(92, 22, 2, 0, N'2024.02.01'),
(93, 27, 19, 0, N'2024.01.27'),
(94, 23, 20, 1, N'2024.01.22'),
(95, 28, 3, 1, N'2024.01.17'),
(96, 6, 16, 0, N'2024.01.12'),
(97, 2, 3, 1, N'2024.01.07'),
(98, 8, 1, 1, N'2024.01.02'),
(99, 8, 13, 0, N'2023.12.28'),
(100, 26, 5, 0, N'2023.12.23');





ALTER TABLE diakok WITH CHECK ADD CONSTRAINT fk_diak_oktato FOREIGN KEY(oktato_fk) REFERENCES oktatok (oktato_azon)

ALTER TABLE diakok CHECK CONSTRAINT fk_diak_oktato



ALTER TABLE oktatok WITH CHECK ADD CONSTRAINT fk_oktato_auto FOREIGN KEY (auto_fk) REFERENCES autok (auto_azon)

ALTER TABLE oktatok CHECK CONSTRAINT fk_oktato_auto



ALTER TABLE orak WITH CHECK ADD CONSTRAINT fk_orak_diak FOREIGN KEY (diak_fk) REFERENCES diakok (diak_azon)

ALTER TABLE orak CHECK CONSTRAINT fk_orak_diak



ALTER TABLE orak WITH CHECK ADD CONSTRAINT fk_orak_utvonal FOREIGN KEY (utvonal_fk) REFERENCES utvonalak (utvonal_azon)

ALTER TABLE orak CHECK CONSTRAINT fk_orak_utvonal