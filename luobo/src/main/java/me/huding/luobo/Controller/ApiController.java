package me.huding.luobo.Controller;

import com.google.gson.Gson;
import lombok.Data;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.BlogDao;
import me.huding.luobo.dao.LunboDao;
import me.huding.luobo.entity.Blog;
import me.huding.luobo.entity.BlogCategory;
import me.huding.luobo.entity.Lunbo;
import me.huding.luobo.utils.Result;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet("/api/*")
public class ApiController extends HttpServlet {
    BlogDao blogDao = new BlogDao();

    LunboDao lunboDao = new LunboDao();
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 10; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 20; // 50MB
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);
        Result result;
        if (pathInfo.equals("/blogtable")) {
            try {
                List<Blog> data = blogDao.findforBlogTable();
                result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                System.out.println(json);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        }else if(pathInfo.equals("/blog/delete")){
            String id = request.getParameter("id");

            try {
                int i = blogDao.deleteById(id);
                if(i!=0)
                    result = new Result(ResConsts.Code.OK,"","");
                else
                    result = new Result(ResConsts.Code.FAILURE,"","");
                String json = new Gson().toJson(result);
                System.out.println(json);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        }else if (pathInfo.equals("/updatelunbo")) {
            String id  = request.getParameter("id");
            Integer value  = Integer.valueOf(request.getParameter("value")) ;
            try{
                Blog blog = blogDao.selectById(id);
                blog.setLunbo(value);
                blogDao.updateLunbo(blog);
                if(value == 1){
                    UUID uuid = UUID.randomUUID();
                    String uuidWithoutDashes = uuid.toString().replace("-", "");
                    Lunbo lunbo = new Lunbo();
                    lunbo.setId(uuidWithoutDashes);
                    lunbo.setBlogId(blog.getId());
                    lunbo.setLink(blog.getPath());
                    lunbo.setCoverImg(blog.getCoverURL());
                    lunboDao.insert(lunbo);
                    result = new Result(ResConsts.Code.SUCCESS,"",null);
                }else if(value == 0){
                    int affectRow = lunboDao.deleteByBlogId(id);
                    if(affectRow == 0){
                        result = new Result(ResConsts.Code.FAILURE,"无法删除轮播",null);
                    }else{
                        result = new Result(ResConsts.Code.SUCCESS,"",null);
                    }
                }else{
                    result = new Result(ResConsts.Code.FAILURE,"无法修改轮播",null);
                }
            }catch (Exception e){
                System.out.println(e);
                result = new Result(ResConsts.Code.FAILURE,"发送错误！无法修改轮播",null);
            }
            String json = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }else{
            response.setStatus(404);
        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取协议
        String scheme = request.getScheme(); // http 或 https
        // 获取服务器名称
        String serverName = request.getServerName();
        // 获取服务器端口号
        int serverPort = request.getServerPort();

        // 构建并拼接成根URL
        String rootUrl = scheme + "://" + serverName;
        if ((serverPort != 80 && "http".equals(scheme)) || (serverPort != 443 && "https".equals(scheme))) {
            rootUrl += ":" + serverPort;
        }
        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);
        ResponseData responseData = new ResponseData();
        if (pathInfo.equals("/upload")) {
            // 检查是否是多部分内容
            if (!ServletFileUpload.isMultipartContent(request)) {
                PrintWriter writer = response.getWriter();
                writer.println("Error: 表单必须包含 enctype=multipart/form-data");
                writer.flush();
                return;
            }

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload upload = new ServletFileUpload(factory);

            upload.setFileSizeMax(MAX_FILE_SIZE);
            upload.setSizeMax(MAX_REQUEST_SIZE);

            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            try {
                List<FileItem> formItems = upload.parseRequest(request);

                if (formItems != null && formItems.size() > 0) {
                    for (FileItem item : formItems) {
                        if (!item.isFormField()) {
                            String contentType = item.getContentType();
                            if (contentType != null && contentType.startsWith("image/")) {
                                // 获取文件扩展名
                                String ext = contentType.substring(contentType.indexOf('/') + 1);

                                // 以时间戳为文件名
                                String fileName = "image_" + System.currentTimeMillis() + "." + ext;
                                String filePath = uploadPath + File.separator + fileName;

                                File storeFile = new File(filePath);
                                System.out.println("Saving file: " + filePath);
                                item.write(storeFile);
                                item.write(storeFile);
                                responseData.setMessage("");
                                responseData.setUrl(rootUrl+"/uploads"+"/"+fileName);
                                responseData.setSuccess(1);
                            }
                        }
                    }
                }
            } catch (Exception ex) {
                responseData.setMessage("上传错误");
                responseData.setUrl("");
                responseData.setSuccess(0);
                ex.printStackTrace();
            }finally {
                String json = new Gson().toJson(responseData);
                System.out.println(json);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }

        }else{
            response.setStatus(404);
        }
    }


//            String contentType = request.getContentType();
//            if (!ServletFileUpload.isMultipartContent(request)) {
//                // 如果不是，停止处理
//                PrintWriter writer = response.getWriter();
//                writer.println("Error: 表单必须包含 enctype=multipart/form-data");
//                writer.flush();
//                return;
//            }
//
//            if(contentType != null && contentType.startsWith("image/")) {
//                // 获取图片类型（如png、jpeg）
//                String imageType = contentType.substring("image/".length());
//
//                // 构造图片的保存路径
//                String uploadPath = getServletContext().getRealPath("") ;
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) {
//                    uploadDir.mkdir();
//                }
//
//                // 生成图片文件名
//                String fileName =  File.separator + "uploadImages" + File.separator + "uploaded_img_" + System.currentTimeMillis() + "." + imageType;
//                String filePath = uploadPath + fileName;
//                File fileSaveDir = new File(filePath);
//
//                // 读取请求的内容并保存
//                try(InputStream in = request.getInputStream();
//                    FileOutputStream out = new FileOutputStream(fileSaveDir)) {
//
//                    byte[] buffer = new byte[1024];
//                    int bytesRead;
//                    while ((bytesRead = in.read(buffer)) != -1) {
//                        out.write(buffer, 0, bytesRead);
//                    }

//                } catch (IOException e) {

//                }finally {

//                }
//            } else {
//                // 如果内容类型不正确
//                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//                response.getWriter().write("Invalid content type. Expected an image.");
//            }
//        }
//
//    }

}
@Data
class ResponseData {
    int success;
    String message;
    String url;
}