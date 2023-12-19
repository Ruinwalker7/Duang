package me.huding.luobo.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/exit")
public class ExitController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("exit session Id: " + request.getSession().getId());

        // 创建一个名为"myCookie"的cookie
        Cookie cookie = new Cookie("sessionId", "");
        // 将cookie的过期时间设置为0（立即过期）
        cookie.setMaxAge(0);
        // 将过期的cookie添加到响应
        cookie.setPath("/login");
        response.addCookie(cookie);
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        response.sendRedirect("/index");
    }
}
