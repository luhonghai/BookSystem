package com.booksystem.service;

import com.booksystem.dao.ICustomerDAO;
import com.booksystem.entity.Customer;

import javax.ws.rs.Path;

/**
 * Created by longnguyen on 30/11/2015.
 */
@Path("customer")
public class CustomerService extends BaseService<ICustomerDAO, Customer> {

    public CustomerService() {
        super(ICustomerDAO.class, Customer.class, "CustomerEJB");
    }
}
