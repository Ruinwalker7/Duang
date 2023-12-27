var BASE_PREFIX = "http://localhost:8080";

var api = {
    NOTICE_SHOW_URL: BASE_PREFIX + "/notice",
}

doAjax = function(url, data, success, options) {
    var that = this;
    options = options || {};
    data = data || {};
    return $.ajax({
        type: options.type || 'post',
        dataType: options.dataType || 'json',
        data: data,
        url: url,
        success: function(res) {
            console.log(res);
            if(res.code == 0) {
                console.log("category return success")
                success && success(res);
            } else {
                layer.msg(res.msg || res.code, {
                    shift: 6
                });
            }
        },
        error: function(e) {
            options.error || layer.msg('请求异常，请重试', {
                shift: 6
            });
        }
    });
}


doAjax( api.NOTICE_SHOW_URL ,{},function (res){
    res.data.forEach(function(element) {
        var newDiv = $('<div class="layui-panel">\n' +
            '  <div style="padding: 9px;" class="notice-panel">' +
            '<i class="fa fa-bullhorn" />   '+element.content+'</div>\n' +
            '</div>')
        $('#notice-content').append(newDiv)
    });

    //公告
    layui.use(function(){
        var carousel = layui.carousel;
        var form = layui.form;
        var util = layui.util;
        var $ = layui.$;

        // 渲染
        var carInst = carousel.render({
            elem: '#ID-carousel-demo-set',
            width: 'auto',
            height: '30px',
            anim: 'updown',
            interval: 3000,
            arrow: 'none',
            indicator: 'none',
        });
        var height = $('.notice-panel').eq(0).outerHeight()
        console.log(height)
        carInst.reload({
            height: height+'px',
        })
    });

},{})



$(window).resize(function() {
    // 在窗口大小改变时执行的代码
    console.log("窗口大小改变了！");
});
