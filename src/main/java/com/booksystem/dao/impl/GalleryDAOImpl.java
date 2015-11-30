package com.booksystem.dao.impl;

import com.booksystem.dao.AbstractDAO;
import com.booksystem.dao.IGalleryDAO;
import com.booksystem.entity.Gallery;

import javax.ejb.Stateless;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Stateless(name = "GalleryEJB")
public class GalleryDAOImpl extends AbstractDAO<Gallery, Integer> implements IGalleryDAO{

    public GalleryDAOImpl() {
        super(Gallery.class);
    }

}
