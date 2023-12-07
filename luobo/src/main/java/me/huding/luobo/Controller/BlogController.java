package me.huding.luobo.Controller;

import com.google.gson.Gson;
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
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet("/blog/*")
public class BlogController extends HttpServlet {
    private BlogCategoryDao blogCategoryDao = new BlogCategoryDao();

    private BlogTagsDao blogTagsDao = new BlogTagsDao();

    private BlogDao blogDao = new BlogDao();

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
        }else {
            Result result = new Result(ResConsts.Code.FAILURE,ResConsts.Msg.SERVER_ERROR,null);
            String json = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            // 处理其他情况或返回错误
        }
    }
}
