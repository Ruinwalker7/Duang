package me.huding.luobo.dao;


import me.huding.luobo.entity.User;
import me.huding.luobo.utils.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    public User selectById(long id){
        User user = null;
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM user where id = "+id);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                user = new User(rs.getLong(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public User selectByUsername(String username){
        User user = null;
        try (Connection conn = DruidUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM user where username = ? "))
        {
             pstmt.setString(1,username);
             try(ResultSet rs = pstmt.executeQuery()){
                 while (rs.next()) {
                     user = new User(rs.getLong(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5));
                 }
             }

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
        return user;
    }
}
