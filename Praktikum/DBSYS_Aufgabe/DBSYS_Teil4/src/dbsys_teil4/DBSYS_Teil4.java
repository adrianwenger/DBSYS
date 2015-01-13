package dbsys_teil4;

import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Adrian Wenger
 */
public class DBSYS_Teil4 {
/**
 * Ein Land, eine Mindestanzahl an Zimmern, ein Anreise- und ein Abreisetermin 
 * sollen von der Tastatur eingelesen werden. Optional soll der Kunde auch eine 
 * Ausstattung angeben können, die die gesuchte Ferienwohnung haben soll. 
 * Anschliessend sollen alle Ferienwohnungen ausgegeben werden, die die 
 * angegebenen Eigenschaften erfüllen.
 */

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Bitte Reiseland eingeben:");
        String land = scanner.next();
        
        System.out.println("Bitte Anreisetermin eingeben:");
        String anreiseDatum = scanner.next();
        
        System.out.println("Bitte Abreisetermin eingeben:");
        String abreiseDatum = scanner.next();
        
        System.out.println("Bitte Mindestanzahl Zimmer eingeben:");
        double anzZimmer = scanner.nextDouble();
        
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBSYS_Teil4.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c";

        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DriverManager.getConnection(url, "dbsys60", "dbsys60");
            System.out.println("Verbindung aufgebaut");
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                    "SELECT * FROM dbsys33.Buchung");
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
