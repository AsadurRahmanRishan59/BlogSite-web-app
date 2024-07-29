package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
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
import java.nio.file.Paths;

/**
 *
 * @author rishan
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//          fetch user's new data
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String status = request.getParameter("user_status");

            //secure way
            Part part = request.getPart("profile_pic");
            String picName = part.getSubmittedFileName();
            String sanitizedPicName = picName.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");

//          get the user from the session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setAbout(status);
            String oldFile = user.getProfile();
            user.setProfile(sanitizedPicName);

//          update database
            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            boolean success = dao.updateUser(user);

            if (success) {
                out.println("Updated");

                String profilePicDir = Paths.get(request.getServletContext().getRealPath("/"), "profilePics").toString();
                String sanitizedProfilePicName = user.getProfile().replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
                String fullPath = Paths.get(profilePicDir, sanitizedProfilePicName).toString();

                String oldFilePath = request.getSession().getServletContext().getRealPath("/") + "profilePics" + File.separator + oldFile;
                if(!oldFile.equals("default.png")){
                    Helper.deleteFile(oldFilePath);
                }
                

                if (Helper.saveFile(part.getInputStream(), fullPath)) {

                    Message msg = new Message("Profile details Updated..", "success", "alert-success");
                    session.setAttribute("msg", msg);

                } else {

                    Message msg = new Message("Something went wrong! Try again", "error", "alert-danger");
                    session.setAttribute("msg", msg);

                }

            } else {

                Message msg = new Message("Something went wrong! Try again", "error", "alert-danger");
                session.setAttribute("msg", msg);

            }

            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
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
