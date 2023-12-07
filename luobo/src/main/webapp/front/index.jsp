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
	<link rel="shortcut icon" type="image/png" href="/front/static/i/favicon.png">
	<meta http-equiv="Cache-Control" content="no-siteapp"/>
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-title" content="程序员技术分享博客"/>
	<meta name="msapplication-TileColor" content="#0e90d2">
	<link rel="stylesheet" href="/front/static/css/amazeui.min.css">
<%--  <link rel="stylesheet" href="/front/static/layui/css/layui.css"/>--%>
	<link href="//unpkg.com/layui@2.9.0/dist/css/layui.css" rel="stylesheet">
	<link rel="stylesheet" href="/front/static/css/qingcai.css"/>
</head>


<body>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo layui-hide-xs layui-bg-black">layout demo</div>
		<!-- 头部区域（可配合layui 已有的水平导航） -->
		<ul class="layui-nav layui-layout-left">
			<!-- 移动端显示 -->
			<li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
				<i class="layui-icon layui-icon-spread-left"></i>
			</li>
			<li class="layui-nav-item layui-hide-xs"><a href="javascript:;">nav 1</a></li>
			<li class="layui-nav-item layui-hide-xs"><a href="javascript:;">nav 2</a></li>
			<li class="layui-nav-item layui-hide-xs"><a href="javascript:;">nav 3</a></li>
			<li class="layui-nav-item">
				<a href="javascript:;">nav groups</a>
				<dl class="layui-nav-child">
					<dd><a href="javascript:;">menu 11</a></dd>
					<dd><a href="javascript:;">menu 22</a></dd>
					<dd><a href="javascript:;">menu 33</a></dd>
				</dl>
			</li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item layui-hide layui-show-sm-inline-block ">
				<a href="javascript:;">
					<img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">
					tester
				</a>
				<dl class="layui-nav-child">
					<dd><a href="javascript:;">Your Profile</a></dd>
					<dd><a href="javascript:;">Settings</a></dd>
					<dd><a href="javascript:;">Sign out</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
				<a href="javascript:;">
					<i class="layui-icon layui-icon-more-vertical"></i>
				</a>
			</li>
		</ul>
	</div>
</div>


<div class="layui-row layui-col-space32" style="padding:100px">
	<div class="layui-col-md7">
		<div class="layui-panel" style="margin-bottom: 20px">
			<div style="padding: 5px;">面板任意内容</div>
		</div>

		<div class="layui-carousel" id="ID-carousel-demo-image">
			<div carousel-item>
				<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-1.jpg"></div>
				<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-2.jpg"></div>
				<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-3.jpg"></div>
				<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-4.jpg"></div>
				<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-5.jpg"></div>
			</div>
		</div>
	</div>
	<div class="layui-col-md5">
	</div>
</div>



<%--	<header class="am-topbar am-topbar-fixed-top qing-header">--%>
<%--		<div class="am-g am-g-fixed">--%>
<%--		  <h1 class="am-topbar-brand">--%>
<%--	      <a class="qing-logo" href="index"></a>--%>
<%--	    </h1>--%>
<%--			<!-- nav start -->--%>
<%--			<nav class="am-g am-g-fixed qing-fixed qing-nav">--%>
<%--				<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-show-sm-only am-radius qing-btn-mobile" data-am-collapse="{target: '#blog-collapse'}" ><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>--%>
<%--			  <div class="am-collapse am-topbar-collapse" id="blog-collapse">--%>
<%--			    <ul class="am-nav am-nav-pills am-topbar-nav">--%>
<%--			      <li class="am-active"><a href="index"><i class="am-icon-home"></i> 首页</a></li>--%>
<%--&lt;%&ndash;			      <li><a href="about"><i class="am-icon-info"></i> 关于本站</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;			      <li><a href="works"><i class="am-icon-code"></i> 我的作品</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;			      <li><a href="message"><i class="am-icon-paper-plane"></i> 留言墙</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;			      <li><a href="donate"><i class="am-icon-share-alt"></i> 赞助作者</a></li>&ndash;%&gt;--%>
<%--			    </ul>--%>
<%--			    <form class="am-topbar-form am-topbar-right am-form-inline layui-form am-hide-sm-only" lay-submit lay-filter="search" role="search">--%>
<%--			      <div class="am-form-group am-form-icon">--%>
<%--			        <input id="search" name="search" type="text" required lay-verify="required" class="am-form-field am-input-sm am-radius" placeholder="请输入要搜索的关键词">--%>
<%--			        <i class="am-icon-search"></i>--%>
<%--			        <button id="btn-search" type="button" lay-submit lay-filter="search" class="layui-btn layui-btn-small am-hide-sm-only qing-btn-search">搜索</button>--%>
<%--			      </div>--%>
<%--			    </form>--%>
<%--			  </div>--%>
<%--			</nav>--%>
<%--		</div>--%>
<%--	</header>--%>
<%--	<!--mobile search input start -->--%>
<%--	<div class="am-show-sm-only am-u-sm-12 qing-sm-search">--%>
<%--		<form class="m-topbar-form am-topbar-right am-form-inline layui-form" lay-submit lay-filter="searchSM" role="search">--%>
<%--	      <div class="am-form-group am-form-icon">--%>
<%--	      	<i class="am-icon-search"></i>--%>
<%--	        <input id="search-sm" name="search" type="text" class="am-form-field am-form-field am-radius" placeholder="请输入要搜索的关键词" required lay-verify="required">--%>
<%--	      </div>--%>
<%--			</form>--%>
<%--	</div>--%>

<%--	<div class="layui-carousel" id="ID-carousel-demo-image">--%>
<%--		<div carousel-item>--%>
<%--			<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-1.jpg"></div>--%>
<%--			<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-2.jpg"></div>--%>
<%--			<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-3.jpg"></div>--%>
<%--			<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-4.jpg"></div>--%>
<%--			<div><img src="https://unpkg.com/outeres/demo/carousel/720x360-5.jpg"></div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	--%>
<%--	<!--mobile search input end -->--%>
<%--	<!-- content srart -->--%>
<%--	<div class="am-g am-g-fixed qing-fixed qing-container">--%>
<%--		  <!-- 正文内容开始-->--%>
<%--	    <div class="am-u-md-8 am-u-sm-12">--%>
<%--	    		<!-- 通知公告开始 -->--%>
<%--	    		<div id="qing-notice-cnt"></div>--%>
<%--	    		<!-- 通知公告结束 -->--%>
<%--	    		<!-- 图片轮播开始-->--%>
<%--	    		<div class="qing-slider" id="qing-lunbo"></div>--%>

<%--	    		<!-- 图片轮播结束-->--%>
<%--	    		<!-- 热门排行开始-->--%>
<%--		    	<div class="qing-hot-rank qing-margin-bottom" id="hot-rank-blogs"></div>--%>
<%--		    	<!-- 热门排行结束-->--%>
<%--	    		<!-- 博文列表 -->--%>
<%--					<div id="blog-list"></div>--%>
<%--					<div class="qing-page qing-margin-bottom">--%>
<%--						<div id="blog-pager" class="qing-text-center"></div>--%>
<%--					</div>--%>
<%--	    </div>--%>

<%--	    <!--正文内容结束-->--%>
<%--			<!-- 侧边栏 开始-->--%>
<%--	    <div class="am-u-md-4 am-u-sm-12" id="qing-left"></div>--%>
<%--	    <!-- 侧边栏结束-->--%>
<%--	</div>--%>
<%--	<!-- content end -->--%>

<%--	  <footer class="qing-footer">--%>
<%--		<div class="qing-text-center">--%>
<%--		   <h3><strong>程序员技术分享博客简介</strong></h3>--%>
<%--		   <p class="am-text-sm">程序员技术分享博客定位为IT技术博客站，博客内容主要涉及编程语言、推荐算法、数据挖掘等方面，分享实用的学习和开发资料。 </p>--%>
<%--		</div>--%>
<%--		<div class="qing-text-center">Copyright © 2016  |  联系我 : xxxxxxxx@qq.com  |  All Rights Reserved. </div>--%>
<%--	  </footer>--%>
<%--&lt;%&ndash;  <script src="/front/static/js/jquery.min.js"></script>&ndash;%&gt;--%>
<%--	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>--%>
<%--	<script src="/front/static/js/amazeui.min.js"></script>--%>

	<script src="//unpkg.com/layui@2.9.0/dist/layui.js"></script>
<%--&lt;%&ndash;	<script src="/front/static/layui/layui.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;	<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;		layui.config({base:'/front/static/js/'}).use('index');&ndash;%&gt;--%>
<%--&lt;%&ndash;	</script>&ndash;%&gt;--%>
<%--<!--	<script type="text/javascript" src="/front/static/js/badutongji.js" ></script>-->--%>
	<script>
		layui.use(function(){
			var carousel = layui.carousel;
			// 渲染 - 图片轮播
			carousel.render({
				elem: '#ID-carousel-demo-image',
				width: '720px',
				height: '360px',
				interval: 3000,
				// full: true
			});
		});
	</script>
</body>
</html>