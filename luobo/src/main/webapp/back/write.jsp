<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="me.huding.luobo.dao.BlogCategoryDao" %>
<%@ page import="me.huding.luobo.entity.BlogCategory" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/editor.md/css/editormd.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/static/css/write.css" />
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/back/editor.md/editormd.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/static/js/write.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/markdown-it/13.0.1/markdown-it.min.js" integrity="sha512-SYfDUYPg5xspsG6OOpXU366G8SZsdHOhqk/icdrYJ2E/WKZxPxze7d2HD3AyXpT7U22PZ5y74xRpqZ6A2bJ+kQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>创建博客</title>

</head>
<body>
    <div class="form">
        <div>
            <div>
                <label for="titleInput">标题：</label><input id="titleInput" type="text" name="" placeholder="标题" class="layui-input">
            </div>
        </div>


        <div id="layout" >
            <label>正文：</label>
            <div id="test-editormd">
            </div>
        </div>


    <div>
<%--        <div class="tag__select">--%>
<%--            <input id="tag" type="text" class="completed-input"><button onclick="$('#tagCheckboxPanel').toggle()">选择</button><div id="tagSelectedPanel" class="completed-panel" style="height:160px;"></div><div class="fn__none completed-ck" id="tagCheckboxPanel"><span class="">DICOM</span><span class="">GitHub</span><span class="">Honeyd</span><span class="">Python</span><span class="">Robomaster</span><span class="">c++</span><span class="">git</span><span class="">latex</span><span class="">linux</span><span class="">nohup</span><span class="">stash</span><span class="">ubuntu</span><span class="">中南大学</span><span class="">医学影响</span><span class="">博客</span><span class="">大恒相机驱动</span><span class="">开源</span><span class="">待分类</span><span class="">抢课</span><span class="">数据分析</span><span class="">数据可视化</span><span class="">旅行</span><span class="">日期</span><span class="">深圳中学</span><span class="">直播</span><span class="">脚本</span><span class="">行为树</span><span class="">随记</span><div class="clear"></div></div>--%>
<%--        </div>--%>

        <div>
            <label>标签（使用英文输入状态下的逗号进行分隔）:
                <input type="text" name="" placeholder="标签" class="layui-input">
            </label>
        </div>
    </div>

        <% BlogCategoryDao blogTagsDao = new BlogCategoryDao();
            List<BlogCategory> list;
            try {
                list = blogTagsDao.selectAll();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("categorys", list); // 将数据列表存储在request作用域中
        %>
    <div>
        <label for="categorySelector">分类:</label><select id="categorySelector">
            <option value="">无分类</option>
            <c:forEach items="${categorys}" var="category">
                <option value="${category.id}">${category.name} (${category.blogNum})</option>
            </c:forEach>
        </select>
    </div>

    <div>
        <label for="createDate">创建日期（可选，自动请留空）:</label><input id="createDate" type="datetime-local">
    </div>
        <div id="layout2" >
            <label>摘要</label>
            <div id="test-editormd2">
            </div>
        </div>

        <div class="fn__right">
            <button class="marginRight12" id="cancelDo">取消</button>
            <button id="unSubmitArticle" class="fn__none marginRight12" onclick="admin.article.unPublish();">移至草稿箱
            </button>
            <button class="marginRight12" id="saveArticle">保存草稿归纳</button>
            <button id="submitArticle">发布</button>
        </div>
    </div>
</body>
</html>