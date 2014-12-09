/* Frage 1 */
SELECT dbsys35.FERIENWOHNUNG.fewonr
FROM dbsys35.FERIENWOHNUNG INNER JOIN dbsys35.BESITZTAUSSTATTUNG
ON (BESITZTAUSSTATTUNG.FEWONR = FERIENWOHNUNG.FEWONR) LEft OUTER JOIN
(SELECT Fewonr from dbsys35.BUCHUNG WHERE BUCHUNG.von <= '21.11.2012'
AND BUCHUNG.bis >= '01.11.2012') buchung on (buchung.fewonr = ferienwohnung.fewonr)
WHERE buchung.Fewonr is null AND FERIENWOHNUNG.LANDNAME='Spanien'
AND besitztausstattung.ausstattungsname = 'Sauna'
GROUP BY dbsys35.FERIENWOHNUNG.fewonr;


/* Frage 2 */
SELECT dbsys33.Besitzt.WOHNUNG_NAME
From dbsys33.Besitzt
GROUP BY dbsys33.Besitzt.WOHNUNG_NAME
Having COUNT(dbsys33.Besitzt.Bezeichnung) = (SELECT MAX(besitzt.Anzahl)
                From (SELECT WOHNUNG_NAME, COUNT(Bezeichnung) as Anzahl
                      From dbsys33.Besitzt
                      GROUP BY dbsys33.Besitzt.WOHNUNG_NAME) 
                besitzt);
                

/* Frage 3 */
SELECT land.LAND_NAME, COUNT(kuenftigebuchung.ZEITRAUM_VON) as ANZAHL
FROM dbsys33.LAND land INNER JOIN dbsys33.Ferienwohnung fewo ON (land.LAND_NAME = fewo.LAND_NAME)
LEFT OUTER JOIN (SELECT WOHNUNG_NAME, ZEITRAUM_VON FROM dbsys33.BUCHUNG WHERE ZEITRAUM_VON > (SELECT TO_CHAR(SYSDATE, 'DD.MM.YYYY') FROM DUAL)) kuenftigebuchung ON (fewo.WOHNUNG_NAME = kuenftigebuchung.WOHNUNG_NAME)
GROUP BY land.LAND_NAME
ORDER BY ANZAHL DESC;








