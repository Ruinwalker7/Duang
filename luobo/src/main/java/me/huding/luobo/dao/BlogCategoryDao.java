package me.huding.luobo.dao;

import me.huding.luobo.entity.BlogCategory;
import me.huding.luobo.utils.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogCategoryDao {

    public List<BlogCategory> selectAll() throws SQLException {
        List<BlogCategory> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM category");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                BlogCategory data = new BlogCategory(rs.getString(1), rs.getString(2), rs.getTimestamp(3),rs.getInt(4),rs.getString(5),rs.getInt(6));
                // 设置data的属性
                result.add(data);
            }
        }
        return result;
    }

}
