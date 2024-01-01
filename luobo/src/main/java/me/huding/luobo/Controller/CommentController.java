package me.huding.luobo.Controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.config.TimestampSerializer;
import me.huding.luobo.dao.CommentDao;
import me.huding.luobo.entity.Blog;
import me.huding.luobo.entity.Comment;
import me.huding.luobo.entity.Lunbo;
import me.huding.luobo.entity.Notice;
import me.huding.luobo.utils.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.temporal.ChronoField;
import java.util.List;
import java.util.UUID;

@WebServlet("/comment/*")
public class CommentController extends HttpServlet {

    Gson gson =new GsonBuilder()
            .registerTypeAdapter(Timestamp.class, new TimestampSerializer())
            .create();
    CommentDao commentDao = new CommentDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        Result result;
        String json = null;
        if(pathInfo.equals("/send")){
            try {
                StringBuilder buffer = new StringBuilder();
                BufferedReader reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    buffer.append(line);
                }
                String jsonData = buffer.toString();
                JsonObject jsonObject = new Gson().fromJson(jsonData, JsonObject.class);
                String urlStr = jsonObject.get("url").getAsString();

                // 创建 URL 对象并获取文件名
                String path = new URL(urlStr).getPath();
                String fileName = path.substring(path.lastIndexOf('/') + 1);
                String[] parts = fileName.split("\\.");
                String namePart = parts.length > 1 ? parts[0] : fileName; // 提取类别前的名称

                // 设置新的评论
                Comment comment = new Comment();
                comment.setBlogId(namePart);
                comment.setContent(jsonObject.get("comment").getAsString());
                comment.setNickname(jsonObject.get("nickname").getAsString());
                comment.setId(UUID.randomUUID().toString().replace("-", ""));
                comment.setCdate(new Timestamp(System.currentTimeMillis()));

                if (commentDao.insert(comment) == 1) {
                    result = new Result(ResConsts.Code.SUCCESS, "", null);
                } else {
                    result = new Result(ResConsts.Code.FAILURE, "", null);
                }
                json = gson.toJson(result);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(json);
        }else if(pathInfo.equals("/get")){
            try {
                StringBuilder buffer = new StringBuilder();
                BufferedReader reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    buffer.append(line);
                }
                String jsonData = buffer.toString();
                JsonObject jsonObject = new Gson().fromJson(jsonData, JsonObject.class);
                String urlStr = jsonObject.get("url").getAsString();
                // 创建 URL 对象并获取文件名
                String path = new URL(urlStr).getPath();
                String fileName = path.substring(path.lastIndexOf('/') + 1);
                String[] parts = fileName.split("\\.");
                String namePart = parts.length > 1 ? parts[0] : fileName; // 提取类别前的名称
                List<Comment> comments = commentDao.findByBlogId(namePart);
                result = new Result(ResConsts.Code.SUCCESS, "", comments);
                json = gson.toJson(result);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(pathInfo.equals("/all")){
            try {
                List<Comment> comments = commentDao.findAll();
                result = new Result(ResConsts.Code.SUCCESS, "", comments);
                json = gson.toJson(result);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(pathInfo.equals("/updatestatue")){
            String id  = request.getParameter("id");
            Integer value  = Integer.valueOf(request.getParameter("value")) ;
            try{
                Comment comment = commentDao.selectById(id);
                comment.setStatus(value);
                int affectRow =  commentDao.updateStatueById(comment);
                if(affectRow == 0){
                    result = new Result(ResConsts.Code.FAILURE,"无法修改",null);
                }else{
                    result = new Result(ResConsts.Code.SUCCESS,"",null);
                }
            }catch (Exception e){
                System.out.println(e);
                result = new Result(ResConsts.Code.FAILURE,"发生错误！无法修改",null);
            }
            json = new Gson().toJson(result);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        Result result;
        String json = null;
        if(pathInfo.equals("/all")){
            List<Comment> comments = commentDao.findAllWithName();
            result = new Result(ResConsts.Code.SUCCESS, "", comments);
            json = gson.toJson(result);
        } else if (pathInfo.equals("/delete")) {
            String id = request.getParameter("id");
            int i = commentDao.deleteById(id);
            if(i!=0)
                result = new Result(ResConsts.Code.OK,"","");
            else
                result = new Result(ResConsts.Code.FAILURE,"","");
            json = new Gson().toJson(result);
        }else{
            response.setStatus(404);
            return;
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
