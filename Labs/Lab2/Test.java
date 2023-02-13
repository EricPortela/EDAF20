package Labs.Lab2;

import java.sql.*;

public class Test {


    public static void establishConnection() {
        try {
            Connection conn = DriverManager.getConnection("puccini.cs.lth.se", "hbg09", "olx278gx"); 

            System.out.println("Successfully established connection!");

        } catch (Exception ex) {
            System.out.println("Something went wrong!");
            ex.getStackTrace();
        }
    }


    public static String randomRequest() {

        /* NOTE! DO a Try-With-Resources request!
         * The replacement (Which is not recommended) is skipping th eparam after Try-statement + the Finally-block!
         */
        
        try () {

        } catch(){

        }

        return "";
    }

    
}
