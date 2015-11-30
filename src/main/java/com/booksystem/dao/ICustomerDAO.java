package com.booksystem.dao;

import com.booksystem.entity.Customer;

import javax.ejb.Local;

/**
 * Created by longnguyen on 30/11/2015.
 */
@Local
public interface ICustomerDAO extends IDAO<Customer, Integer>{

    public Customer login(String username, String password);
}
