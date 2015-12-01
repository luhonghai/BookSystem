package com.booksystem.service;

import com.booksystem.dao.IOrderDetailDAO;
import com.booksystem.entity.Order;
import com.booksystem.entity.OrderDetail;

/**
 * Created by longnguyen on 30/11/2015.
 */
public class OrderDetailService extends BaseService<IOrderDetailDAO, OrderDetail> {

    public OrderDetailService() {
        super(IOrderDetailDAO.class, OrderDetail.class, "OrderDetailEJB");
    }
}
