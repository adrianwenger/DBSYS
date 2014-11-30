/* Frage 1 */
SELECT * 
From dbsys33.Ferienwohnung
Where 
WOHNUNG_NAME NOT IN (SELECT WOHNUNG_NAME FROM dbsys33.Buchung WHERE (ZEITRAUM_VON BETWEEN TO_DATE('01.11.2012', 'DD.MM.YYYY') AND TO_DATE('21.11.2012', 'DD.MM.YYYY')) AND 
(ZEITRAUM_BIS BETWEEN TO_DATE('01.11.2012', 'DD.MM.YYYY') AND TO_DATE('21.11.2012', 'DD.MM.YYYY'))) AND
WOHNUNG_NAME IN (SELECT WOHNUNG_NAME From dbsys33.Besitzt WHERE BEZEICHNUNG Like 'Sauna') AND 
WOHNUNG_NAME  IN (SELECT WOHNUNG_NAME FROM dbsys33.FERIENWOHNUNG WHERE LAND_NAME Like 'Spanien');

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








