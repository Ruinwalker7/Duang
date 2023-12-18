package me.huding.luobo.dao;

import me.huding.luobo.entity.Notice;
import me.huding.luobo.utils.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {

    public List<Notice> selectAll() throws SQLException {
        List<Notice> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM notice");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Notice data = new Notice(rs.getString(1),rs.getString(2),rs.getTimestamp(3),rs.getTimestamp(4),rs.getBoolean(5));
                // 设置data的属性
                result.add(data);
            }
        }
        return result;
    }
}
