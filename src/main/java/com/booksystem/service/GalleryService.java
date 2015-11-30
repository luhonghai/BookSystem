package com.booksystem.service;

import com.booksystem.dao.IBlogDAO;
import com.booksystem.dao.IGalleryDAO;
import com.booksystem.entity.Gallery;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Created by longnguyen on 29/11/2015.
 */
public class GalleryService {
    @EJB
    private IGalleryDAO galleryDAO;

    public GalleryService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(IGalleryDAO.class.getName(), "GalleryDAO");
            galleryDAO = (IGalleryDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Gallery addGallery(Gallery g){
        try {
            galleryDAO.save(g);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return g;
    }

    public Gallery updateGallery(Gallery g){
        try {
            galleryDAO.update(g);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return g;
    }

    public void deleteGalleryById(int id){
        try {
            galleryDAO.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
