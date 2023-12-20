package me.huding.luobo.utils;

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

    public static String createBlogPost(ServletContext servletContext, String content, String uuid, Timestamp timestamp) {

        try {
            // 获取模板
            String realPath = servletContext.getRealPath("template/template.html");
            String template = new String(Files.readAllBytes(Paths.get(realPath)), "UTF-8");

            // 替换占位符
            String finalHtml = template.replace("<!-- BLOG_CONTENT -->", content);

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
}
