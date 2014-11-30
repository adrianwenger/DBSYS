--Länder erstellen
INSERT INTO LAND (Land_Name) VALUES ('Deutschland');
INSERT INTO LAND (Land_Name) VALUES ('Spanien');
--INSERT INTO LAND (Land_Name) VALUES ('Portugal');
INSERT INTO LAND (Land_Name) VALUES ('Schweiz');
INSERT INTO LAND (Land_Name) VALUES ('Österreich');
--INSERT INTO LAND (Land_Name) VALUES ('Niederlande');
INSERT INTO LAND (Land_Name) VALUES ('Italien');
--INSERT INTO LAND (Land_Name) VALUES ('Frankreich');
INSERT INTO LAND (Land_Name) VALUES ('Schweden');
--INSERT INTO LAND (Land_Name) VALUES ('Griechenland');
COMMIT;

--Kunden erstellen
INSERT INTO KUNDEN (K_Name, Vorname, Land_Name, PLZ, Ort, Strasse, Email,BIC, IBAN, Benutzername, Passwort) 
VALUES ('Mueller', 'Peter', 'Deutschland', 88433, 'Schemmerhofen', 'Brunnengasse 1', 'muellerpeter@hotmail.de', '12345678B', 'DE85123456780123456789', 'GeilerPeter', '9');
INSERT INTO KUNDEN (K_Name, Vorname, Land_Name, PLZ, Ort, Strasse, Email,BIC, IBAN, Benutzername, Passwort) 
VALUES ('Sauter', 'Karl', 'Österreich', 1004, 'Wien', 'Karlsstrasse 7', 'sauterkarle@hotmail.de', '12345678B', 'DE85123456780123456789', 'SauKalle', '13234');
INSERT INTO KUNDEN (K_Name, Vorname, Land_Name, PLZ, Ort, Strasse, Email,BIC, IBAN, Benutzername, Passwort) 
VALUES ('Franz', 'Klemens', 'Schweiz', 1003333, 'Zürich', 'Badstrasse 22', 'rle@webmail.de', '3455678B', 'DE55123456780123456789', 'Franz', '1333333G3234');

COMMIT;

--Ferienwohnung erstellen
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('Garden Eden', 60.50, 119.99, 4.5, 'Schweden');
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('Golden Palace', 40.75, 75.55, 3.0, 'Schweiz');
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('Zum Wallach', 30.00, 59.99, 2.5, 'Deutschland');
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('El Barto', 40.00, 69.99, 2.5, 'Spanien');
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('El Torro', 70.00, 155.99, 4.5, 'Spanien');
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('El Gaucho', 150.00, 450.99, 8.5, 'Spanien');
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('El Alonso', 45.00, 50.99, 1.5, 'Spanien');
INSERT INTO FERIENWOHNUNG (Wohnung_Name, Groesse, Preis, AnzZimmer, Land_Name) VALUES ('Villa Venezia', 450.00, 2580.99, 15.5, 'Italien');
COMMIT;


--Ausstattung erstellen
INSERT INTO AUSSTATTUNG (Bezeichnung, Beschreibung) VALUES ('Whirlpool', 'ist ein Wasserbecken, in dem durch Düsen Luft eingeblasen und/oder kraftvolle Wasserstrahle erzeugt werden. Luftblasen bewirken eine eher sanfte und flächige Massage, Wasserstrahlen eine eher kräftige und punktuelle.');
INSERT INTO AUSSTATTUNG (Bezeichnung, Beschreibung) VALUES ('Balkon', 'Plattform an einem Gebäude, die über dem Geländeniveau liegt und aus dem Baukörper herausragt von der aus Sie eine wunderschönen Blick über das umliegende Land.'); 
INSERT INTO AUSSTATTUNG (Bezeichnung, Beschreibung) VALUES ('Tennisplatz', 'Damit Sie sich auch bei uns austoben können besitzen wir auf unserem Anwesen einen gepflegten Tennisplatz auf dem Sie sich mit ihrer Famile oder anderen Hotelgästen messen können.');
INSERT INTO AUSSTATTUNG (Bezeichnung, Beschreibung) VALUES ('Thai-Massage','In unserem eigens für Sie kreierten Wohlfühloase der Entspannung und Erholung warten mehrere ausgebildete Masseusen die sich voll und ganz um Sie kümmern.');                       
INSERT INTO AUSSTATTUNG (Bezeichnung, Beschreibung) VALUES ('Hotelbar', 'Um Ihnen auch abends größtmögliche Unterhaltung bieten zu können öffnet unsere Hotelbar jeden Abend um 19:00 Uhr ihre Pforten. Unser Angebot reicht vom heimischen Bier bis hin zu exotischen Spirituosen. Für die Kleinen ist auch gesorgt.');
INSERT INTO AUSSTATTUNG (Bezeichnung, Beschreibung) VALUES ('Sauna', 'Für einen entspannten Sonntag bieten wir Ihnen unsere Sauna mit verschiedenen Wohlfühldüften.');
COMMIT;

--besitzt erstellen
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Sauna', 'El Barto');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Balkon', 'Zum Wallach');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Tennisplatz', 'Golden Palace');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Thai-Massage', 'Garden Eden');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Whirlpool', 'Garden Eden');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Hotelbar', 'Golden Palace');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Sauna', 'El Torro');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Whirlpool', 'El Gaucho');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Whirlpool', 'Villa Venezia');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Sauna', 'Villa Venezia');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Hotelbar', 'Villa Venezia');
INSERT INTO BESITZT (Bezeichnung, Wohnung_Name) VALUES ('Sauna', 'El Alonso');
COMMIT;


--Buchung erstellen
INSERT INTO BUCHUNG (Datum, Bewertung, Zeitraum_von, Zeitraum_bis, Zahlungseingang, Wohnung_Name,KDNR) 
VALUES (TO_DATE('14.04.2014', 'DD.MM.YYYY'), 1, TO_DATE('13.05.2014', 'DD.MM.YYYY'), 
TO_DATE('17.05.2014', 'DD.MM.YYYY'), TO_DATE('11.05.2014', 'DD.MM.YYYY'), 'Garden Eden', 2);

INSERT INTO BUCHUNG (Datum, Bewertung, Zeitraum_von, Zeitraum_bis, Zahlungseingang, Wohnung_Name,KDNR) 
VALUES (TO_DATE('24.04.2015', 'DD.MM.YYYY'), 1, TO_DATE('13.05.2015', 'DD.MM.YYYY'), 
TO_DATE('17.05.2015', 'DD.MM.YYYY'), TO_DATE('11.05.2015', 'DD.MM.YYYY'), 'Zum Wallach', 2);

/* Buchungen für SQL Tests aus Aufgabe1 */
INSERT INTO BUCHUNG (Datum, Bewertung, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('01.11.2012', 'DD.MM.YYYY'), 1, TO_DATE('02.11.2012', 'DD.MM.YYYY'), 
TO_DATE('20.11.2012', 'DD.MM.YYYY'), 'El Barto', 2);

INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('15.10.2012', 'DD.MM.YYYY'),  TO_DATE('05.11.2012', 'DD.MM.YYYY'), 
TO_DATE('15.11.2012', 'DD.MM.YYYY'), 'El Torro', 1);

INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('14.10.2012', 'DD.MM.YYYY'),  TO_DATE('30.10.2012', 'DD.MM.YYYY'), 
TO_DATE('21.11.2012', 'DD.MM.YYYY'), 'El Torro', 2);

INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('14.10.2012', 'DD.MM.YYYY'),  TO_DATE('30.10.2012', 'DD.MM.YYYY'), 
TO_DATE('21.11.2012', 'DD.MM.YYYY'), 'El Torro', 2);

INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('09.09.2012', 'DD.MM.YYYY'),  TO_DATE('01.11.2012', 'DD.MM.YYYY'), 
TO_DATE('21.11.2012', 'DD.MM.YYYY'), 'Villa Venezia', 3);

INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('09.08.2012', 'DD.MM.YYYY'),  TO_DATE('01.10.2012', 'DD.MM.YYYY'), 
TO_DATE('31.10.2012', 'DD.MM.YYYY'), 'El Alonso', 1);

INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('09.08.2014', 'DD.MM.YYYY'),  TO_DATE('01.10.2015', 'DD.MM.YYYY'), 
TO_DATE('31.10.2015', 'DD.MM.YYYY'), 'El Alonso', 3);

INSERT INTO BUCHUNG (Datum, Zeitraum_von, Zeitraum_bis, Wohnung_Name,KDNR) 
VALUES (TO_DATE('11.11.2014', 'DD.MM.YYYY'), TO_DATE('01.03.2015', 'DD.MM.YYYY'), 
TO_DATE('10.03.2015', 'DD.MM.YYYY'), 'Zum Wallach', 1);


COMMIT;


--Touriattraktion erstellen
INSERT INTO TOURIATTRAKTION (TA_Name, Beschreibung) VALUES ('Therme Erding', 'Das beliebteste Erlebnisbad mit 20 Rutschen und der weltgrößten Sauna und exotischem Thermenparadies. Nur wenige km von München.');
INSERT INTO TOURIATTRAKTION (TA_Name, Beschreibung) VALUES ('CERN', 'CERN, die Europäische Organisation für Kernforschung, ist eines der größten und renommiertesten Zentren für physikalische Grundlagenforschung der Welt.');
INSERT INTO TOURIATTRAKTION (TA_Name, Beschreibung) VALUES ('Eis tauchen', 'Wegen Schwedens bekanntlich wunderschöner FLora und Fauna ist es ein Hauptreiseziel vieler Eistaucher und naturbegeisterter Wanderer');

--Attraktionsinfo erstellen
INSERT INTO ATTRAKTIONINFO (Entfernung, Wohnung_Name, TA_Name) VALUES (25, 'Zum Wallach', 'Therme Erding');
INSERT INTO ATTRAKTIONINFO (Entfernung, Wohnung_Name, TA_Name) VALUES (50.80, 'Golden Palace', 'CERN');
INSERT INTO ATTRAKTIONINFO (Entfernung, Wohnung_Name, TA_Name) VALUES (90.80, 'Garden Eden', 'Eis tauchen');
COMMIT;

--Bild erstellen
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Küche', 2.5, 'JPG', 'Golden Palace');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Schlafzimmer', 2.5, 'JPG', 'Golden Palace');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Bad', 2.5, 'JPG', 'Golden Palace');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Suite', 2.5, 'JPG', 'Garden Eden');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Wohlfühloase', 2.5, 'JPG', 'Garden Eden');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Whirlpool', 2.5, 'JPG', 'Garden Eden');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Balkon', 2.5, 'JPG', 'Zum Wallach');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Kinderschlafzimmer', 2.5, 'JPG', 'Zum Wallach');
INSERT INTO BILD (Bezeichnung, Groesse, Datentyp, Wohnung_Name) VALUES ('Garten', 2.5, 'JPG', 'Zum Wallach');
COMMIT;

