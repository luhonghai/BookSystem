package com.booksystem.dao;

import com.booksystem.constant.Common;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;

/**
 * Created by longnguyen on 29/11/2015.
 */
public abstract class AbstractDAO<T, V> implements IDAO<T,V> {
    @PersistenceContext(name = Common.PERSISTENCE_UNIT)
    private EntityManager em;

    private Class<T> targetClass;

    protected AbstractDAO(Class<T> targetClass) {
        if (targetClass == null) {
            throw new IllegalArgumentException("<Null>");
        }

        this.targetClass = targetClass;
    }

    protected synchronized EntityManager getEm(){
        return this.em;
    }

    @Override
    public Collection<T> findAll() {
        return getEm().createQuery("select e from " + targetClass.getSimpleName() + " e").getResultList();
    }

    @Override
    public T findOne(V keyValue) {
        return getEm().find(targetClass, keyValue);
    }

    @Override
    public T save(T object) throws Exception {
        getEm().persist(object);
        getEm().flush();
        return object;
    }

    @Override
    public T update(T object) throws Exception{
        getEm().merge(object);
        return object;
    }

    @Override
    public void delete(T object) throws Exception {
        getEm().remove(object);
    }

    @Override
    public void deleteById(V objectId) throws Exception {
        T object = getEm().find(targetClass, objectId);
        getEm().remove(object);
    }
}
