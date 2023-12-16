package me.huding.luobo.utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BlogUtil {
    public static void createBlogPost(String content, int postId) {
        try {
            String template = new String(Files.readAllBytes(Paths.get("template.html")), "UTF-8");

            // 替换占位符
            String finalHtml = template.replace("<!-- BLOG_CONTENT -->", content);

            // 生成文件名（格式：YYYYMMDDHHMMSS_id.html）
            LocalDateTime dateTime = LocalDateTime.now();
            String timestamp = dateTime.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
            String filename = timestamp + "_" + postId + ".html";

            // 保存最终的HTML文件
            Files.write(Paths.get(filename), finalHtml.getBytes("UTF-8"));
            System.out.println("博客文章已保存为：" + filename);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
