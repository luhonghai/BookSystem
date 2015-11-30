package com.booksystem.dao.impl;

import com.booksystem.dao.AbstractDAO;
import com.booksystem.dao.IOrderDAO;
import com.booksystem.entity.Order;

import javax.ejb.Stateless;

/**
 * Created by longnguyen on 30/11/2015.
 */
@Stateless(name="OrderEJB")
public class OrderDAOImpl extends AbstractDAO<Order, Integer> implements IOrderDAO{

    public OrderDAOImpl() {
        super(Order.class);
    }


}
