package com.booksystem.dao;

import com.booksystem.constant.Common;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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

    @Override
    public Collection<T> search(int start, int length, int column, String order, String search) {
        return getEm().createQuery("select e from " + targetClass.getSimpleName() + " e")
                .setMaxResults(length)
                .setFirstResult(start)
                .getResultList();
    }

    @Override
    public double searchCount(int start, int length, int column, String order, String search) {
        final CriteriaBuilder builder = getEm().getCriteriaBuilder();
        final CriteriaQuery<Long> countQuery = builder.createQuery(Long.class);
        countQuery.select(builder.count(countQuery.from(targetClass)));
        return getEm().createQuery(countQuery)
                .getSingleResult();
    }
}
