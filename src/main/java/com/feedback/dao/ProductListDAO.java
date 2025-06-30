package com.feedback.dao;

import com.feedback.model.ProductList;
import com.feedback.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductListDAO {
	
	private List<String> getGalleryImages(int productId) {
	    List<String> images = new ArrayList<>();
	    String sql = "SELECT image_path FROM product_images WHERE product_id = ?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, productId);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            images.add(rs.getString("image_path"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return images;
	}

	public void setGalleryImages(List<String> galleryImages) {
	}


    public List<ProductList> getAllProducts() {
        List<ProductList> productList = new ArrayList<>();

        String query = """
            SELECT p.*, 
                   ROUND(AVG(f.rating), 1) AS average_rating,
                   COUNT(f.id) AS feedback_count
            FROM products p
            LEFT JOIN feedback f ON p.id = f.product_id
            GROUP BY p.id
            ORDER BY p.id DESC
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ProductList product = new ProductList();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setSku(rs.getString("sku"));
                product.setCategory(rs.getString("category"));
                product.setBrand(rs.getString("brand"));
                product.setDescription(rs.getString("description"));
                product.setThumbnail(rs.getString("thumbnail"));
                product.setSpecifications(rs.getString("specifications"));
                product.setStatus(rs.getString("status"));
                product.setGalleryImages(getGalleryImages(product.getId()));

                product.setAverageRating(rs.getDouble("average_rating"));
                product.setFeedbackCount(rs.getInt("feedback_count"));

                productList.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
}
