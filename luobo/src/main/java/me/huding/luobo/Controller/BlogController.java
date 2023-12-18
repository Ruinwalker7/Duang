package me.huding.luobo.Controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.BlogCategoryDao;
import me.huding.luobo.dao.BlogDao;
import me.huding.luobo.dao.BlogTagsDao;
import me.huding.luobo.entity.Blog;
import me.huding.luobo.entity.BlogCategory;
import me.huding.luobo.entity.BlogTags;
import me.huding.luobo.utils.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;


@WebServlet("/blog/*")
public class BlogController extends HttpServlet {
    private final BlogCategoryDao blogCategoryDao = new BlogCategoryDao();

    private final BlogTagsDao blogTagsDao = new BlogTagsDao();

    private final BlogDao blogDao = new BlogDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            Result result = new Result(ResConsts.Code.FAILURE,ResConsts.Msg.SERVER_ERROR,null);
            String json = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            // 处理 /path/
        } else if (pathInfo.equals("/category")) {
            try {
                List<BlogCategory> data = blogCategoryDao.selectAll();
                Result result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        } else if (pathInfo.equals("/blogTags")) {
            try {
                List<BlogTags> data = blogTagsDao.selectAll();
                Result result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        }  else if (pathInfo.equals("/lunbo")) {
            try {
                List<Blog> data = blogDao.findLunbo();
                Result result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        } else if (pathInfo.equals("/hotRank")) {
            try {
                List<Blog> data = blogDao.findHot();
                Result result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        }else if (pathInfo.equals("/create")) {

            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm").create();
            // 读取请求体中的JSON数据
            StringBuilder buffer = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            String jsonData = buffer.toString();

            Blog blog  = gson.fromJson(jsonData,Blog.class);
            blog.setId(UUID.randomUUID().toString());
            try {
                blogDao.insert(blog);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            System.out.println("receive login request"+jsonData);
        }else {
            Result result = new Result(ResConsts.Code.FAILURE,ResConsts.Msg.SERVER_ERROR,null);
            System.out.println("不可用资源");
            String json = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            // 处理其他情况或返回错误
        }
    }
}
