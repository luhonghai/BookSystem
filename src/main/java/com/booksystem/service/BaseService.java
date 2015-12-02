package com.booksystem.service;

import com.booksystem.dao.IDAO;
import com.booksystem.entity.AbstractEntity;
import com.booksystem.utils.JNDILookUpClass;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by luhonghai on 01/12/2015.
 */
public abstract class BaseService<D extends IDAO, T extends AbstractEntity> {

    protected Logger logger = Logger.getLogger(this.getClass().getName());

    @Context
    protected HttpServletRequest httpRequest;

    @Context
    protected HttpServletResponse httpResponse;

    protected Gson gson = new Gson();

    private Class<T> tClass;

    private String lookupName;

    protected D dao;

    class SearchResponse {
        int draw;
        double recordsTotal;
        double recordsFiltered;
        Collection<T> data;
        String message;
        boolean status;
    }

    public BaseService() {}

    public BaseService(Class<D> dClass, Class<T> tClass, String lookupName) {
        this.tClass = tClass;
        this.lookupName = lookupName;
        javax.naming.Context context;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(dClass.getName(), getLookupName());
            dao = (D) context.lookup(name);
        } catch (NamingException e) {
            logger.log(Level.SEVERE, "could not init data access object", e);
        }
    }

    protected String getLookupName() {
        return lookupName;
    }

    protected Response createJSONResponse(Object object) {
        return Response.status(200)
                .entity(object == null ? "{\"error\":\"null\"}" : gson.toJson(object))
                .build();
    }

    protected <T> Response createJSONResponse(Collection<T> objects) {
        if (objects == null) objects = new ArrayList<T>();
        return Response.status(200)
                .entity(gson.toJson(objects, new TypeToken<Collection<T>>() {
                }.getType()))
                .build();
    }

    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response list() {
        try {
            return createJSONResponse(dao.findAll());
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not list all entities", e);
            return createJSONResponse(null);
        }
    }

    @GET
    @Path("/search")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response search(
            @QueryParam("start")
            int start,
            @QueryParam("length")
            int length,
            @QueryParam("order[0][column]")
            int column,
            @QueryParam("draw")
            int draw,
            @QueryParam("search[value]")
            String search,
            @QueryParam("order[0][dir]")
            String order
    ) {
        logger.info("search datatable. Start: " + start + ". Length: " + length
            + ". Column: " + column + ". Draw: "+ draw + ". Search: " + search + ". Order: " + order);
        SearchResponse searchResponse = new SearchResponse();
        searchResponse.draw = draw;
        try {
            searchResponse.data = dao.search(start, length, column, order, search);
            double count = dao.searchCount(start, length, column, order, search);
            searchResponse.recordsFiltered = count;
            searchResponse.recordsTotal = count;
            searchResponse.status = true;
            searchResponse.message = "success";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not list all entities", e);
            searchResponse.status = false;
            searchResponse.message = "Lỗi hệ thống";

        }
        return createJSONResponse(searchResponse);
    }

    @POST
    @Path("/delete")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response delete(@FormParam("id") int id) {
        ResponseData<Object> responseData = new ResponseData<Object>();
        try {
            dao.deleteById(id);
            responseData.setMessage("success");
            responseData.setStatus(true);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not delete entity", e);
            responseData.setMessage("Lỗi hệ thống");
        }
        return createJSONResponse(responseData);
    }

    @POST
    @Path("/put")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response put(
            @FormParam("data")
            String data) {
        ResponseData<T> responseData = new ResponseData<T>();
        try {
            AbstractEntity entity = gson.fromJson(data, tClass);
            if (entity.getId() > 0) {
                responseData.setData((T) dao.update(entity));
            } else {
                responseData.setData((T) dao.save(entity));
            }
            responseData.setStatus(true);
            responseData.setMessage("success");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not put new entity",e);
            responseData.setMessage("Lỗi hệ thống");
        }
        return createJSONResponse(responseData);
    }

    @GET
    @Path("/get")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response get(
            @QueryParam("id")
            int id) {
        ResponseData<T> responseData = new ResponseData<T>();
        try {
            responseData.setData((T) dao.findOne(id));
            responseData.setMessage("success");
            responseData.setStatus(true);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not get entity by id " + id,e);
            responseData.setMessage("Lỗi hệ thống");
        }
        return createJSONResponse(responseData);
    }

    public void setHttpRequest(HttpServletRequest request) {
        this.httpRequest = request;
    }

    public void setHttpResponse(HttpServletResponse response) {
        this.httpResponse = response;
    }
}
