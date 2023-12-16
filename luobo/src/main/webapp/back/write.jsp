<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>

</head>
<body>

    <div>标题：</div>
    <div>
        <input type="text" name="" placeholder="文本框" class="layui-input">
    </div>
    <link rel="stylesheet" href="/back/editor.md/css/editormd.min.css" />
<%--    <link rel="stylesheet" href="/back/static/css/admin.css" />--%>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="/back/editor.md/editormd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/markdown-it/13.0.1/markdown-it.min.js" integrity="sha512-SYfDUYPg5xspsG6OOpXU366G8SZsdHOhqk/icdrYJ2E/WKZxPxze7d2HD3AyXpT7U22PZ5y74xRpqZ6A2bJ+kQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <div id="layout">
        <label>正文</label>
        <div id="test-editormd"><textarea style="display:none;"></textarea>
        </div>
        </div>

        <script type="text/javascript">
            var testEditor;

            $(function() {
                testEditor = editormd("test-editormd", {
                    width   : "95%",
                    height  : 640,
                    syncScrolling : "single",
                    path    : "editor.md/lib/"
                });

            });
        </script>

</body>
</html>