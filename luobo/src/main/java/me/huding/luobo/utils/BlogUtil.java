package me.huding.luobo.utils;

import me.huding.luobo.entity.Blog;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.ZoneId;
public class BlogUtil {

    public static String createBlogPost(ServletContext servletContext, Blog blog, String uuid, Timestamp timestamp) {

        try {
            String finalHtml = createFile(blog.getCoverURL(),blog.getHtml(),blog.getTitle(),blog.getTags().replace(","," "),blog.getPublishTime().toLocalDateTime().format(DateTimeFormatter.ISO_DATE)
                    ,blog.getLastUpdateTime().toLocalDateTime().format(DateTimeFormatter.ISO_DATE));
            LocalDateTime dateTime = timestamp.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            int year = dateTime.getYear();
            int month = dateTime.getMonthValue();
            int day  = dateTime.getDayOfMonth();
            String relateDirPath = "/artical/"+year+"/"+month+"/"+day;
            String saveDirPath = servletContext.getRealPath(relateDirPath);
            File folder = new File(saveDirPath);
            // 检查文件夹是否存在
            if (!folder.exists()) {
                // 文件夹不存在，尝试创建
                boolean created = folder.mkdirs();
                if (created) {
                    System.out.println("文件夹已创建: " + saveDirPath);
                } else {
                    System.out.println("无法创建文件夹: " + saveDirPath);
                }
            } else {
                System.out.println("文件夹已存在: " + saveDirPath);
            }

            String filename = relateDirPath + "/" + uuid + ".html";
            String savePath = servletContext.getRealPath(filename);
            // 保存最终的HTML文件
            Files.write(Paths.get(savePath), finalHtml.getBytes("UTF-8"));
            System.out.println("博客文章已保存为：" + filename);
            return filename;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String updateBlogFile(ServletContext servletContext, Blog blog) {

        try {
            // 获取模板
//            String realPath = servletContext.getRealPath("template/template.html");
//            String template = new String(Files.readAllBytes(Paths.get(realPath)), "UTF-8");

            // 替换占位符
//            template = template.replace("<!-- BLOG_COVER_IMAGE -->", blog.getCoverURL());
//            template = template.replace("<!-- BLOG_CONTENT -->", blog.getHtml());
//            template = template.replace("<!-- BLOG_TITLE -->", blog.getTitle());
//            template = template.replace("<!-- BLOG_TAG -->", blog.getTags().replace(","," "));
//            template = template.replace("<!-- BLOG_CREATE_TIME -->", blog.getPublishTime().toLocalDateTime().format(DateTimeFormatter.ISO_DATE));
//            String finalHtml = template.replace("<!-- BLOG_UPDATE_TIME -->",  blog.getLastUpdateTime().toLocalDateTime().format(DateTimeFormatter.ISO_DATE));
            String finalHtml = createFile(blog.getCoverURL(),blog.getHtml(),blog.getTitle(),blog.getTags().replace(","," "),blog.getPublishTime().toLocalDateTime().format(DateTimeFormatter.ISO_DATE)
            ,blog.getLastUpdateTime().toLocalDateTime().format(DateTimeFormatter.ISO_DATE));
            String relateDirPath =blog.getPath();
            String filename = servletContext.getRealPath(relateDirPath);

            Files.write(Paths.get(filename), finalHtml.getBytes("UTF-8"));
            System.out.println("博客文章已保存为：" + filename);
            return filename;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String createFile(String cover,String html,String title,String tags,String time,String updateTime ){
         return new String("<!DOCTYPE  html>\n" +
                "<html>\n" +
                "\n" +
                "<head>\n" +
                "\t<meta charset=\"utf-8\">\n" +
                "\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "\t<meta name=\"description\" content=\"定位为IT技术博客站，博客内容主要涉及编程语言、推荐算法、数据挖掘等方面，分享实用的学习和开发资料\">\n" +
                "\t<meta name=\"keywords\" content=\"辰的博客\">\n" +
                "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\n" +
                "\t<title>橙子博客</title>\n" +
                "\t<meta name=\"renderer\" content=\"webkit\">\n" +
                "\t<link rel=\"shortcut icon\" type=\"image/png\" href=\"http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/17/17/542503d8-5e00-4fd8-899a-08d8b6752b85.png\">\n" +
                "\t<meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\n" +
                "\t<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">\n" +
                "\t<meta name=\"apple-mobile-web-app-title\" content=\"程序员技术分享博客\" />\n" +
                "\t<meta name=\"msapplication-TileColor\" content=\"#0e90d2\">\n" +
                "\t<script src=\"https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js\"></script>\n" +
                "\t<link href=\"/layui/css/layui.css\" rel=\"stylesheet\">\n" +
                "\t<link rel=\"stylesheet\" href=\"https://ftp.stackoverflow.wiki/bolo/fontawesome-free-5.14.0-web/css/all.css\">\n" +
                "\t<link rel=\"stylesheet\" href=\"/front/static/css/main.css\">\n" +
                "\t<link rel=\"stylesheet\" href=\"/front/static/css/base.css\">\n" +
                "\t<script src=\"/layui/layui.js\"></script>\n" +
                "</head>\n" +
                "\n" +
                "\n" +
                "<body>\n" +
                "<div class=\"layui-layout layui-layout-admin\" style=\"height: 60px\">\n" +
                "\t<div class=\"layui-header\">\n" +
                "\t\t<div class=\"layui-logo layui-hide-xs layui-bg-black layui-nav layui-nav-item\">\n" +
                "                    <span class=\"pull-left\" id=\"blog_name\" style=\"margin-left: 10px\">\n" +
                "                <a class=\"blog_title\" id=\"site-name\" href=\"/index\" style=\"font-size: 18px\">辰的个人博客 \uD83D\uDC4B\uD83C\uDFFC</a>\n" +
                "            </span>\n" +
                "\t\t</div>\n" +
                "\t\t<!-- 头部区域（可配合layui 已有的水平导航） -->\n" +
                "\t\t<ul class=\"layui-nav layui-layout-left\">\n" +
                "\t\t\t<!-- 移动端显示 -->\n" +
                "\t\t\t<li class=\"layui-nav-item layui-show-xs-inline-block layui-hide-sm\" lay-header-event=\"menuLeft\">\n" +
                "\t\t\t\t<i class=\"layui-icon layui-icon-spread-left\"></i>\n" +
                "\t\t\t</li>\n" +
                "\t\t\t<li class=\"layui-nav-item layui-hide-xs\">\n" +
                "\t\t\t\t<a href=\"/index\">\n" +
                "\t\t\t\t\t<i class=\"fa-fw fa fa-home\"></i>主页</a>\n" +
                "\t\t\t</li>\n" +
                "\t\t</ul>\n" +
                "\n" +
                "\t\t<ul class=\"layui-nav layui-layout-right\">\n" +
                "\n" +
                "\t\t\t<li class=\"layui-nav-item layui-hide layui-show-sm-inline-block \">\n" +
                "\t\t\t\t<a>\n" +
                "\t\t\t\t\t管理后台\n" +
                "\t\t\t\t</a>\n" +
                "\t\t\t\t<dl class=\"layui-nav-child\">\n" +
                "\t\t\t\t\t<dd><a href=\"/login\">管理登录</a></dd>\n" +
                "\t\t\t\t</dl>\n" +
                "\t\t\t</li>\n" +
                "\t\t</ul>\n" +
                "\t</div>\n" +
                "</div>\n" +
                "\n" +
                "<div id=\"web_bg\" data-type=\"color\"></div>\n" +
                "\n" +
                "<div class=\"article__top\" style=\"background-image: url("+cover+")\">\n" +
                "\t<div style=\"background-image: url("+cover+")\"></div>\n" +
                "\t<canvas id=\"articleTop\" width=\"1345\" height=\"476\"></canvas>\n" +
                "</div>\n" +
                "\n" +
                "<main class=\"layout_post\" id=\"content-inner\">\n" +
                "\t<article id=\"post\">\n" +
                "\t\t<div class=\"article\">\n" +
                "\t\t\t<div class=\"ft__center\">\n" +
                "\t\t\t\t<div class=\"article__meta\">\n" +
                "\t\t\t\t\t<time>\n" +
                "\t\t\t\t\t\t"+time +" / "+updateTime+"\n" +
                "\t\t\t\t\t</time>\n" +
                "\t\t\t\t\t/ "+tags+"\n" +
                "\t\t\t\t</div>\n" +
                "\t\t\t\t<h2 class=\"article__title\">\n" +
                "\t\t\t\t\t"+title+"\n" +
                "\t\t\t\t</h2>\n" +
                "\t\t\t</div>\n" +
                "\n" +
                "\t\t\t<div class=\"wrapper\">\n" +
                "\t\t\t<section id=\"article-container\">\n" +html+
                "\t\t\t</section>\n" +
                "\t\t\t</div>\n" +
                "\t\t</div>\n" +
                "\n" +
                "\t\t<div class=\"article__bottom\">\n" +
                "\t\t\t<div class=\"wrapper\">\n" +
                "\t\t\t\t<div class=\"fn__flex\">\n" +
                "\t\t\t\t\t<div class=\"item\" id=\"randomArticles\"></div>\n" +
                "\t\t\t\t</div>\n" +
                "\n" +
                "\t\t\t\t<section class=\"comments\">\n" +
                "\t\t\t\t\t<ul class=\"commentwrap\">\n" +
                "\t\t\t\t\t\t<div class=\"commentFont\" id=\"commentIcon\" style=\"margin: 0 auto; text-align: center; padding-bottom: 20px\">\n" +
                "\t\t\t\t\t\t\t<img src=\"https://ftp.stackoverflow.wiki/bolo/background/butterfly/comment.png\">\n" +
                "\t\t\t\t\t\t\t<span style=\"font-size: 30px; vertical-align: middle;\">评论</span>\n" +
                "\t\t\t\t\t\t</div>\n" +
                "\n" +
                "\t\t\t\t\t\t<div class=\"wrapper view-article\">\n" +
                "\t\t\t\t\t\t\t<div class=\"Valine v\" data-class=\"v\">\n" +
                "\t\t\t\t\t\t\t\t<div class=\"vpanel\">\n" +
                "\t\t\t\t\t\t\t\t\t<div class=\"vwrap\">\n" +
                "\t\t\t\t\t\t\t\t\t\t<div class=\"vheader item3\">\n" +
                "\t\t\t\t\t\t\t\t\t\t\t<input placeholder=\"你的昵称\" id=\"boloUser\" class=\"vnick vinput\" type=\"text\">\n" +
                "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t\t\t\t<div class=\"vedit\">\n" +
                "\t\t\t\t\t\t\t\t\t\t\t<textarea placeholder=\"发表评论 ...\" class=\"veditor vinput\" id=\"comment\" rows=\"5\" tabindex=\"4\" ></textarea>\n" +
                "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t\t\t\t<div><button onclick=\"sendComment()\" id=\"soloEditorAdd\" style=\"border-radius: 4px; background-color: #60b044; border: 1px solid #569e3d; color: #fff;padding: 0 12px;\">发送</button></div>\n" +
                "\t\t\t\t\t\t\t\t\t</div>\n" +
                "\n" +
                "\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t\t<div class=\"vcount\" style=\"display: block; padding: 25px 0px 20px 0px;\"><span class=\"vnum\">0</span> 评论</div>\n" +
                "\t\t\t\t\t\t\t\t<div class=\"vcards\" id=\"comments\">\n" +
                "\t\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t\t</div>\n" +
                "\t\t\t\t\t</ul>\n" +
                "\t\t\t\t</section>\n" +
                "\t\t\t</div>\n" +
                "\t\t</div>\n" +
                "\n" +
                "\n" +
                "\t</article>\n" +
                "</main>\n" +
                "\n" +
                "<script>\n" +
                "\tvar cardsDiv = document.getElementById(\"comments\")\n" +
                "\tfunction sendPageUrl() {\n" +
                "\t\tfetch('/blog/visit', {\n" +
                "\t\t\tmethod: 'POST',\n" +
                "\t\t\theaders: {\n" +
                "\t\t\t\t'Content-Type': 'application/json',\n" +
                "\t\t\t},\n" +
                "\t\t\tbody: JSON.stringify({ url: window.location.href })\n" +
                "\t\t})\n" +
                "\t\t\t\t.then(response => response.json())\n" +
                "\t\t\t\t.then(data => console.log('Success:', data))\n" +
                "\t\t\t\t.catch((error) => console.error('Error:', error));\n" +
                "\t}\n" +
                "\tfunction addCard(name,content,cdate){\n" +
                "\t\tvar card = document.createElement(\"div\");\n" +
                "\t\tcard.className = \"card\"; // 可以添加一个类名用于样式设置\n" +
                "\t\t// 将提取的信息添加到card中\n" +
                "\t\tcard.innerHTML = '<div className=\"vh\">'+\n" +
                "\t\t\t\t'<div className=\"vhead\">'+\n" +
                "\t\t\t\t'<a className=\"vnick\" rel=\"nofollow\" style=\"font-size: 1.05rem\"'+\n" +
                "\t\t\t\t'>'+name+'</a>'+\n" +
                "\t\t\t\t'</div>'+\n" +
                "\t\t\t\t'<div className=\"vmeta\">'+\n" +
                "\t\t\t\t'<span className=\"vtime\" style=\"font-size: 0.90em\">'+cdate+'</span>'+\n" +
                "\t\t\t\t'</div>'+\n" +
                "\t\t\t\t'<div className=\"vcontent\">'+\n" +
                "\t\t\t\t'<p>'+content+'</p>'+\n" +
                "\t\t\t\t'</div>'+\n" +
                "\t\t\t\t'</div>';\n" +
                "\n" +
                "\t\tif (cardsDiv.firstChild) {\n" +
                "\t\t\t// 如果已有子元素，将新元素添加为第一个子元素\n" +
                "\t\t\tcardsDiv.insertBefore(card, cardsDiv.firstChild);\n" +
                "\t\t} else {\n" +
                "\t\t\t// 如果没有子元素，直接使用appendChild\n" +
                "\t\t\tcardsDiv.appendChild(card);\n" +
                "\t\t}\n" +
                "\t}\n" +
                "\tfunction getComment(){\n" +
                "\t\tfetch('/comment/get', {\n" +
                "\t\t\tmethod: 'POST',\n" +
                "\t\t\theaders: {\n" +
                "\t\t\t\t'Content-Type': 'application/json',\n" +
                "\t\t\t},\n" +
                "\t\t\tbody: JSON.stringify({ url: window.location.href })\n" +
                "\t\t}).then(response => response.json())\n" +
                "\t\t\t\t.then(function (data){\n" +
                "\t\t\t\t\tcommentNums = data.data.length;\n" +
                "\t\t\t\t\tdocument.getElementsByClassName(\"vnum\")[0].innerHTML = commentNums\n" +
                "\t\t\t\t\tdata.data.forEach(function (item){\n" +
                "\t\t\t\t\t\tlet name = item.nickname;\n" +
                "\t\t\t\t\t\tlet content = item.content;\n" +
                "\t\t\t\t\t\tlet cdate = item.cdate;\n" +
                "\t\t\t\t\t\taddCard(name,content,cdate)\n" +
                "\t\t\t\t\t})\n" +
                "\t\t\t\t}\n" +
                "\t\t\t).catch((error) => console.error('Error:', error));\n" +
                "\t}\n" +
                "\tfunction sendComment(){\n" +
                "\t\tfetch('/comment/send', {\n" +
                "\t\t\tmethod: 'POST',\n" +
                "\t\t\theaders: {\n" +
                "\t\t\t\t'Content-Type': 'application/json;charset=utf-8',\n" +
                "\t\t\t},\n" +
                "\t\t\tbody: JSON.stringify({url: window.location.href,\n" +
                "\t\t\t\tnickname: $('#boloUser').val(),\n" +
                "\t\t\t\tcomment: $('#comment').val()})\n" +
                "\t\t}).then(response => response.json())\n" +
                "\t\t\t\t.then(function (){\n" +
                "\t\t\t\t\taddCard($('#boloUser').val(),$('#comment').val(),getCurrentFormattedDate())\n" +
                "\t\t\t\t\t$('#boloUser').val(\"\");\n" +
                "\t\t\t\t\t$('#comment').val(\"\");\n" +
                "\t\t\t\t\tcommentNums+=1\n" +
                 "\t\t\t\tdocument.getElementsByClassName(\"vnum\")[0].innerHTML = commentNums} )\n" +
                "\t\t\t\t.catch((error) => console.error('Error:', error));\n" +
                "\n" +
                "\t}\n" +
                "\tfunction getCurrentFormattedDate() {\n" +
                "\t\tvar now = new Date();\n" +
                "\n" +
                "\t\tvar year = now.getFullYear();\n" +
                "\t\tvar month = now.getMonth() + 1; // 月份是从0开始的\n" +
                "\t\tvar day = now.getDate();\n" +
                "\t\tvar hour = now.getHours();\n" +
                "\t\tvar minute = now.getMinutes();\n" +
                "\t\tvar second = now.getSeconds();\n" +
                "\n" +
                "\t\t// 如果月份、日、小时、分钟或秒数小于10，则在前面加上'0'\n" +
                "\t\tmonth = month < 10 ? '0' + month : month;\n" +
                "\t\tday = day < 10 ? '0' + day : day;\n" +
                "\t\thour = hour < 10 ? '0' + hour : hour;\n" +
                "\t\tminute = minute < 10 ? '0' + minute : minute;\n" +
                "\t\tsecond = second < 10 ? '0' + second : second;\n" +
                "\n" +
                "\t\treturn year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;\n" +
                "\t}\n" +
                "\n" +
                "\tsendPageUrl();\n" +
                "\tgetComment();\n" +
                "</script>\n" +
                "\n" +
                "</body>\n" +
                "\n" +
                "</html>");
    }
}
