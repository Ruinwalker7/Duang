package me.huding.luobo.Controller;

import com.google.gson.Gson;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.UserDao;
import me.huding.luobo.entity.User;
import me.huding.luobo.utils.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

@WebServlet("/user/login")
public class UserController extends HttpServlet {
    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json;
        try (Scanner scanner = new Scanner(request.getInputStream(), StandardCharsets.UTF_8)) {
            json = scanner.useDelimiter("\\A").next();
        }

        User user  = new Gson().fromJson(json,User.class);
        User user1 = userDao.selectByUsername(user.getUsername());
        System.out.println("receive login request"+user);

        if(user1 == null){
            System.out.println("Don't find user");
            Result result = new Result(ResConsts.Code.PASS_ERROR,"用户名或密码错误","");
            String retJson = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(retJson);
        }
        else if(user.getPassword().equals(user1.getPassword()) ){
            System.out.println("登录成功："+user);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            Result result = new Result(ResConsts.Code.OK,"","");
            String retJson = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(retJson);
            response.sendRedirect("/home");
        }else{
            System.out.println(user1);
            Result result = new Result(ResConsts.Code.PASS_ERROR,"用户名或密码错误","");
            String retJson = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(retJson);

        }

    }
}
