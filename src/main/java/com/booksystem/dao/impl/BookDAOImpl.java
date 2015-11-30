package com.booksystem.dao.impl;

import com.booksystem.dao.AbstractDAO;
import com.booksystem.dao.IBookDAO;
import com.booksystem.entity.Book;

import javax.ejb.Stateless;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Stateless(name = "BookEJB")
public class BookDAOImpl extends AbstractDAO<Book, Integer> implements IBookDAO {
    public BookDAOImpl() {
        super(Book.class);
    }
}
