package com.booksystem.dao.impl;

import com.booksystem.dao.AbstractDAO;
import com.booksystem.dao.IOrderDetailDAO;
import com.booksystem.entity.OrderDetail;

import javax.ejb.Stateless;

/**
 * Created by longnguyen on 30/11/2015.
 */
@Stateless(name="OrderDetailEJB")
public class OrderDetailDAOImpl extends AbstractDAO<OrderDetail, Integer> implements IOrderDetailDAO{

    public OrderDetailDAOImpl() {
        super(OrderDetail.class);
    }

}
