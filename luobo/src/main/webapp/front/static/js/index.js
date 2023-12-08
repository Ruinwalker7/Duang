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


$(document).ready(function() {
    $.post(api.NOTICE_SHOW_URL, {}, function(data, status) {
        console.log(data);

        // 如果需要进一步处理返回的数据，请在这里编写代码
        // 例如，解析 data 对象并更新页面元素
    });
});