package com.booksystem.dao.impl;

import com.booksystem.dao.AbstractDAO;
import com.booksystem.dao.ICustomerDAO;
import com.booksystem.entity.Customer;

import javax.ejb.Stateless;

/**
 * Created by longnguyen on 30/11/2015.
 */
@Stateless(name="CustomerEJB")
public class CustomerDAOImpl extends AbstractDAO<Customer, Integer> implements ICustomerDAO {

    public CustomerDAOImpl() {
        super(Customer.class);
    }

    @Override
    public Customer login(String username, String password) {
        return null;
    }
}
