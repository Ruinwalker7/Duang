<%@ page import="me.huding.luobo.entity.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="me.huding.luobo.dao.BlogDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE  html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="定位为IT技术博客站，博客内容主要涉及编程语言、推荐算法、数据挖掘等方面，分享实用的学习和开发资料">
    <meta name="keywords" content="辰的博客">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>橙子博客</title>
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" type="image/png" href="http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/17/17/542503d8-5e00-4fd8-899a-08d8b6752b85.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="程序员技术分享博客" />
    <meta name="msapplication-TileColor" content="#0e90d2">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <link rel="stylesheet" href="https://ftp.stackoverflow.wiki/bolo/fontawesome-free-5.14.0-web/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/static/css/main.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/front/static/js/index.js"></script>
</head>


    <body>
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <div class="layui-logo layui-hide-xs layui-bg-black layui-nav layui-nav-item">
                    <span class="pull-left" id="blog_name" style="margin-left: 10px">
                <a class="blog_title" id="site-name" href="${pageContext.request.contextPath}/index" style="font-size: 18px">辰的个人博客 👋🏼</a>
            </span>

<%--                    <a href="/index">--%>
<%--                        博客</a>--%>

                </div>
                <!-- 头部区域（可配合layui 已有的水平导航） -->
                <ul class="layui-nav layui-layout-left">
                    <!-- 移动端显示 -->
                    <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                        <i class="layui-icon layui-icon-spread-left"></i>
                    </li>
                    <li class="layui-nav-item layui-hide-xs">
                        <a href="/index">
                            <i class="fa-fw fa fa-home"></i>主页</a>
                    </li>
<%--                    <li class="layui-nav-item layui-hide-xs">--%>
<%--                        <a href="javascript:;">--%>
<%--                            <i class="fa-fw fa fa-id-card"></i> 关于本站</a>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item layui-hide-xs">--%>
<%--                        <a href="javascript:;">--%>
<%--                            <i class="fa fa-archive"></i> 我的作品 </a>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item layui-hide-xs">--%>
<%--                        <a href="javascript:;">--%>
<%--                            <i class="fa fa fa-thumbs-up"></i> 留言墙</a>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item layui-hide-xs">--%>
<%--                        <a href="javascript:;">--%>
<%--                            <i class="fa fa-support"></i> 赞助作者</a>--%>
<%--                    </li>--%>

                </ul>

                <ul class="layui-nav layui-layout-right">
<%--                    <li class="layui-nav-item layui-hide layui-show-sm-inline-block ">--%>
<%--                        <div class="layui-input-wrap">--%>
<%--                            <label>--%>
<%--                                <input type="text" placeholder="搜索" class="layui-input">--%>
<%--                            </label>--%>
<%--                            <div class="layui-input-suffix">--%>
<%--                                <i class="layui-icon layui-icon-search"></i>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>

                    <li class="layui-nav-item layui-hide layui-show-sm-inline-block ">
                        <a>
                            管理后台
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="${pageContext.request.contextPath}/login">管理登录</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <div id="web_bg" data-type="color"></div>

        <div class="layui-row layui-col-space32" style="padding-top:100px;margin:0 auto;max-width: 1400px;">
            <div class="layui-col-md8">
<%--                <div class="layui-panel"  style="margin-bottom: 20px">--%>
<%--                    <div style="padding: 5px;" >面板任意内容</div>--%>
<%--                </div>--%>

                <div class="layui-carousel" id="ID-carousel-demo-set" lay-filter="filter-demo-carousel-set"  style="margin-bottom: 20px">
                    <div carousel-item id="notice-content">

                    </div>
                </div>

                <div class="layui-carousel" id="ID-carousel-demo-image" style="margin-bottom: 20px">
                    <div carousel-item id="carousel">
                    </div>
                </div>
<%--                <div class="layui-card">--%>
<%--                    <div class="layui-card-header">热门排行</div>--%>
<%--                    <div class="layui-card-body">--%>
<%--                        结合 layui 的栅格系统<br> 轻松实现响应式布局--%>
<%--                    </div>--%>
<%--                </div>--%>

    <%
        BlogDao blogDao = new BlogDao();
        List<Blog> dataList; // 从数据库获取数据
        try {
            dataList = blogDao.findforIndex();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("dataList", dataList); // 将数据列表存储在request作用域中
    %>
    <div class="recent-posts" id="recent-posts">
    <c:forEach items="${dataList}" var="data">

        <article class="layui-card recent-post-item" itemscope itemtype="http://schema.org/BlogPosting" style="flex: auto">
            <div class="post_cover left_radius">
                <a href="${data.path}" title="linux nohup命令">
                    <img class="post_bg entered loading" src="${data.coverURL}" data-ll-status="loading" alt="${data.title}">
                </a>
            </div>
            <div class="recent-post-info">
                <a class="article-title" href="${data.path}" title="${data.title}">${data.title}</a>
                <div class="article-meta-wrap">
                    <time class="post-meta__date" title="">
                        <i class="far fa-calendar-alt"></i>
                            ${data.publishTime.toLocalDateTime().year}-${data.publishTime.toLocalDateTime().month.value}-${data.publishTime.toLocalDateTime().dayOfMonth} ${data.publishTime.toLocalDateTime().hour}:${data.publishTime.toLocalDateTime().minute}
                    </time>
                    <span class="article-meta"><span class="article-meta__separator">|</span>
                            <i class="fas fa-boxes article-meta__icon"></i>
                            <a class="article-meta__categories">${data.readNum} 浏览</a>
                            <span class="article-meta__separator">|</span>
                            <i class="fas fa-comment"></i>
                            <a class="article-meta__categories">${data.commentNum} 评论</a>
                            </span>
                    <span class="article-meta tags">
                                <span class="article-meta__separator">|</span>
                                <i class="fas fa-tag article-meta__icon"></i>
                                <a class="article-meta__tags" >${data.tags}</a>
<%--                                <span class="article-meta__link"> </span>--%>
<%--                                <i class="fas fa-tag article-meta__icon"></i>--%>
<%--                                <a class="article-meta__tags" href="http://blog.chen.szkxy.net:8886/blog/tags/nohup">nohup</a>--%>
                                <span class="article-meta__link"> </span>
                    </span>
                </div>
                <div class="content">${data.blogAbstract}
                </div>
            </div>
        </article>


    </c:forEach>
    </div>
            </div>
            <div class="layui-col-md4" >
            <div class="aside_content" id="aside_content">
                <div class="card-widget card-info">
                    <div class="card-content">
                        <div class="card-info-avatar is-center"><img class="avatar-img entered loaded" onerror="this.onerror=null;this.src=null;" alt="avatar" src="http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/17/17/542503d8-5e00-4fd8-899a-08d8b6752b85.png" referrerpolicy="origin" data-ll-status="loaded">
                            <div class="author-info__name">辰的个人博客</div>
                            <div class="author-info__description">一个独处的小空间</div>
                        </div>
                        <div class="card-info-data">
                            <div class="card-info-data-item is-center"><a href="/index">
                                <div class="headline">文章</div>
                                <div class="length_num">${dataList.size()}</div>
                            </a></div>
<%--                            <div class="card-info-data-item is-center"><a href="http://blog.chen.szkxy.net:8886/blog/categories.html">--%>
<%--                                <div class="headline">分类</div>--%>
<%--                                <div class="length_num">3</div>--%>
<%--                            </a></div>--%>
<%--                            <div class="card-info-data-item is-center"><a href="http://blog.chen.szkxy.net:8886/blog/tags.html">--%>
<%--                                <div class="headline">标签</div>--%>
<%--                                <div class="length_num">20</div>--%>
<%--                            </a></div>--%>
                        </div>
<%--                        <div class="card-info-bookmark is-center">--%>
<%--                            <button class="button--animated" id="bookmark-it" title="加入书签"><i class="fas fa-bookmark"></i><span>加入书签</span></button>--%>
<%--                        </div>--%>
                        <div class="card-info-social-icons is-center">
                            <a class="social-icon" target="_blank" title="Github" href="https://github.com/Ruinwalker7">
                                <i class="fab fa-github"></i>
                            </a>
                        </div>
                    </div>
                </div>
                </div>
            </div>
<%--                <div class="layui-card ">--%>
<%--                    <div class="layui-card-header ">最新文章</div>--%>
<%--                    <div class="layui-card-body ">--%>
<%--                        结合 layui 的栅格系统<br> 轻松实现响应式布局--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="layui-card ">--%>
<%--                    <div class="layui-card-header ">标签云</div>--%>
<%--                    <div class="layui-card-body ">--%>
<%--                        结合 layui 的栅格系统<br> 轻松实现响应式布局--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="layui-card ">--%>
<%--                    <div class="layui-card-header ">友情链接</div>--%>
<%--                    <div class="layui-card-body ">--%>
<%--                        结合 layui 的栅格系统<br> 轻松实现响应式布局--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="layui-card ">--%>
<%--                    <div class="layui-card-header ">猜你喜欢</div>--%>
<%--                    <div class="layui-card-body ">--%>
<%--                        结合 layui 的栅格系统<br> 轻松实现响应式布局--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>


    </body>

    </html>