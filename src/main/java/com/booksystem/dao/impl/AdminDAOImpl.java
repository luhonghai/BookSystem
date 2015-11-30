package com.booksystem.dao.impl;

import com.booksystem.dao.AbstractDAO;
import com.booksystem.dao.IAdminDAO;
import com.booksystem.entity.Admin;

import javax.ejb.Stateless;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Stateless(name="AdminEJB")
public class AdminDAOImpl extends AbstractDAO<Admin, Integer> implements IAdminDAO{

    protected AdminDAOImpl() {
        super(Admin.class);
    }

    @Override
    public Admin login(String username, String password) {
        Admin admin;
        try {
            admin = (Admin)(getEm().createNamedQuery("Admin.Login").setParameter("username", username).setParameter("password", password).getSingleResult());
        }catch (Exception e){
            admin = null;
        }
        return admin;
    }
}
