package com.booksystem.service;

import com.booksystem.dao.IBookDAO;
import com.booksystem.entity.Book;

import javax.ws.rs.Path;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Path("book")
public class BookService extends BaseService<IBookDAO, Book> {

    public BookService() {
        super(IBookDAO.class, Book.class, "BookEJB");
    }
}