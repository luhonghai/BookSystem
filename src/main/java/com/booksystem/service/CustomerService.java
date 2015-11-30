package com.booksystem.service;

import com.booksystem.dao.IAdminDAO;
import com.booksystem.dao.ICustomerDAO;
import com.booksystem.entity.Customer;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Created by longnguyen on 30/11/2015.
 */
public class CustomerService {
    @EJB
    private ICustomerDAO customerDAO;

    public CustomerService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(ICustomerDAO.class.getName(), "CustomerEJB");
            customerDAO = (ICustomerDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Customer authenticate(String username, String password){
        return customerDAO.login(username, password);
    }

    public Customer doRegister(Customer c) throws Exception {
        return customerDAO.save(c);
    }
}
