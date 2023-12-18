package me.huding.luobo.dao;

import me.huding.luobo.entity.youlian;
import me.huding.luobo.utils.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class youlianDao {
    public List<youlian> selectAll() throws SQLException {
        List<youlian> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM youlian");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                youlian data = new youlian(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp("cdate"));
                // 设置data的属性
                result.add(data);
            }
        }
        return result;
    }
}
