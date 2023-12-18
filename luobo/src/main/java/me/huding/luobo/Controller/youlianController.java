package me.huding.luobo.Controller;

import com.google.gson.Gson;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.youlianDao;
import me.huding.luobo.entity.youlian;
import me.huding.luobo.utils.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/youlian")
public class youlianController extends HttpServlet {
    private final youlianDao youlianDao1 = new youlianDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<youlian> data = youlianDao1.selectAll();
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
