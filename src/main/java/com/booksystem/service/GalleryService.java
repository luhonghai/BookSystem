package com.booksystem.service;

import com.booksystem.dao.IGalleryDAO;
import com.booksystem.entity.Gallery;

import javax.ws.rs.Path;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Path("gallery")
public class GalleryService extends BaseService<IGalleryDAO, Gallery> {

    public GalleryService() {
        super(IGalleryDAO.class, Gallery.class, "GalleryEJB");
    }
}
