-- Milyen hosszú a 3 leggyakrabban előforduló útvonal a vizsgákon?
SELECT TOP 3 o.utvonal_fk, u.hossz
from orak o JOIN utvonalak u On o.utvonal_fk = u.utvonal_azon
WHERE o.vizsga = 1
GROUP by o.utvonal_fk, u.hossz
ORDER by COUNT(o.utvonal_fk) DESC

--Melyik oktató tette meg a legtöbb km-t és milyen autóval tette azt? Adja meg az oktató nevét, a megtett út hosszát és az autó márkáját!
select TOP 1 o.nev, sum(u.hossz), a.marka
from oktatok o JOIN diakok d ON d.oktato_fk = o.oktato_azon
			   JOIN orak ok  ON ok.diak_fk = d.diak_azon
               JOIN utvonalak u ON u.utvonal_azon = ok.utvonal_fk
               JOIN autok a ON o.auto_fk = a.auto_azon
GROUP BY o.nev, a.marka
ORDER BY sum(u.hossz) DESC 

-- Mi az átlagos életkora azoknak a diákoknak, akik német autót vezetnek? (Volkswagen és Opel)
SELECT AVG(YEAR(GETDATE()) - YEAR(d.szul_datum))
FROM autok a JOIN oktatok ok ON a.auto_azon = ok.auto_fk
			 JOIN diakok d ON ok.oktato_azon = d.oktato_fk
WHERE a.marka IN ('Volkswagen', 'Opel')

--Jelenítse meg a dátumokat és mellette egy új oszlopban az addig megtett út hosszát.
SELECT o.datum, u.hossz, u.hossz OVER(ORDER BY o.datum RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as 'Eddig megtett út'
FROM orak o JOIN utvonalak u ON o.utvonal_fk = u.utvonal_azon
ORDER BY o.datum ASC 

-- Hány különböző tanuló járt egy adott útvonalon? Adja meg az útvonal kezdő- és végpontját, illetve a tanulók számát, majd rendezze csökkenő sorrendbe eszerint.
select u.indulas, u.erkezes, COUNT(d.diak_azon)
FROM diakok d JOIN oktatok ok ON d.oktato_fk = ok.oktato_azon
			  JOIN orak o ON o.diak_fk = d.diak_azon
              JOIN utvonalak u ON u.utvonal_azon = o.utvonal_fk
GROUP by u.indulas, u.erkezes
order by COUNT(d.diak_azon) DESC
