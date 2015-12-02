package com.booksystem.dao;

import java.util.Collection;

/**
 * Created by longnguyen on 29/11/2015.
 */
public interface IDAO<T,V> {

    Collection<T> findAll();

    T findOne(V keyValue);

    T save(T object) throws Exception;

    T update(T object) throws Exception;

    void delete(T object) throws Exception;

    void deleteById(V objectId) throws Exception;

    Collection<T> search(int start, int length, int column, String order, String search);

    double searchCount(int start, int length, int column, String order, String search);
}
