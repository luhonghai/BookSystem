package com.booksystem.service;

import com.booksystem.dao.IBlogDAO;
import com.booksystem.entity.Blog;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longnguyen on 29/11/2015.
 */
public class BlogService {
    @EJB
    private IBlogDAO blogDAO;

    public BlogService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(IBlogDAO.class.getName(), "BlogEJB");
            blogDAO = (IBlogDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Blog addBlog(Blog b){
        try {
            blogDAO.save(b);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public Blog update(Blog b){
        try {
            blogDAO.update(b);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public void deleteBlogById(int id){
        try {
            blogDAO.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Blog getBlogById(int id){
        return blogDAO.findOne(id);
    }

    public List<Blog> getAllBlogs(){
        return (List<Blog>)blogDAO.findAll();
    }
}
