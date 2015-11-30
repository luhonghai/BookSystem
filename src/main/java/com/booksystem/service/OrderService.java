package com.booksystem.service;

import com.booksystem.dao.IAdminDAO;
import com.booksystem.dao.IOrderDAO;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

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
}
