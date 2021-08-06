/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import cart.CartBean;
import cart.CartProduct;
import dbhelpers.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

/**
 *
 * @author huynp
 */
public class OrderDAO implements Serializable {

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

    public boolean checkOut(String name, String phone, String address, String userId, CartBean cart, String email) throws SQLException, Exception {
        DBContext db = new DBContext();
        conn = db.getConnection();
        if (conn != null) {
            String sql = "insert into [PRJ301_SE07D_Group7].[dbo].[Orders] values (?,?,?,?,?,?) \n Select Scope_Identity() ";
            stm = conn.prepareStatement(sql, stm.RETURN_GENERATED_KEYS);
            stm.setString(1, email);
            stm.setString(2, userId);
            stm.setString(3, address);
            stm.setString(4, phone);
            stm.setDouble(5, getTotal(cart));
            stm.setString(6, name);
            int affectedRows = stm.executeUpdate();

            if (affectedRows != 0) {
                ResultSet generatedKeys = stm.getGeneratedKeys();

                if (generatedKeys.next()) {
                    int orderId = generatedKeys.getInt(1);
                    for (Map.Entry<Integer, CartProduct> entry : cart.entrySet()) {
                        String sqlDetail = "insert into OrderDetail values (?,?,?,?)";
                        stm = conn.prepareStatement(sqlDetail);
                        stm.setInt(1, orderId);
                        stm.setInt(2, entry.getKey());
                        stm.setInt(3, entry.getValue().getQuantity());
                        stm.setDouble(4, entry.getValue().getPrice());
                        int result = stm.executeUpdate();
                        if (result < 0) {
                            return false;
                        }
                        sqlDetail = "  update Product set Quantity = Quantity - ? where id = ?  ";
                        stm = conn.prepareStatement(sqlDetail);
                        stm.setInt(1, entry.getValue().getQuantity());
                        stm.setInt(2, entry.getKey());
                        result = stm.executeUpdate();
                        if (result < 0) {
                            return false;
                        }
                    }
                }
            } else {
                return false;
            }

        }
        closeConnection();
        return true;
    }

    public double getTotal(CartBean cart) {
        double total = 0;
        for (Map.Entry<Integer, CartProduct> entry : cart.entrySet()) {
            total += entry.getValue().getQuantity() * entry.getValue().getPrice();
        }
        return total;
    }
}
