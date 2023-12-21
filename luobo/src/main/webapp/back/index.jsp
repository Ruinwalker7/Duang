<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html>

<%
    HttpSession session1 = request.getSession(false); // 获取当前会话，如果不存在则不创建新会话
    System.out.println(session1);
    // 检查会话是否存在以及其中的字段值
    if (session1 != null && session1.getAttribute("user") != null) {
        // loggedIn 字段为 true，用户已登录，继续显示当前页面
    } else {
        // loggedIn 字段不为 true，用户未登录，进行重定向到登录页面或其他页面
        response.sendRedirect("/login"); // 重定向到登录页面
    }
%>

<head>
    <title>后台管理</title>
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <script href="reference" src="${pageContext.request.contextPath}/back/static/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/style.css">
    <link rel="shortcut icon" type="image/png" href="http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/17/17/542503d8-5e00-4fd8-899a-08d8b6752b85.png">
</head>
<body>



<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <a class="layui-logo" style="font-size: large" href="${pageContext.request.contextPath}/index" target="_blank">辰的个人博客</a>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" lay-unselect="">
                <a ><img src="http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/17/17/542503d8-5e00-4fd8-899a-08d8b6752b85.png" class="layui-nav-img" alt="头像">我</a>
            </li>
            <li class="layui-nav-item" lay-unselect="">
                <a href="/exit">退出</a>
            </li>
        </ul>
    </div>



    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
<%--                <li class="layui-nav-item">--%>
<%--                    <a class="main_left" data-src="/man">首页</a>--%>
<%--                </li>--%>
                <li class="layui-nav-item">
                    <a class="main_left" >文章</a>
                    <dl class="layui-nav-child">
                        <dd><a class="navItem" data-src="/back/blogtable.jsp">管理文章</a></dd>
                        <%--                        <dd><a class="navItem" data-src="/back/write.jsp">文章管理</a></dd>--%>
                        <%--                        <dd><a class="navItem" data-src="/back/write.jsp">草稿归纳</a></dd>--%>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a class="navItem" data-src="/back/write.jsp">发布文章</a></dd>
<%--                        <dd><a class="navItem" data-src="/back/write.jsp">文章管理</a></dd>--%>
<%--                        <dd><a class="navItem" data-src="/back/write.jsp">草稿归纳</a></dd>--%>
                    </dl>
                </li>

<%--                <li class="layui-nav-item">--%>
<%--                    <a class="main_left">通用</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">选项1</a></dd>--%>
<%--                        <dd><a href="javascript:;">选项2</a></dd>--%>
<%--                        <dd><a href="javascript:;">选项3</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>

<%--                <li class="layui-nav-item">--%>
<%--                    <a class="main_left"  data-src="/customer">关于</a>--%>
<%--                </li>--%>

<%--                <li class="layui-nav-item">--%>
<%--                    <a class="main_left"  data-src="/customer">帮助</a>--%>
<%--                </li>--%>
            </ul>
        </div>
    </div>


    <div class="layui-body" id="content" style="padding: 0">
        <div class="layui-tab-content" style="padding: 10px;height: 100%">
            <div class="layui-show" style="height: 100%">
                <iframe id="mainframe" frameborder="0" scrolling="yes" height="100%" width="100%" onload="this.style.height=(this.contentWindow.document.body.scrollHeight+20)+'px';" src="${pageContext.request.contextPath}/back/blogtable.jsp"> </iframe>
            </div>
        </div>
    </div>

</div>
</body>

</html>

