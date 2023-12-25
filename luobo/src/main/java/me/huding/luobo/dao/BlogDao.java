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
    public int updateById(Blog blog) throws SQLException{
        int result=0;
        String sql = "UPDATE blog SET title=?,blogAbstract=?,blogAbstractText=?,content=?,categoryID=?,publishTime=?,lastUpdateTime=?,coverURL=?,html=?,tags=? WHERE id = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,blog.getTitle());
            pstmt.setString(2,blog.getBlogAbstract());
            pstmt.setString(3,blog.getBlogAbstractText());
            pstmt.setString(4,blog.getContent());
            pstmt.setString(5,blog.getCategoryID());
            pstmt.setTimestamp(6,blog.getPublishTime());
            pstmt.setTimestamp(7,blog.getLastUpdateTime());
            pstmt.setString(8,blog.getCoverURL());
            pstmt.setString(9,blog.getHtml());
            pstmt.setString(10,blog.getTags());
            pstmt.setString(11,blog.getId());
            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public int deleteById(String id) throws  SQLException{
        int result=0;
        String sql = "DELETE FROM blog WHERE id = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,id);
            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public int insert(Blog blog) throws SQLException {
        int result=0;
        String sql = "INSERT INTO blog VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pstmt.setInt(18,0);
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
             PreparedStatement pstmt = conn.prepareStatement("SELECT id,title,blogAbstract,publishTime,coverURL,tags,readNum,commentNum,path from blog WHERE status = 0 order by publishTime desc "
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

    public List<Blog> findforBlogTable() throws SQLException {
        List<Blog> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();

             PreparedStatement pstmt = conn.prepareStatement("SELECT b.id,b.title,b.blogAbstract,b.publishTime,b.coverURL,b.tags,b.readNum,b.commentNum,b.path,b.lunbo,c.name from blog as b  LEFT JOIN category as c  on c.id = b.categoryID order by publishTime desc "
             );
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Blog data = new Blog();
                data.setId(rs.getString("b.id"));
                data.setTitle(rs.getString("b.title"));
                data.setBlogAbstract(rs.getString("b.blogAbstract"));
                data.setPublishTime(rs.getTimestamp("b.publishTime"));
                data.setCoverURL(rs.getString("b.coverURL"));
                data.setTags(rs.getString("b.tags"));
                data.setReadNum(rs.getInt("b.readNum"));
                data.setCommentNum(rs.getInt("b.commentNum"));
                data.setPath(rs.getString("b.path"));
                data.setCategoryID(rs.getString("c.name"));
                data.setLunbo(rs.getInt("b.lunbo"));
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

    public Blog selectById(String id) throws SQLException{
        Blog blog = new Blog();
        String sql = "SELECT * from blog as b  where id = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)
            ) {
            pstmt.setString(1,id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Blog data = new Blog();
                data.setId(rs.getString("id"));
                data.setContent(rs.getString("content"));
                data.setTitle(rs.getString("title"));
                data.setBlogAbstract(rs.getString("blogAbstract"));
                data.setBlogAbstractText(rs.getString("blogAbstractText"));
                data.setPublishTime(rs.getTimestamp("publishTime"));
                data.setCoverURL(rs.getString("coverURL"));
                data.setTags(rs.getString("tags"));
                data.setReadNum(rs.getInt("readNum"));
                data.setCommentNum(rs.getInt("commentNum"));
                data.setPath(rs.getString("path"));
                data.setLunbo(rs.getInt("lunbo"));
                data.setCategoryID(rs.getString("categoryID"));
                blog = data;
            }
        }
        return blog;
    }

    public int updateLunbo(Blog blog) throws SQLException{
        int result=0;
        String sql = "UPDATE blog SET lunbo = ? where id = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,blog.getLunbo());
            pstmt.setString(2,blog.getId());
            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
