package com.booksystem.dao;

import com.booksystem.entity.Admin;

import javax.ejb.Local;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Local
public interface IAdminDAO extends IDAO<Admin, Integer> {

    public Admin login(String username, String password);

}
