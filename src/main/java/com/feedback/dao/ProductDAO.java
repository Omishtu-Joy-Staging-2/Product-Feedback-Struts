package com.feedback.dao;

import com.feedback.model.Product;

import com.feedback.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

  public static int saveProduct(Product product) {
    String sql = "INSERT INTO products (name, sku, category, brand, description,specifications, thumbnail) VALUES (?, ?, ?, ?, ?, ?,?)";
    int productId = -1;

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
      
      stmt.setString(1, product.getName());
      stmt.setString(2, product.getSku());
      stmt.setString(3, product.getCategory());
      stmt.setString(4, product.getBrand());
      stmt.setString(5, product.getDescription());
      stmt.setString(6, product.getSpecifications());
      stmt.setString(7, product.getThumbnail());

      

      int affectedRows = stmt.executeUpdate();

      if (affectedRows > 0) {
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
          productId = rs.getInt(1);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    return productId;
  }

  public static void saveGalleryImages(int productId, List<String> imagePaths) {
    String sql = "INSERT INTO product_images (product_id, image_path) VALUES (?, ?)";

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

      for (String path : imagePaths) {
        stmt.setInt(1, productId);
        stmt.setString(2, path);
        stmt.addBatch();
      }
      stmt.executeBatch();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  public static List<Product> getAllProducts() {
	    List<Product> products = new ArrayList<>();
	    String sql = "SELECT * FROM products";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            Product p = new Product();
	            p.setId(rs.getInt("id"));
	            p.setName(rs.getString("name"));
	            p.setSku(rs.getString("sku"));
	            p.setCategory(rs.getString("category"));
	            p.setBrand(rs.getString("brand"));
	            p.setDescription(rs.getString("description"));
	            p.setSpecifications(rs.getString("specifications"));
	            p.setThumbnail(rs.getString("thumbnail"));
	            p.setStatus(rs.getString("status"));
	            products.add(p);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return products;
	}
  public static Product getProductById(int id) {
	    Product p = null;
	    String sql = "SELECT * FROM products WHERE id = ?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, id);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            p = new Product();
	            p.setId(rs.getInt("id"));
	            p.setName(rs.getString("name"));
	            p.setSku(rs.getString("sku"));
	            p.setCategory(rs.getString("category"));
	            p.setBrand(rs.getString("brand"));
	            p.setDescription(rs.getString("description"));	
	            p.setSpecifications(rs.getString("specifications"));
	            p.setStatus(rs.getString("status"));
	            p.setThumbnail(rs.getString("thumbnail"));
	            // Add more if needed
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return p;
	}
  public static boolean updateProduct(Product product) {
	    String baseSQL = "UPDATE products SET name=?, sku=?, category=?, brand=?, description=?, specifications=?, status=?";
	    boolean hasThumbnail = product.getThumbnail() != null && !product.getThumbnail().isEmpty();

	    String sql = hasThumbnail ? baseSQL + ", thumbnail=? WHERE id=?" : baseSQL + " WHERE id=?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, product.getName());
	        stmt.setString(2, product.getSku());
	        stmt.setString(3, product.getCategory());
	        stmt.setString(4, product.getBrand());
	        stmt.setString(5, product.getDescription());
	        stmt.setString(6, product.getSpecifications());
	        stmt.setString(7, product.getStatus());

	        int paramIndex = 8;
	        if (hasThumbnail) {
	            stmt.setString(8, product.getThumbnail());
	            paramIndex = 9;
	        }

	        stmt.setInt(paramIndex, product.getId());
	        return stmt.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}

  public static boolean deleteProduct(int productId) {
	    boolean success = false;

	    String deleteImagesSQL = "DELETE FROM product_images WHERE product_id = ?";
	    String deleteProductSQL = "DELETE FROM products WHERE id = ?";

	    try (Connection conn = DBUtil.getConnection()) {
	        conn.setAutoCommit(false); // transaction begin

	        try (PreparedStatement imgStmt = conn.prepareStatement(deleteImagesSQL);
	             PreparedStatement prodStmt = conn.prepareStatement(deleteProductSQL)) {

	            imgStmt.setInt(1, productId);
	            imgStmt.executeUpdate();

	            prodStmt.setInt(1, productId);
	            int affected = prodStmt.executeUpdate();

	            conn.commit();
	            success = affected > 0;
	        } catch (Exception e) {
	            conn.rollback();
	            e.printStackTrace();
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    return success;
	}



}

