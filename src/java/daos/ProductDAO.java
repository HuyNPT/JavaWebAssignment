/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dbhelpers.DBContext;
import dtos.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author huynp
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ProductDTO> getAllProduct() {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from Product where isDelete = 0 and quantity >0";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> getAllProductByCategory(String id) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from Product where brandId = ? and isDelete = 0 and quantity >0 ";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ProductDTO getAllProductById(String id) {

        String query = "select * from Product JOIN Brand ON Product.BrandId=Brand.BrandId where Id = ? and quantity >=0";
        ProductDTO result = null;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                result = new ProductDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                result.setBrandName(rs.getString("BrandId"));
            }
        } catch (Exception e) {

        }
        return result;
    }

    public List<ProductDTO> getAllProductByName(String key) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from Product where name like ? and isDelete = 0 and quantity >0";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> getProductBrand() {
        List<ProductDTO> list = new ArrayList<>();
        String query = "SELECT  [Id]\n"
                + "      ,[Name]\n"
                + "      ,[Imgurl]\n"
                + "      ,[Price]\n"
                + "      ,[Title]\n"
                + "      ,[Description]\n"
                + "      ,[Quantity],Brand.BrandName\n"
                + "FROM Product\n"
                + "INNER JOIN Brand ON Product.BrandId=Brand.BrandId where isDelete = 0 and quantity >=0";
        ProductDTO result = null;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                result = new ProductDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                result.setBrandName(rs.getString(8));
                list.add(result);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean DeleteProductById(int id) {
        String sql = "  update Product set  isDelete  = 1 where id = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {

        }
        return true;
    }

    public boolean UpdateProduct(int id, String name, String description, String title, String image, float price, int brandId, int quantity) {
        String sql = " Update Product set [Product].Name = ? , Title = ?, Description = ?,Imgurl = ?, Price = ?, BrandId = ?,Quantity=? where id = ?";
        String sqlWithoutImage = " Update Product set [Product].Name = ? , Title = ?, Description = ?, Price = ?, BrandId = ?,Quantity=? where id = ?";
        try {
            conn = new DBContext().getConnection();
            if (!image.equals("images/")) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, title);
                ps.setString(3, description);
                ps.setString(4, image);
                ps.setFloat(5, price);
                ps.setInt(6, brandId);
                ps.setInt(7, quantity);
                ps.setInt(8, id);

            } else {
                ps = conn.prepareStatement(sqlWithoutImage);
                ps.setString(1, name);
                ps.setString(2, title);
                ps.setString(3, description);
                ps.setFloat(4, price);
                ps.setInt(5, brandId);
                ps.setInt(6, quantity);
                ps.setInt(7, id);
            }
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return true;

    }

    public boolean AddProduct(String name, String description, String title, String image, float price, int brandId, int quantity) {
        String sql = "  Insert into [PRJ301_SE07D_Group7].[dbo].[Product] values (?,\n"
                + "  ?\n"
                + "  ,?,?,?,?,?,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setFloat(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setInt(6, quantity);
            ps.setInt(7, brandId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {

        }
        return true;
    }

//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        List<ProductDTO> list = dao.getProductBrand();
//        for (ProductDTO o : list) {
//            System.out.println(o);
//        }
//    }
}
