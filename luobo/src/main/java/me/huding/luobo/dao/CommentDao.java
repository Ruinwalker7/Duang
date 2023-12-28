package me.huding.luobo.dao;

import me.huding.luobo.entity.Blog;
import me.huding.luobo.entity.Comment;
import me.huding.luobo.entity.Lunbo;
import me.huding.luobo.utils.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
    public Comment selectById(String id) throws SQLException{
        Comment comment = new Comment();
        String sql = "SELECT * from comment  where id = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1,id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment data = new Comment();
                data.setId(rs.getString("id"));
                data.setContent(rs.getString("content"));
                data.setStatus(rs.getInt("status"));
//                data.setBlogAbstract(rs.getString("blogAbstract"));
//                data.setBlogAbstractText(rs.getString("blogAbstractText"));
//                data.setPublishTime(rs.getTimestamp("publishTime"));
//                data.setCoverURL(rs.getString("coverURL"));
//                data.setTags(rs.getString("tags"));
//                data.setReadNum(rs.getInt("readNum"));
//                data.setCommentNum(rs.getInt("commentNum"));
//                data.setPath(rs.getString("path"));
//                data.setLunbo(rs.getInt("lunbo"));
//                data.setCategoryID(rs.getString("categoryID"));
                comment = data;
            }
        }
        return comment;
    }

    public int deleteById(String id){
        int result=0;
        String sql = "DELETE FROM comment where id = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, id);
            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            return result;
        }
    }
    public int updateStatueById(Comment comment) throws SQLException{
        int result=0;
        String sql = "UPDATE comment set status = ? where id = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setInt(1,comment.getStatus());
            pstmt.setString(2,comment.getId());

            result = pstmt.executeUpdate();
        }
        return result;
    }
    public int insert(Comment comment){
        int result=0;
        String sql = "INSERT INTO comment VALUES (?,?,?,?,?,?)";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,comment.getId());
            pstmt.setString(2,comment.getNickname());
            pstmt.setString(3,comment.getContent());
            pstmt.setTimestamp(4,comment.getCdate());
            pstmt.setString(5,comment.getBlogId());
            pstmt.setInt(6,1);
            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Comment> findAll() {
        List<Comment> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();

             PreparedStatement pstmt = conn.prepareStatement("SELECT * from comment ORDER BY cdate DESC" );
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getString("id"));
                comment.setNickname(rs.getString("nickname"));
                comment.setCdate(rs.getTimestamp("cdate"));
                comment.setContent(rs.getString("content"));
                comment.setStatus(rs.getInt("status"));
                comment.setBlogId(rs.getString("blogId"));
                result.add(comment);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Comment> findAllWithName() {
        List<Comment> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();

             PreparedStatement pstmt = conn.prepareStatement("SELECT c.* ,blog.title from comment as c  left join blog ON blog.id = c.blogId ORDER BY cdate DESC" );
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getString("c.id"));
                comment.setNickname(rs.getString("c.nickname"));
                comment.setCdate(rs.getTimestamp("c.cdate"));
                comment.setContent(rs.getString("c.content"));
                comment.setStatus(rs.getInt("c.status"));
                comment.setBlogId(rs.getString("c.blogId"));
                comment.setBlogName(rs.getString("blog.title"));
                result.add(comment);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Comment> findByBlogId(String id) {
        List<Comment> result = new ArrayList<>();
        String sql = "SELECT * from comment WHERE blogId = ? and status = 1 ORDER BY cdate ";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ) {
            pstmt.setString(1,id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getString("id"));
                comment.setNickname(rs.getString("nickname"));
                comment.setCdate(rs.getTimestamp("cdate"));
                comment.setContent(rs.getString("content"));
                result.add(comment);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
