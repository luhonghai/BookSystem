package com.booksystem.service;

import com.booksystem.dao.IAdminDAO;
import com.booksystem.entity.Admin;
import com.booksystem.utils.MD5Helper;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
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
        return createJSONResponse(responseData);
    }

    @GET
    @Path("/profile")
    public Response profile() {
        ResponseData<Admin> responseData = new ResponseData<Admin>();
        Admin admin = (Admin) httpRequest.getSession().getAttribute(Admin.class.getName());
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
}
