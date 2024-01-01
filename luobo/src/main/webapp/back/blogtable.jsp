<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/editor.md/css/editormd.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/static/css/write.css" />
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/back/editor.md/editormd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/markdown-it/13.0.1/markdown-it.min.js" integrity="sha512-SYfDUYPg5xspsG6OOpXU366G8SZsdHOhqk/icdrYJ2E/WKZxPxze7d2HD3AyXpT7U22PZ5y74xRpqZ6A2bJ+kQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>创建博客</title>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
</head>
<body>

<div style="padding: 16px;">
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>

<script type="text/html" id="ID-table-demo-templet-switch">
    <input type="checkbox" name="lunbo"  title="开启|关闭" lay-skin="switch" value="{{= d.id }}"
           lay-filter="demo-templet-status" {{= d.lunbo == 1 ? "checked": ""}}>
</script>

<script type="text/html" id="barDemo">
    <div class="layui-clear-space">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>

    </div>
</script>

<script>
    layui.use(['table', 'dropdown'], function(){
        var table = layui.table;
        var dropdown = layui.dropdown;
        var form = layui.form;
        // 创建渲染实例
        table.render({
            elem: '#test',
            url: '/api/blogtable', // 此处为静态模拟数据，实际使用时需换成真实接口
            // toolbar: '#toolbarDemo',
            height: 'full-50', // 最大高度减去其他容器已占有的高度差
            css: [ // 重设当前表格样式
                '.layui-table-tool-temp{padding-right: 145px;}'
            ].join(''),
            cellMinWidth: 80,
            totalRow: false, // 开启合计行
            page: false,
            cols: [[
                {field:'title', minWidth:120, title: '标题'},
                {field:'commentNum', title:'评论', width: 80, sort: true},
                {field:'readNum', title:'阅读', width: 80, sort: true},
                {field:'tags', width:80, title: 'tags'},
                {field:'categoryID', width:80, title: '分类'},
                {field:'publishTime', title:'发布时间', sort: true, fieldTitle: '', hide: 0, width:200, expandedMode: 'tips'},
                {title: '轮播', width:105, templet: '#ID-table-demo-templet-switch'},
                {fixed: 'right', title:'操作', width: 134, minWidth: 125, toolbar: '#barDemo'}
            ]],
            done: function(){
                var id = this.id;
                // 触发单元格工具事件
                table.on('tool(test)', function(obj){ // 双击 toolDouble
                    var data = obj.data; // 获得当前行数据
                    // console.log(obj)
                    if(obj.event === 'edit'){
                        const url1 = "/back/write.jsp?id=" + data.id;
                        window.location.href = url1;
                    } else if(obj.event === 'delete'){
                        layer.confirm('真的删除文章：'+ data.title +' 么', function(index){
                            const url1 = "/api/blog/delete?id=" + data.id;
                            // 使用 Fetch API 发起 DELETE 请求
                            fetch(url1, {
                                method: 'GET',
                            })
                            .then(response => {
                                if (!response.ok) {
                                    layer.msg('删除失败', {icon: 2});
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                if(data.code == 0){
                                    layer.msg('删除成功', {icon: 1});
                                    obj.del(); // 删除对应行（tr）的DOM结构
                                }else{
                                    layer.msg('您无法删除！', {icon: 2});
                                }

                            })
                            .catch(error => {
                                layer.msg('您无法删除！', {icon: 2});
                                // 请求失败时的处理
                                console.error('There has been a problem with your fetch operation:', error);
                            });
                            layer.close(index);
                        });
                    }
                });
            },
            error: function(res, msg){
                console.log(res, msg)
            }
        });
        ;

        // 触发表格复选框选择
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });

        // 触发表格单选框选择
        table.on('radio(test)', function(obj){
            console.log(obj)
        });

        // 行单击事件
        table.on('row(test)', function(obj){
            //console.log(obj);
            //layer.closeAll('tips');
        });
        // 行双击事件
        table.on('rowDouble(test)', function(obj){
            console.log(obj);
        });

        // 状态 - 开关操作
        form.on('switch(demo-templet-status)', function(obj){
            var value = this.checked ? 1:0
            var id = this.value;
            var url1 = '/api/updatelunbo'
            url1 += '?id='+id+'&value='+value
            fetch(url1, {
                method: 'GET'
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if(data.code == 0){
                    layer.msg('修改成功', {icon: 1});
                }else{
                    layer.msg('修改失败', {icon: 2});
                }
                console.log('Success:', data);
            })
            .catch(error => {
                layer.msg('修改失败', {icon: 2});
                console.error('Error:', error);
            });
        });
    });
</script>
</body>
</html>
