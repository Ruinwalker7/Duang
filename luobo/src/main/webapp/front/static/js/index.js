var BASE_PREFIX = "http://localhost:8080";

var pageSize = 10;

var api = {


    YOULIAN_URL: BASE_PREFIX + "/youlian",
    /**
     * 博文相关地址
     */
    BLOG_DISPLAY_URL: BASE_PREFIX + "/blog",
    BLOG_CATEGORY_URL: BASE_PREFIX + "/blog/category",
    BLOG_TIMELINE_URL: BASE_PREFIX + "/blog/timeline",
    BLOG_HOT_RANK_URL: BASE_PREFIX + "/blog/hotRank",
    BLOG_RECOMMEND_URL: BASE_PREFIX + "/blog/recommend",
    BLOG_LIKE_URL: BASE_PREFIX + "/blog/like",
    BLOG_LUNBO_URL: BASE_PREFIX + "/blog/lunbo",
    BLOG_TAGS_URL: BASE_PREFIX + "/blog/blogTags",
    BLOG_OPENREAD_URL: BASE_PREFIX + "/blog/openRead",
    BLOG_SHOW_BY_CATEGORY_URL: BASE_PREFIX + "/blog/showByCategory",
    BLOG_SHOW_BY_TAG_URL: BASE_PREFIX + "/blog/showByTag",
    BLOG_SHOW_BY_QUERY_URL: BASE_PREFIX + "/blog/showByQuery",

    /**
     * 评论相关地址
     */
    COMMENT_SHOW_URL: BASE_PREFIX + "/comment/show",
    COMMENT_LIKE_URL: BASE_PREFIX + "/comment/like",
    COMMENT_HATE_URL: BASE_PREFIX + "/comment/hate",
    COMMENT_REPORT_URL: BASE_PREFIX + "/comment/report",
    /**
     *
     */
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


//轮播
doAjax(api.BLOG_LUNBO_URL,{},function (res){
    res.data.forEach(function(element) {
        var newDiv = $('<div><a href="'+element.link+'"><img href="" width="100%" src="'+ element.coverImg+'"></a></div>')
        $('#carousel').append(newDiv)
    });

    layui.use(function() {
        var carousel = layui.carousel;
        // 渲染 - 图片轮播
        var inst = carousel.render({
            elem: '#ID-carousel-demo-image',
            width: '100%',
            height: '400px',
            interval: 3000,
        });
    });
})

$(window).resize(function() {
    // 在窗口大小改变时执行的代码
    console.log("窗口大小改变了！");
});
