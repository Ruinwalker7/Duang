<%@ page contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE  html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="定位为IT技术博客站，博客内容主要涉及编程语言、推荐算法、数据挖掘等方面，分享实用的学习和开发资料">
        <meta name="keywords" content="橙子博客">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>橙子博客</title>
        <meta name="renderer" content="webkit">
        <link rel="shortcut icon" type="image/png" href="/front/static/favicon.png">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-title" content="程序员技术分享博客" />
        <meta name="msapplication-TileColor" content="#0e90d2">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href="//unpkg.com/layui@2.9.0/dist/css/layui.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="/front/static/css/main.css">
    </head>


    <body style="background-color: #f3f3f3;">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <div class="layui-logo layui-hide-xs layui-bg-black layui-nav layui-nav-item">

                        <a href="/index">博客</a>

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
                        <a href="javascript:;">
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
                    <li class="layui-nav-item layui-hide layui-show-sm-inline-block ">
                        <div class="layui-input-wrap">
                            <input type="text" placeholder="搜索" class="layui-input">
                            <div class="layui-input-suffix">
                                <i class="layui-icon layui-icon-search"></i>
                            </div>
                            </input>
                        </div>
                    </li>

                    <li class="layui-nav-item layui-hide layui-show-sm-inline-block ">
                        <a href="javascript:;">
                            <img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img"> 管理后台
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="/login">管理登录</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>


        <div class="layui-row layui-col-space32" style="padding-left:200px;padding-right:200px;padding-top:100px;margin:0px">
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
                <div class="layui-card">
                    <div class="layui-card-header">热门排行</div>
                    <div class="layui-card-body">
                        结合 layui 的栅格系统<br> 轻松实现响应式布局
                    </div>
                </div>
            </div>

            <div class="layui-col-md4">
                <div class=" layui-card ">
                    <div class="layui-card-header ">文章分类</div>
                    <div class="layui-card-body ">
                        结合 layui 的栅格系统<br> 轻松实现响应式布局
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



        <script src="//unpkg.com/layui@2.9.0/dist/layui.js "></script>
        <script src="front/static/js/index.js"></script>


    </body>

    </html>