/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author durgesh
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean doLike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into likes(pid,uid) values(?,?)");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean checkLiked(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from likes where pid=? and uid=?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

}
