/* Teil3 a */
DROP TABLE STORNIERTE_BUCHUNGEN CASCADE CONSTRAINTS;


CREATE TABLE STORNIERTE_BUCHUNGEN
(
BuchungsNr NUMBER GENERATED ALWAYS AS IDENTITY,
Datum DATE NOT NULL,
Bewertung NUMBER(1) CHECK(Bewertung >0 AND Bewertung <6),
Zeitraum_von DATE NOT NULL,
Zeitraum_bis DATE NOT NULL,
RechnungsNr NUMBER,
Zahlungseingang DATE,
KdNr NUMBER NOT NULL,
Wohnung_Name varchar(60) NOT NULL,
StornierungsDatum DATE NOT NULL,
CONSTRAINT pk_STORNIERTE_BUCHUNGEN PRIMARY KEY(BuchungsNr)
);

Commit;

CREATE OR REPLACE TRIGGER INSERT_STORNIERTE_BUCHUNGEN 
  BEFORE DELETE ON BUCHUNG
  FOR EACH ROW
  BEGIN
    INSERT INTO STORNIERTE_BUCHUNGEN (Datum, Bewertung, Zeitraum_von, Zeitraum_bis, Zahlungseingang, Wohnung_Name,KDNR, STORNIERUNGSDATUM) 
    VALUES (  :old.Datum,
              :old.Bewertung,
              :old.Zeitraum_von,
              :old.Zeitraum_bis,
              :old.Zahlungseingang,  
              :old.Wohnung_Name,
              :old.KDNR,
              SYSDATE
          );    
END;
/

/* Insert Test-Datensatz */
INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('31.12.1900', 'DD.MM.YYYY'), TO_DATE('01.01.1901', 'DD.MM.YYYY'), 
TO_DATE('01.01.1902', 'DD.MM.YYYY'), 'Zum Wallach', 1);
commit;

/* Test Datensatz wieder löschen um Trigger zu feuern */
DELETE 
FROM  BUCHUNG
WHERE  BUCHUNGSNR = (Select Max(BUCHUNGSNR)
FROM BUCHUNG);
commit;


/* Teil 3 b */

/* Buchung als bezahlt markieren */
UPDATE Buchung
SET Rechnungsnr = 123456789,
    Wert = 1500,
    Zahlungseingang = TO_CHAR(SYSDATE, 'DD.MM.YYYY')
WHERE  BUCHUNGSNR = (Select Max(BUCHUNGSNR)
FROM BUCHUNG);
Commit;

/* View Kundenstatistik erstellen */
CREATE OR REPLACE VIEW Kundenstatistik AS 
   SELECT Kunden.KDNR,  SumZahlungen.Summe, COALESCE(AnzBuchungen.AnzBuchungen, 0) AS AnzBuchungen, AnzStorno.AnzStorno
   FROM Kunden LEFT OUTER JOIN (Select KDNR, Sum(Wert) as Summe From Buchung Group By KDNR Having Sum(Wert) > 0) SumZahlungen ON (SumZahlungen.KDNR = Kunden.KDNR)
   LEFT OUTER JOIN (SELECT KDNR, count(*) as AnzBuchungen FROM BUCHUNG GROUP BY KDNR) AnzBuchungen ON (KUNDEN.KDNR = AnzBuchungen.KDNR)
   LEFT OUTER JOIN (SELECT KDNR, count(*) as AnzStorno FROM STORNIERTE_BUCHUNGEN GROUP BY KDNR) AnzStorno ON (KUNDEN.KDNR = AnzStorno.KDNR)

;

DELETE 
FROM  BUCHUNG
WHERE Buchungsnr = 4;
commit;

/* Muster Abfragen für From Klausel 
/* Summe aller Zahlungen
Select KDNR, Sum(Wert) as Summe
From Buchung
Group By KDNR
Having Sum(Wert) > 0;
*/
 
/* Anzahl Buchungen 
SELECT KDNR, count(*) as AnzBuchungen
FROM BUCHUNG
GROUP BY KDNR;
*/

/* Anzahl Stornierungen
SELECT KDNR, count(*) as Anzahl_Buchungen
FROM STORNIERTE_BUCHUNGEN
GROUP BY KDNR;
*/


