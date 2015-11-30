package com.booksystem.service;

import com.booksystem.dao.IAdminDAO;
import com.booksystem.dao.IOrderDAO;
import com.booksystem.entity.Order;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 30/11/2015.
 */
public class OrderService {
    @EJB
    private IOrderDAO orderDAO;

    public OrderService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(IOrderDAO.class.getName(), "OrderEJB");
            orderDAO = (IOrderDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Order addOrder(Order o) throws Exception {
        return orderDAO.save(o);
    }

    public Order updateOrder(Order o) throws Exception{
        return orderDAO.update(o);
    }

    public void deleteById(int id) throws Exception {
        orderDAO.deleteById(id);
    }

    public Order getOrderById(int id) throws Exception {
        return orderDAO.findOne(id);
    }

    public List<Order> getAllOrder(){
        return (List<Order>)orderDAO.findAll();
    }
}
