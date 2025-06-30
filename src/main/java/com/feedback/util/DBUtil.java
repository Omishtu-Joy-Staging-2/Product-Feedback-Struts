package com.feedback.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
  // Change the database name, user, and password according to your settings.
  private static final String URL = "jdbc:mysql://localhost:3306/feedback_db";
  private static final String USER = "root";
  private static final String PASS = ""; // XAMPP's default is usually an empty password

  public static Connection getConnection() throws SQLException {
    try {
      // Load the MySQL JDBC Driver
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    return DriverManager.getConnection(URL, USER, PASS);
  }
}
