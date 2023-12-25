package me.huding.luobo.dao;

import me.huding.luobo.entity.Lunbo;
import me.huding.luobo.utils.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LunboDao {
    public List<Lunbo> selectAll() throws SQLException {
        List<Lunbo> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();

             PreparedStatement pstmt = conn.prepareStatement("SELECT * from lunbo" );
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Lunbo lunbo = new Lunbo();
                lunbo.setId(rs.getString(1));
                lunbo.setCoverImg(rs.getString(2));
                lunbo.setLink(rs.getString(3));
                lunbo.setBlogId(rs.getString(4));
                result.add(lunbo);
            }
        }
        return result;
    };

    public int insert(Lunbo lunbo) throws  SQLException{
        int result=0;
        String sql = "INSERT INTO lunbo VALUES (?,?,?,?)";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,lunbo.getId());
            pstmt.setString(2,lunbo.getCoverImg());
            pstmt.setString(3,lunbo.getLink());
            pstmt.setString(4,lunbo.getBlogId());

            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int deleteByBlogId(String id){
        int result=0;
        String sql = "DELETE FROM  lunbo WHERE blogId = ?";
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,id);

            result = pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
