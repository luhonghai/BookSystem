package com.booksystem.service;

import com.booksystem.dao.IOrderDAO;
import com.booksystem.dao.IOrderDetailDAO;
import com.booksystem.entity.OrderDetail;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 30/11/2015.
 */
public class OrderDetailService {
    @EJB
    private IOrderDetailDAO orderDetailDAO;

    public OrderDetailService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(IOrderDetailDAO.class.getName(), "OrderDetailEJB");
            orderDetailDAO = (IOrderDetailDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public OrderDetail addOrderDetail(OrderDetail od) throws Exception {
        return orderDetailDAO.save(od);
    }

    public OrderDetail updateOrderDetail(OrderDetail od) throws Exception {
        return orderDetailDAO.update(od);
    }

    public void deleteById(int id) throws Exception {
        orderDetailDAO.deleteById(id);
    }

    public OrderDetail getOrderDetailById(int id){
        return orderDetailDAO.findOne(id);
    }

    public List<OrderDetail> getAllOrderDetail(){
        return (List<OrderDetail>)orderDetailDAO.findAll();
    }
}
