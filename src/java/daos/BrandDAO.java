/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dbhelpers.DBContext;
import dtos.BrandDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author huynp
 */
public class BrandDAO implements Serializable {

    Connection conn;
    PreparedStatement stm;
    ResultSet rs;
    List<BrandDTO> listItem;

    public List<BrandDTO> getListBrand() {
        return listItem;
    }

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

    public void getBrand() throws SQLException, Exception {
        try {
            DBContext db = new DBContext();
            conn = db.getConnection();
            if (conn != null) {
                String sql = "SELECT * from\n"
                        + "Brand";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    BrandDTO dto = new BrandDTO();
                    dto.setId(rs.getInt("BrandId"));
                    dto.setBrandName(rs.getString("BrandName"));
                    if (listItem == null) {
                        listItem = new ArrayList<>();
                    }
                    listItem.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
    }

}
