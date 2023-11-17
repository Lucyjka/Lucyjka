INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
	(1, 'Margaret', 'Tatcher', 'Frankfurt', 556786934),
	(2, 'Barack', 'Obama', 'Nebraska', 885946372 ),
	(3, 'Donald', 'Trump', 'Alabama', 675936102),
	(4, 'Andrzej', 'Duda', 'Czarnobyl', 987345023),
	(5, 'Ewa', 'Kopacz', 'Ciechocinek', 456357239),
	(6, 'Szymon', 'Holownia', 'Bialystok', 987564386),
	(7, 'Krolowa', 'Elzbieta', 'Liverpool', 987675463),
	(8, 'Adolf', 'Hitler', 'Berlin', 876958365),
	(9, 'George', 'Washington', 'Waszyngton', 456786934),
	(10, 'Grzegorz', 'Braun', 'Przybyszowka', 987967584 );	


INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
    (1, '2023-11-01', 8, 6),
    (2, '2023-11-02', 7, 2),
    (3, '2023-11-03', 9, 2),
    (4, '2023-11-04', 8, 4),
    (5, '2023-11-05', 7, 9),
    (6, '2023-11-06', 9, 6),
    (7, '2023-11-07', 8, 3),
    (8, '2023-11-08', 7, 8),
    (9, '2023-11-09', 9, 2),
    (10, '2023-11-10', 8, 10);
	

INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota)
VALUES
(1, 'kierownik', 2000),
(2, 'personel sprzatajacy', 10000),
(3, 'ksiegowy', 35000),
(4, 'medyk', 3000),
(5, 'stazysta', 45000),
(6, 'zaopatrzeniowiec', 9000),
(7, 'asystent', 5000),
(8, 'informatyk', 8000),
(9, 'hr', 12000),
(10, 'programista', 30000);

INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES
    (1, 'Premia świąteczna', 1000),
    (2, 'Premia kwartalna', 750),
    (3, 'Premia za wydajność', 500),
    (4, 'Premia roczna', 1500),
    (5, 'Premia specjalna', 1200),
    (6, 'Premia za  pracę', 800),
    (7, 'Premia za  projekt', 600),
    (8, 'Premia za  sprzedaż', 900),
    (9, 'Premia za zasługi', 1100),
    (10, 'Premia za innowacje', 950);

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
    (1, '2023-11-01', 1, 2, 3, 4),
    (2, '2023-11-02', 2, 3, 4, 5),
    (3, '2023-11-03', 3, 4, 5, 6),
    (4, '2023-11-04', 4, 5, 6, 7),
    (5, '2023-11-05', 5, 6, 7, 8),
    (6, '2023-11-06', 6, 7, 8, 9),
    (7, '2023-11-07', 7, 8, 9, 10),
    (8, '2023-11-08', 8, 9, 10, 1),
    (9, '2023-11-09', 9, 10, 1, 2),
    (10, '2023-11-10', 10, 1, 2, 3);


SELECT id_pracownika, nazwisko 
FROM ksiegowosc.pracownicy



SELECT 
ksiegowosc.pracownicy.id_pracownika,
(ksiegowosc.pensje.kwota + ksiegowosc.premie.kwota) AS placa
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
WHERE
    (ksiegowosc.pensje.kwota + ksiegowosc.premie.kwota) > 1000;



SELECT 
ksiegowosc.pracownicy.id_pracownika,
ksiegowosc.pensje.kwota AS placa
FROM ksiegowosc.pracownicy
FULL OUTER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
FULL OUTER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
FULL OUTER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
WHERE
 (ksiegowosc.wynagrodzenie.id_premii) = 4 AND ksiegowosc.pensje.kwota > 2000;



--nie mam w tabeli nikogo na J wiec dobralam G
SELECT  id_pracownika, imie
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'G%'

 SELECT *
 FROM ksiegowosc.pracownicy
 WHERE nazwisko LIKE '%n%' AND imie LIKE '%n'


-- dodalam godziny zeby moc wykonac cwiczenie z nadgodzinami
UPDATE ksiegowosc.godziny
SET liczba_godzin = liczba_godzin + 160;


SELECT 
imie, 
nazwisko,
(liczba_godzin - 160) AS liczba_nadgodzin
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika


SELECT imie, nazwisko, kwota
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota > 1500 AND ksiegowosc.pensje.kwota < 3000


SELECT imie, nazwisko
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
LEFT JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
WHERE (( ksiegowosc.godziny.liczba_godzin - 160) > 0) AND (ksiegowosc.wynagrodzenie.id_premii = NULL )

SELECT imie, nazwisko, kwota
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
ORDER BY kwota;


SELECT imie, nazwisko, (pensje.kwota+premie.kwota) AS SumaKwot
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
ORDER BY pensje.kwota+premie.kwota DESC;


SELECT stanowisko, COUNT(*) AS liczba_pracownikow
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
GROUP BY pensje.stanowisko;



SELECT 
    AVG(pensje.kwota + premie.kwota) AS srednia_placa,
    MIN(pensje.kwota + premie.kwota) AS minimalna_placa,
    MAX(pensje.kwota + premie.kwota) AS maksymalna_placa
FROM ksiegowosc.pensje
INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
WHERE stanowisko = 'kierownik';


SELECT 
	SUM(pensje.kwota + premie.kwota) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji


SELECT 
	stanowisko,
	pensje.kwota + premie.kwota AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji


SELECT 
	stanowisko,
	COUNT(*) AS liczba_premii
FROM ksiegowosc.premie
INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenie.id_premii
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
GROUP BY stanowisko


DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (
    SELECT DISTINCT pracownicy.id_pracownika
    FROM ksiegowosc.pracownicy 
    JOIN ksiegowosc.wynagrodzenie  ON premie.id_pracownika = wynagrodzenie.id_pracownika
    JOIN ksiegowosc.pensje  ON wynagrodzenie.id_pensji = pensje.id_pensji
    WHERE pensje.kwota < 1200
);