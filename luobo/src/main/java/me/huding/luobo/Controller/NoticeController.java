package me.huding.luobo.Controller;

import com.google.gson.Gson;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.BlogTagsDao;
import me.huding.luobo.dao.NoticeDao;
import me.huding.luobo.entity.BlogTags;
import me.huding.luobo.entity.Notice;
import me.huding.luobo.utils.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/notice")
public class NoticeController extends HttpServlet {
    private NoticeDao noticeDao = new NoticeDao();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Notice> data = noticeDao.selectAll();
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
