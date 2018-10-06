/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author durgesh
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection createConnection() {
        try {
            if(con==null){
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sir_project", "root", "root");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
    
    public static void main(String[] args) {
        System.out.println(ConnectionProvider.createConnection());
    }
}
