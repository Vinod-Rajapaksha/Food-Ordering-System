package com.dao;
import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=FoodOrderingDB;encrypt=true;trustServerCertificate=true";
    private static final String USER = "localhost";
    private static final String PASS = "root";

    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
