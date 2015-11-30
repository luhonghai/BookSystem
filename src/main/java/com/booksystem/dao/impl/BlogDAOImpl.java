package com.booksystem.dao.impl;

import com.booksystem.dao.AbstractDAO;
import com.booksystem.dao.IBlogDAO;
import com.booksystem.entity.Blog;

import javax.ejb.Stateless;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Stateless(name = "BlogEJB")
public class BlogDAOImpl extends AbstractDAO<Blog, Integer> implements IBlogDAO {

    public BlogDAOImpl() {
        super(Blog.class);
    }
}
