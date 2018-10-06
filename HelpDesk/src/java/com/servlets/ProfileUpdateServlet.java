/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dao.ConnectionProvider;
import com.dao.UserDao;
import com.entities.User;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author durgesh
 */
@MultipartConfig
public class ProfileUpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String about = request.getParameter("about");
            Part part = request.getPart("pic");
            
            String picname = part.getSubmittedFileName();
            if(part!=null){
            System.out.println("file name = " + picname);
            String ext = picname.substring(picname.indexOf(".") + 1);
            System.err.println(ext);
            boolean f = false;
            if (ext.equals("jpg") || ext.equals("jpeg") || ext.equals("png")) {
                f = true;
            }
            ///getting path
            String path = this.getServletContext().getRealPath("/") + "img" + File.separator + picname;
            System.err.println(path);
            File fout = new File(path);
            FileOutputStream fos = new FileOutputStream(fout);

            InputStream is = part.getInputStream();

            byte[] b = new byte[is.available()];

            is.read(b);

            fos.write(b);
//            out.print("<h1>Uploaded</h1>");

            User user = new User();

            user.setName(name);
           
            user.setAbout(about);
            user.setPassword(password);
            user.setProfilePic(picname);

            HttpSession s = request.getSession();
            User u = (User) s.getAttribute("current-user");
             user.setEmail(u.getEmail());
            user.setUid(u.getUid());

            UserDao dao = new UserDao(ConnectionProvider.createConnection());

            Map<String, String> msg = new HashMap();
            if (dao.updateUserDetails(user)) {
                msg.put("message", "Successfully Saved");
                msg.put("type", "success");
                s.setAttribute("msg", msg);
                
                
                s.setAttribute("current-user", user);
                response.sendRedirect("home.jsp");

            } else {
                msg.put("message", "Not Update...Error !!");
                msg.put("type", "error");
                s.setAttribute("msg", msg);
                response.sendRedirect("home.jsp");
            }
            }else
            {
                //update without pic
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
