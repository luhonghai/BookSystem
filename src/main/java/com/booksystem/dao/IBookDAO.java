package com.booksystem.dao;

import com.booksystem.entity.Book;

import javax.ejb.Local;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Local
public interface IBookDAO extends IDAO<Book,Integer> {


}
