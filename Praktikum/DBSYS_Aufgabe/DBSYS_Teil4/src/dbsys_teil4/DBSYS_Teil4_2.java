package dbsys_teil4;

import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Adrian Wenger
 */
public class DBSYS_Teil4_2 {


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
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Bitte Reiseland eingeben:");
        String land = scanner.next().trim();

        System.out.println("Bitte Anreisetermin eingeben:");
        String anreiseDate = scanner.next().trim();

        System.out.println("Bitte Abreisetermin eingeben:");
        String abreiseDate = scanner.next().trim();

        System.out.println("Bitte Mindestanzahl Zimmer eingeben:");
        int anzZimmer = scanner.nextInt();

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
                + "'" + land + "'" + " AND BESITZT.Bezeichnung LIKE " +  ausstattung  + " AND ferienwohnung.Anzzimmer >= " + anzZimmer + ";";

        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBSYS_Teil4_2.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c";

        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DriverManager.getConnection(url, "dbsys60", "dbsys60");
            System.out.println("Verbindung aufgebaut");
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT TABLE_NAME FROM USER_TABLES");
            while (rs.next()) {
                String r1 = rs.getString("Wohnung_name");
                System.out.println("WohnungsName = " + r1);
            }
            conn.close();
            System.out.println("Verbindung erfolgreich geschlossen.");
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
    }

}
