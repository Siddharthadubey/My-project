package com.dao;

import java.util.Date;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author durgesh
 */
public class MyCustomTag extends TagSupport {

    public int doStartTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.println(new Date());
            out.println("<h1>Hello </h1>");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SKIP_BODY;

    }

}
