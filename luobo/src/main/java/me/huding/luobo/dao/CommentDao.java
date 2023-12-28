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

             PreparedStatement pstmt = conn.prepareStatement("SELECT * from comment ORDER BY cadte DESC" );
             ResultSet rs = pstmt.executeQuery()) {

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

    public List<Comment> findByBlogId(String id) {
        List<Comment> result = new ArrayList<>();
        String sql = "SELECT * from comment WHERE blogId = ? ORDER BY cdate ";
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
