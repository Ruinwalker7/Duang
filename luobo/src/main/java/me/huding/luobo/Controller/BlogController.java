package me.huding.luobo.Controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import me.huding.luobo.config.ResConsts;
import me.huding.luobo.dao.BlogCategoryDao;
import me.huding.luobo.dao.BlogDao;
import me.huding.luobo.dao.BlogTagsDao;
import me.huding.luobo.dao.LunboDao;
import me.huding.luobo.entity.Blog;
import me.huding.luobo.entity.BlogCategory;
import me.huding.luobo.entity.BlogTags;
import me.huding.luobo.entity.Lunbo;
import me.huding.luobo.utils.BlogUtil;
import me.huding.luobo.utils.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;


@WebServlet("/blog/*")
public class BlogController extends HttpServlet {
    private final BlogCategoryDao blogCategoryDao = new BlogCategoryDao();

    private final BlogTagsDao blogTagsDao = new BlogTagsDao();

    private final BlogDao blogDao = new BlogDao();

    private final LunboDao lunboDao = new LunboDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        Result result;
        if (pathInfo == null || pathInfo.equals("/")) {
            result = new Result(ResConsts.Code.FAILURE,ResConsts.Msg.SERVER_ERROR,null);
            String json = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (pathInfo.equals("/category")) {
            try {
                List<BlogCategory> data = blogCategoryDao.selectAll();
                result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        } else if (pathInfo.equals("/blogTags")) {
            try {
                List<BlogTags> data = blogTagsDao.selectAll();
                result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        }  else if (pathInfo.equals("/lunbo")) {
            try {
                List<Lunbo> data = lunboDao.selectAll();
                result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        } else if (pathInfo.equals("/hotRank")) {
            try {
                List<Blog> data = blogDao.findHot();
                result = new Result(ResConsts.Code.OK,"",data);
                String json = new Gson().toJson(result);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (SQLException e) {
                throw new ServletException("Database access error", e);
            }
        }else if (pathInfo.equals("/create")) {
            request.setCharacterEncoding("UTF-8");
            UUID uuid = UUID.randomUUID();
            String uuidWithoutDashes = uuid.toString().replace("-", "");
            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm").create();
            StringBuilder buffer = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            String jsonData = buffer.toString();
            Blog blog  = gson.fromJson(jsonData,Blog.class);
            System.out.println("'"+blog.getId()+"'");
            if(blog.getId().isBlank()){
                blog.setId(uuidWithoutDashes);
                System.out.println(blog);
                String url = BlogUtil.createBlogPost(getServletContext(),blog,blog.getId(),blog.getPublishTime());
                if(url!=null){
                    blog.setPath(url);
                    int resultnum = 0;
                    try {
                        resultnum = blogDao.insert(blog);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    if(resultnum==1){
                        result = new Result(ResConsts.Code.SUCCESS,"",null);
                    }else{
                        result = new Result(ResConsts.Code.FAILURE,"无法创建博客",null);
                    }
                }else{
                    result = new Result(ResConsts.Code.FAILURE,"无法创建博客",null);
                }
            }else{
                try {
                    Blog origin = blogDao.selectById(blog.getId());
                    blog.setPath(origin.getPath());
                    int rows=blogDao.updateById(blog);
                    BlogUtil.updateBlogFile(getServletContext(),blog);
                    if(rows!=0){
                        result = new Result(ResConsts.Code.SUCCESS,"",null);

                    }else{
                        result = new Result(ResConsts.Code.FAILURE,"无法更新博客",null);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    result = new Result(ResConsts.Code.SUCCESS,"",null);
                }
            }

            String json = new Gson().toJson(result);
            System.out.println(json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }  else {
            // 处理其他情况或返回错误
            result = new Result(ResConsts.Code.FAILURE,ResConsts.Msg.SERVER_ERROR,null);
            System.out.println("不可用资源");
            String json = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }
}
