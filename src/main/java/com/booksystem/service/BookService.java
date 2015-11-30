package com.booksystem.service;

import com.booksystem.dao.IBookDAO;
import com.booksystem.entity.Book;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 29/11/2015.
 */
public class BookService {
    @EJB
    private IBookDAO bookDAO;

    public BookService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(IBookDAO.class.getName(), "BookEJB");
            bookDAO = (IBookDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Book addBook(Book b){
        try {
            bookDAO.save(b);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public Book updateBook(Book b){
        try {
            bookDAO.update(b);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public void deleteBookById(int id){
        try {
            bookDAO.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Book getBookById(int id){
        return bookDAO.findOne(id);
    }

    public List<Book> getAllBooks(){
        return (List<Book>)bookDAO.findAll();
    }
}
