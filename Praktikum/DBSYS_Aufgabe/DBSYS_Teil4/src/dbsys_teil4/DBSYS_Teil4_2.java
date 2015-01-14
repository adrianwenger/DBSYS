package dbsys_teil4;

import java.sql.*;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Adrian Wenger
 */
public class DBSYS_Teil4_2 {


    public static String land;

    public static String anreiseDate;

    public static String abreiseDate;

    public static int anzZimmer;
    
    public static Scanner scanner = new Scanner(System.in);
        

    /**
     * Eine Ferienwohnung soll für einen Kunden über einen bestimmten Zeitraum
     * gebucht werden. Dazu muss ein eindeutiger Bezeichner für die
     * Ferienwohnung und den Kunden, sowie ein Zeitraum eingegeben werden. Die
     * Buchungsnummer soll das System automatisch vergeben.
     */
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        System.out.println("Bitte KundenNummer eingeben:");
        String kdNr = scanner.next().trim();
        
        // miegliche Wohnungen ermitteln
        LinkedList<String> moeglWohnungen =  ferienwohnungErmitteln();
        // moegliche Wohnugnen ausgeben
        System.out.println("Die möglichen Wohnungen sind: ");
        for (int i = 0; i < moeglWohnungen.size(); i++) {
            System.out.println((i + 1) + " " + moeglWohnungen.get(i));
        }

        System.out.println("Bitte die gwünschte Wohnung eingeben: ");
        int wohnungNr = scanner.nextInt() - 1;
        String wohnung = moeglWohnungen.get(wohnungNr);

        String queryPart2 = "INSERT INTO dbsys33.BUCHUNG (Datum,  Zeitraum_von, Zeitraum_bis,  Wohnung_Name,KDNR) \n"
                + "VALUES (TO_DATE('15.01.2015', 'DD.MM.YYYY'), TO_DATE('" +  anreiseDate + "', 'DD.MM.YYYY'), \n"
                + "TO_DATE('"+ abreiseDate +"', 'DD.MM.YYYY'),  '" + wohnung +"'," + kdNr +")";

        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBSYS_Teil4_2.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c";

        Connection conn = null;
        Statement stmt = null;
        Statement stmt2 = null;
        try {
            conn = DriverManager.getConnection(url, "dbsys60", "dbsys60");
            System.out.println("Verbindung aufgebaut");
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(queryPart2);
            System.out.println("Wohnug wurde gebucht");
            if (!conn.getAutoCommit()) {
                conn.commit();
            }
            conn.close();
            System.out.println("Verbindung erfolgreich geschlossen.");
        } catch (SQLException ex) {
            System.err.println("Es ist ein Fehler aufgetreten:\n" + ex.getMessage());
            // Wenn ein Fehler auftritt, Fehler ausgeben und versuchen // die Datenbank-Verbindung zu schließen.
            try {
                if (conn != null) {
                    conn.rollback();
                    conn.close();
                    System.err.println("Verbindung erfolgreich geschlossen.");
                }
            } catch (SQLException sqlException) {
                System.err.println("Verbindung konnte nicht erfolgreich geschlossen werden.");
            }
        }
    }

    /**
     * Ein Land, eine Mindestanzahl an Zimmern, ein Anreise- und ein
     * Abreisetermin sollen von der Tastatur eingelesen werden. Optional soll
     * der Kunde auch eine Ausstattung angeben können, die die gesuchte
     * Ferienwohnung haben soll. Anschliessend sollen alle Ferienwohnungen
     * ausgegeben werden, die die angegebenen Eigenschaften erfüllen.
     */
    /**
     * @param args the command line arguments
     */
    public static LinkedList ferienwohnungErmitteln() {

        System.out.println("Bitte Reiseland eingeben:");
        land = scanner.next().trim();

        System.out.println("Bitte Anreisetermin eingeben:");
        anreiseDate = scanner.next().trim();

        System.out.println("Bitte Abreisetermin eingeben:");
        abreiseDate = scanner.next().trim();

        System.out.println("Bitte Mindestanzahl Zimmer eingeben:");
        anzZimmer = scanner.nextInt();

        System.out.println("Möchten Sie einen expliziten Ausstattungswunsch angeben y/n?");
        boolean aus = scanner.next().equals("n");
        String ausstattung = "'%'";

        if (!aus) {
            System.out.println("Austtatungswunsch angeben:");
            ausstattung = scanner.next().trim();
            ausstattung = "'" + ausstattung + "'";
        }
        String queryPart1 = "SELECT * From dbsys33.FERIENWOHNUNG ferienwohnung INNER JOIN dbsys33.Besitzt besitzt"
                + " ON (Ferienwohnung.WOHNUNG_NAME = besitzt.Wohnung_name) "
                + "LEFT OUTER JOIN (SELECT Wohnung_name from dbsys33.BUCHUNG WHERE Zeitraum_von <= "
                + "'" + anreiseDate + "'" + " AND Zeitraum_bis >= " + "'" + abreiseDate + "'"
                + ") buchung ON (Buchung.Wohnung_Name = Ferienwohnung.Wohnung_name)"
                + " WHERE buchung.Wohnung_name is null AND FERIENWOHNUNG.LAND_NAME = "
                + "'" + land + "'" + " AND BESITZT.Bezeichnung LIKE " + ausstattung + " AND ferienwohnung.Anzzimmer >= " + anzZimmer;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBSYS_Teil4_2.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c";

        Connection conn = null;
        Statement stmt = null;
        LinkedList<String> r1 = new LinkedList<>();
        try {
            conn = DriverManager.getConnection(url, "dbsys60", "dbsys60");
            System.out.println("Verbindung aufgebaut");
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(queryPart1);
            while (rs.next()) {
                r1.add(rs.getString("Wohnung_name"));
                System.out.println("Die verfügbare Wohnung heißt: " + r1);
            }
            conn.close();
            System.out.println("Verbindung erfolgreich geschlossen.");
            return r1;
        } catch (SQLException ex) {
            System.err.println("Es ist ein Fehler aufgetreten:\n" + ex.getMessage());
            // Wenn ein Fehler auftritt, Fehler ausgeben und versuchen // die Datenbank-Verbindung zu schließen.
            try {
                if (conn != null) {
                    conn.close();
                    System.err.println("Verbindung erfolgreich geschlossen.");
                }
            } catch (SQLException sqlException) {
                System.err.println("Verbindung konnte nicht erfolgreich geschlossen werden.");
            }
        }
        return r1;
    }

}
