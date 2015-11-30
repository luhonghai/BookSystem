package com.booksystem.controller;

import com.booksystem.entity.Customer;
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
@WebServlet(name = "CustomerServlet", asyncSupported = true, urlPatterns = {"/CustomerServlet"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
        CustomerService customerService = new CustomerService();
        try {
            out = response.getWriter();
            String action   = request.getParameter("action");

            if(action.equalsIgnoreCase("login")){

                String username = request.getParameter("_request_username");
                String password = request.getParameter("_request_password");
                Customer customer = customerService.authenticate(username, password);

                if(customer != null){
                    HttpSession session = request.getSession();
                    session.setAttribute("account", customer);

                    response.sendRedirect("index.jsp");
                }else{
                    out.print("invalid");
                }
            }else if(action.equalsIgnoreCase("register")){

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email    = request.getParameter("email");
                String phone    = request.getParameter("phone");
                String address  = request.getParameter("address");

                Customer customer = new Customer();
                customer.setAddress(address);
                customer.setPhone(phone);
                customer.setEmail(email);
                customer.setPassword(password);
                customer.setUsername(username);

                customerService.doRegister(customer);
                out.print("done");
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
