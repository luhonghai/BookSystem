package com.booksystem.dao;

import com.booksystem.entity.Blog;

import javax.ejb.Local;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Local
public interface IBlogDAO extends IDAO<Blog, Integer> {

}
