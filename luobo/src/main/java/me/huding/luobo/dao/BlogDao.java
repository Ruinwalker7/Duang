package me.huding.luobo.dao;

import me.huding.luobo.entity.Blog;
import me.huding.luobo.entity.BlogCategory;
import me.huding.luobo.utils.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDao {


    public List<Blog> findLunbo() throws SQLException {
        List<Blog> result = new ArrayList<>();
        try (Connection conn = DruidUtil.getConnection();

             PreparedStatement pstmt = conn.prepareStatement("SELECT id,title,url,coverURL from blog WHERE type = 1 and status = 0 order by publishTime desc limit 6"
                     );
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Blog data = new Blog();
                data.setId(rs.getString(1));
                data.setTitle(rs.getString(2));
                data.setUrl(rs.getString(3));
                data.setCoverURL(rs.getString(4));
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
                data.setUrl(rs.getString(3));
                data.setCoverURL(rs.getString(4));
                result.add(data);
            }
        }
        return result;
    }

}
