package com.booksystem.service;

import com.booksystem.dao.IAdminDAO;
import com.booksystem.entity.AbstractEntity;
import com.booksystem.entity.Admin;
import com.booksystem.utils.MD5Helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.logging.Level;

/**
 * Created by longnguyen on 30/11/2015.
 */
@Path("admin")
public class AdminService extends BaseService<IAdminDAO, Admin> {

    public AdminService() {
        super(IAdminDAO.class, Admin.class, "AdminEJB");
    }

    public AdminService(HttpServletRequest request, HttpServletResponse response) {
        this();
        setHttpRequest(request);
        setHttpResponse(response);
    }

    @POST
    @Path("/put")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    @Override
    public Response put(@FormParam("data") String data) {
        ResponseData<Admin> responseData = new ResponseData<Admin>();
        try {
            Admin entity = gson.fromJson(data, Admin.class);
            if (entity.getId() > 0) {
                Admin old = dao.findOne(entity.getId());
                if (old != null) {
                    old.setEmail(entity.getEmail());
                    old.setFullname(entity.getFullname());
                    old.setUsername(entity.getUsername());
                    responseData.setData(dao.update(old));
                } else {
                    responseData.setMessage("Invalid admin id " + entity.getId());
                }
            } else {
                entity.setPassword(MD5Helper.md5(entity.getPassword()));
                responseData.setData(dao.save(entity));
                responseData.setStatus(true);
                responseData.setMessage("success");
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not put new entity",e);
            responseData.setMessage("Lỗi hệ thống");
        }
        return createJSONResponse(responseData);
    }

    @POST
    @Path("/change/password")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response changePassword(@FormParam("data") String data) {
        ResponseData<Admin> responseData = new ResponseData<Admin>();
        try {
            Admin entity = gson.fromJson(data, Admin.class);
            if (entity.getId() > 0) {
                Admin old = dao.findOne(entity.getId());
                if (old != null) {
                    old.setPassword(MD5Helper.md5(entity.getPassword()));
                    responseData.setData(dao.update(old));
                } else {
                    responseData.setMessage("Invalid admin id " + entity.getId());
                }
            } else {
                responseData.setMessage("Invalid admin id " + entity.getId());
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not change password",e);
            responseData.setMessage("Lỗi hệ thống");
        }
        return createJSONResponse(responseData);
    }

    @POST
    @Path("/auth")
    public Response authenticate(
            @FormParam("username")
            String username,
            @FormParam("password")
            String password){
        ResponseData<Admin> responseData = new ResponseData<Admin>();
        try {
            Admin admin = dao.login(username, MD5Helper.md5(password));
            if (admin != null) {
                responseData.setStatus(true);
                responseData.setData(admin);
                responseData.setMessage("success");
                httpRequest.getSession().setAttribute(Admin.class.getName(), admin);
            } else {
                responseData.setMessage("Tên đăng nhập hoặc mật khẩu không hợp lệ.");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not ", e);
            responseData.setMessage("Không thể đăng nhập. Lỗi hệ thống.");
        }
        return createJSONResponse(responseData);
    }
    @GET
    @Path("/logout")
    public Response logout() {
        ResponseData<Object> responseData = new ResponseData<Object>();
        responseData.setStatus(true);
        responseData.setMessage("success");
        httpRequest.getSession().setAttribute(Admin.class.getName(), null);
        httpRequest.getSession().invalidate();
        return createJSONResponse(responseData);
    }

    @GET
    @Path("/profile")
    public Response profile() {
        ResponseData<Admin> responseData = new ResponseData<Admin>();
        Admin admin = getCurrentAdmin();
        if (admin != null) {
            responseData.setStatus(true);
            responseData.setData(admin);
            responseData.setMessage("success");
        } else {
            responseData.setStatus(false);
            responseData.setMessage("Vui lòng đăng nhập");
        }
        return createJSONResponse(responseData);
    }

    public Admin getCurrentAdmin() {
        return (Admin) httpRequest.getSession().getAttribute(Admin.class.getName());
    }
}
