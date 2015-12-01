package com.booksystem.service;

import com.booksystem.dao.IBlogDAO;
import com.booksystem.entity.Blog;
import com.booksystem.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.ws.rs.Path;
import java.util.List;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Path("blog")
public class BlogService extends BaseService<IBlogDAO, Blog> {

    public BlogService() {
        super(IBlogDAO.class, Blog.class, "BlogEJB");
    }
}
