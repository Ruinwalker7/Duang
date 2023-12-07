package me.huding.luobo.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.BlogTagsDao;
import me.huding.luobo.entity.BlogTags;
import me.huding.luobo.utils.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/blog/blogTags")
public class BlogTagsController extends HttpServlet {

    private BlogTagsDao blogTagsDao = new BlogTagsDao();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    }
}
