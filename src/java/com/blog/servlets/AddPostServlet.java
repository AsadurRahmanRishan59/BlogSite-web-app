package com.blog.servlets;

import com.blog.dao.PostDao;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author rishan
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            Part part = request.getPart("pic");
            String pic = part.getSubmittedFileName();
            String sanitizedPicName = pic.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
            //get current user
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            int userId = user.getId();

            Post post = new Post(pTitle, pContent, sanitizedPicName, null, cid, userId);
            PostDao postDao = new PostDao(ConnectionProvider.getConnection());

            //save on database
            if (postDao.savePost(post)) {
                
                String FilePath = request.getSession().getServletContext().getRealPath("/") + "blogPics" + File.separator + sanitizedPicName;
                
                Helper.saveFile(part.getInputStream(), FilePath);
                out.println("done");
                
            }else{
                out.println("error");
            }
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
