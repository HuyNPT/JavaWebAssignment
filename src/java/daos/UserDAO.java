/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dbhelpers.DBContext;
import dtos.UserDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author huynp
 */
public class UserDAO implements Serializable {

    Connection conn;
    PreparedStatement stm;
    ResultSet rs;

    public void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public UserDTO CheckLogin(String userName, String password) throws SQLException {
        UserDTO result = null;
        DBContext db = new DBContext();
        conn = db.getConnection();
        if (conn != null) {
            String sql = "select * from [dbo].[User] where id = ? and password = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                result = new UserDTO();
                result.setUserName(userName);
                result.setFullName(rs.getString("name"));
                result.setRole(rs.getInt("role"));
            }
        }
        return result;
    }

    public boolean CheckDuplicateUsername(String userName) throws SQLException {
        String sql = "  select * from [PRJ301_SE07D_Group7].[dbo].[User] where Id = ?";
        DBContext db = new DBContext();
        conn = db.getConnection();
        if (conn != null) {
            stm = conn.prepareStatement(sql);
            stm.setString(1, userName);

            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    public void CreateNewAccount(UserDTO dto) throws SQLException, Exception {
        String sql = " insert into [Assignment].[dbo].[User] values (?,?,?,?)";
        DBContext db = new DBContext();
        conn = db.getConnection();
        if (conn != null) {
            stm = conn.prepareStatement(sql);
            stm.setString(1, dto.getUserName());
            stm.setString(2, dto.getFullName());
            stm.setString(3, dto.getPassword());
            stm.setInt(4, dto.getRole());
            stm.executeUpdate();
        }
        closeConnection();

    }

//    public static void main(String[] args) throws SQLException {
//        UserDAO dao = new UserDAO();
//        UserDTO dto = dao.CheckLogin("huynpt", "1234");
//        System.out.println(dto);
//    }
}
