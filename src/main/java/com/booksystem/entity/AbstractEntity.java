package com.booksystem.entity;

import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;

/**
 * Created by longnguyen on 2/3/15.
 */
@MappedSuperclass
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class AbstractEntity implements Serializable{

    public static final String FIND_ALL = "Entity.findAll";

    private static final long serialVersionUID = 1L;
}
