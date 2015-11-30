package com.booksystem.service;

import com.booksystem.dao.IAdminDAO;
import com.booksystem.dao.IBlogDAO;
import com.booksystem.entity.Admin;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Created by longnguyen on 30/11/2015.
 */
public class AdminService {
    @EJB
    private IAdminDAO adminDAO;

    public AdminService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(IAdminDAO.class.getName(), "AdminEJB");
            adminDAO = (IAdminDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Admin authenticate(String username, String password){
        return adminDAO.login(username, password);
    }
}
