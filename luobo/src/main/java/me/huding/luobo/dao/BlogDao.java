package me.huding.luobo.dao;

import me.huding.luobo.entity.Blog;
import me.huding.luobo.utils.DruidUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDao {

    public int insert(Blog blog) throws SQLException {
        int result=0;
        String sql = "INSERT INTO blog VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,blog.getId());
            pstmt.setString(2,blog.getTitle());
            pstmt.setString(3,blog.getBlogAbstract());
            pstmt.setString(4,blog.getBlogAbstractText());
            pstmt.setString(5,blog.getContent());
            pstmt.setInt(6,0);
            pstmt.setInt(7,0);
            pstmt.setInt(8,0);
            pstmt.setInt(9,0);
            pstmt.setString(10,blog.getCategoryID());
            pstmt.setTimestamp(11,blog.getPublishTime());
            pstmt.setTimestamp(12,blog.getLastUpdateTime());
            pstmt.setString(13,blog.getPath());
            pstmt.setString(14,blog.getCoverURL());
            pstmt.setInt(15,blog.getStatus());
            pstmt.setString(16,blog.getHtml());
            pstmt.setString(17,blog.getTags());
            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Blog> findLunbo() throws SQLException {
        List<Blog> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();

             PreparedStatement pstmt = conn.prepareStatement("SELECT id,title, path, coverURL from blog WHERE status = 0 and coverURL is not null order by publishTime desc limit 6"
                     );
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Blog data = new Blog();
                data.setId(rs.getString(1));
                data.setTitle(rs.getString(2));
                data.setPath(rs.getString(3));
                data.setCoverURL(rs.getString(4));
                result.add(data);
            }
        }
        return result;
    }

    public List<Blog> findforIndex() throws SQLException {
        List<Blog> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();

             PreparedStatement pstmt = conn.prepareStatement("SELECT id,title,blogAbstract,publishTime,coverURL,tags,readNum,commentNum,path from blog WHERE status = 0 order by publishTime desc limit 6"
             );
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Blog data = new Blog();
                data.setId(rs.getString("id"));
                data.setTitle(rs.getString("title"));
                data.setBlogAbstract(rs.getString("blogAbstract"));
                data.setPublishTime(rs.getTimestamp("publishTime"));
                data.setCoverURL(rs.getString("coverURL"));
                data.setTags(rs.getString("tags"));
                data.setReadNum(rs.getInt("readNum"));
                data.setCommentNum(rs.getInt("commentNum"));
                data.setPath(rs.getString("path"));
                result.add(data);
            }
        }
        return result;
    }


    public List<Blog> findHot() throws SQLException {
        List<Blog> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("select id,title,url,readNum,commentNum,heartNum from blog order by readNum DESC,commentNum DESC,heartNum DESC LIMIT 5");
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Blog data = new Blog();
                data.setId(rs.getString(1));
                data.setTitle(rs.getString(2));
                data.setPath(rs.getString(3));
                data.setCoverURL(rs.getString(4));
                result.add(data);
            }
        }
        return result;
    }

}
