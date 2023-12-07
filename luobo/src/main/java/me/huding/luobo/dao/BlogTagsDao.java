package me.huding.luobo.dao;

import me.huding.luobo.entity.BlogTags;
import me.huding.luobo.utils.DruidUtil;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogTagsDao {
    private DruidUtil dataSource;

    public List<BlogTags> selectAll() throws SQLException{
        List<BlogTags> result = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM blog_tags");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                BlogTags data = new BlogTags(rs.getString(1), rs.getString(2));
                // 设置data的属性
                result.add(data);
            }
        }
        return result;
    }


//    public void select(String info) throws SQLException {
//        Connection conn = dataSource.getConnection();
//        String sql = "select * from blog_tags";
//        PreparedStatement pstam = conn.prepareStatement(sql);
//        ResultSet resultSet = pstam.executeQuery();
//        while (resultSet.next()) {
//            String id = resultSet.getString(1);
//            System.out.println(id);
//        }
//
//        dataSource.close(resultSet,conn,pstam);
//    }
}
