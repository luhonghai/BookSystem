package com.booksystem.service;

import com.booksystem.dao.IOrderDAO;
import com.booksystem.entity.Order;

import javax.ws.rs.Path;

/**
 * Created by longnguyen on 30/11/2015.
 */
@Path("order")
public class OrderService extends BaseService<IOrderDAO, Order> {

    public OrderService() {
        super(IOrderDAO.class, Order.class, "OrderEJB");
    }
}
