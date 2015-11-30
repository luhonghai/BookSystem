package com.booksystem.controller;

import com.booksystem.entity.Admin;
import com.booksystem.entity.Customer;
import com.booksystem.service.AdminService;
import com.booksystem.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by longnguyen on 30/11/2015.
 */
@WebServlet(name = "AdminServlet", asyncSupported = true, urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
        AdminService adminService = new AdminService();
        try {
            out = response.getWriter();

            String username = request.getParameter("_request_username");
            String password = request.getParameter("_request_password");
            Admin admin = adminService.authenticate(username, password);

            if(admin != null){
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);

                response.sendRedirect("index.jsp");
            }else{
                out.print("invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
