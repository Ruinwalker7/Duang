package me.huding.luobo.Controller;

import com.google.gson.Gson;
import com.wf.captcha.utils.CaptchaUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.UserDao;
import me.huding.luobo.entity.User;
import me.huding.luobo.utils.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

@WebServlet("/user/login")
public class UserController extends HttpServlet {
    private final UserDao userDao = new UserDao();

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    class loginUser{
        private String username;

        private String password;

        private String code;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json;
        try (Scanner scanner = new Scanner(request.getInputStream(), StandardCharsets.UTF_8)) {
            json = scanner.useDelimiter("\\A").next();
        }

        loginUser user  = new Gson().fromJson(json,loginUser.class);
        System.out.println("try login session Id: " + request.getSession().getId());
        System.out.println("receive login request"+user);
        System.out.println("correct code: "+request.getSession().getAttribute("captcha"));

        if (!CaptchaUtil.ver(user.getCode(), request)) {
            System.out.println("Verity code error! Correct code:"+request.getSession().getAttribute("captcha"));
            CaptchaUtil.clear(request);  // 清除session中的验证码
            Result result = new Result(ResConsts.Code.CODE_ERROR,"验证码错误","");
            String retJson = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(retJson);
            return;
        }

        User user1 = userDao.selectByUsername(user.getUsername());

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

            Cookie sessionCookie = new Cookie("sessionId", session.getId());
            sessionCookie.setMaxAge(24 * 60 * 60);
            sessionCookie.setPath("/login");
            response.addCookie(sessionCookie);

            Result result = new Result(ResConsts.Code.OK,"","");
            String retJson = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(retJson);
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
