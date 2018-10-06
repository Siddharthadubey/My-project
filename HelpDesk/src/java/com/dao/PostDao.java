/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author durgesh
 */
public class PostDao {
    
    Connection con;
    
    public PostDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertQuestion(Question q, int uid) {
        boolean f = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into questions(qcontent,qheading,code,code_lang,uid) values(?,?,?,?,?)");
            pstmt.setString(1, q.getContent());
            pstmt.setString(2, q.getHeading());
            pstmt.setString(3, q.getCode());
            pstmt.setString(4, q.getCodeLanguage());
            pstmt.setInt(5, uid);
            pstmt.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Question> getAllQuestion() {
        List<Question> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from questions order by qid desc");
            ResultSet set = pstmt.executeQuery();
            
            while (set.next()) {
                Question q = new Question();
                q.setQid(set.getInt("qid"));
                q.setHeading(set.getString("qheading"));
                q.setContent(set.getString("qcontent"));
                q.setDatetime(set.getTimestamp("qdate"));
                q.setCode(set.getString("code"));
                q.setCodeLanguage(set.getString("code_lang"));
                q.setUid(set.getInt("uid"));
                
                list.add(q);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    
    public List<Question> getAllQuestionByUserId(int id) {
        List<Question> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from questions where uid=? order by qid desc");
            pstmt.setInt(1, id);
            ResultSet set = pstmt.executeQuery();
            
            while (set.next()) {
                Question q = new Question();
                q.setQid(set.getInt("qid"));
                q.setHeading(set.getString("qheading"));
                q.setContent(set.getString("qcontent"));
                q.setDatetime(set.getTimestamp("qdate"));
                q.setCode(set.getString("code"));
                q.setCodeLanguage(set.getString("code_lang"));
                q.setUid(set.getInt("uid"));
                
                list.add(q);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
}
