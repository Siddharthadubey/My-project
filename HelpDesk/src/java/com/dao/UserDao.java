/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author durgesh
 */
public class UserDao {

    Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean insertUser(User user) {
        boolean f = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into users(username,about,email,password) values(?,?,?,?)");
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getAbout());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPassword());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            PreparedStatement pstmt = con.prepareStatement("select * from users where email=? and password=?");
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                user.setUid(set.getInt("uid"));
                user.setName(set.getString("username"));
                user.setAbout(set.getString("about"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setProfilePic(set.getString("profilepic"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUserDetails(User user) {
        boolean f = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("update users set username=?,email=?,password=?,about=?,profilepic=? where uid=?");
            System.err.println(user.getEmail());
            System.err.println(user.getAbout());
            pstmt.setString(1, user.getName());
            pstmt.setString(4, user.getAbout());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(5, user.getProfilePic());
            pstmt.setInt(6, user.getUid());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User getUserById(int id) {
        User user = null;
        try {

            PreparedStatement pstmt = con.prepareStatement("select * from users where uid=?");
            pstmt.setInt(1, id);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
             
                user = new User();
                user.setUid(set.getInt("uid"));
                user.setName(set.getString("username"));
                user.setAbout(set.getString("about"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setProfilePic(set.getString("profilepic"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
