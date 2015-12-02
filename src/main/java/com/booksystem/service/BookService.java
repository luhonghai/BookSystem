package com.booksystem.service;

import com.booksystem.constant.Common;
import com.booksystem.dao.IBookDAO;
import com.booksystem.entity.Book;
import org.apache.commons.io.FileUtils;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.File;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;

/**
 * Created by longnguyen on 29/11/2015.
 */
@Path("book")
public class BookService extends BaseService<IBookDAO, Book> {

    public BookService() {
        super(IBookDAO.class, Book.class, "BookEJB");
    }

    @POST
    @Path("/put/upload")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public Response uploadFile() {
        ResponseData<Book> responseData = new ResponseData<Book>();
        try {
            Map<String, String> formData = getFormData();
            Book entity = new Book();
            entity.setId(Integer.parseInt(formData.get("txtId")));
            entity.setTitle(formData.get("txtTitle"));
            entity.setAuthor(formData.get("txtAuthor"));
            entity.setContent(formData.get("txtContent"));
            entity.setDescription(formData.get("txtDescription"));
            entity.setPrice(Double.parseDouble(formData.get("txtPrice")));
            String rootDir = httpRequest.getServletContext().getRealPath("/");
            logger.info("Root dir: " + rootDir);
            File imagesDir = new File(rootDir, Common.IMAGES_DIR);
            if (!imagesDir.exists()) imagesDir.mkdirs();
            File tmp = new File(formData.get("image"));
            if (tmp.exists()) {
                entity.setImage(tmp.getName());
                File image = new File(imagesDir, entity.getImage());
                logger.info("Save image to " + image);
                FileUtils.moveFile(tmp, image);
            }
            if (entity.getId() > 0) {
                responseData.setData(dao.update(entity));
            } else {
                responseData.setData(dao.save(entity));
            }
            responseData.setStatus(true);
            responseData.setMessage("success");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "could not put new book",e);
            responseData.setMessage("Lỗi hệ thống");
        }
        return createJSONResponse(responseData);
    }

}