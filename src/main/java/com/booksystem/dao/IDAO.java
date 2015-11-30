package com.booksystem.dao;

import java.util.Collection;

/**
 * Created by longnguyen on 29/11/2015.
 */
public interface IDAO<T,V> {

    public Collection<T> findAll();

    public T findOne(V keyValue);

    public T save(T object) throws Exception;

    public T update(T object) throws Exception;

    public void delete(T object) throws Exception;

    public void deleteById(V objectId) throws Exception;

}
