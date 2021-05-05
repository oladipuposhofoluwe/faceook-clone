package com.example.Face_Book_Clone;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
    private static Connection connection;

    public static  Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
          connection = DriverManager.getConnection(
            "jdbc:mysql://localhost/facebook_database?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","Arsenal4life");
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return  connection;
    }

}
