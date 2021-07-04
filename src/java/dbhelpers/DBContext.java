/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbhelpers;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author huynp
 */
public class DBContext {

    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=Assignment;";
            return DriverManager.getConnection(connectionUrl, "sa", "123456");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
