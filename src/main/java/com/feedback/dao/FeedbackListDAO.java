package com.feedback.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.feedback.model.FeedbackList;
import com.feedback.util.DBUtil;

public class FeedbackListDAO{
	public List<FeedbackList> getAllFeedbacksWithDetails() {
	    List<FeedbackList> feedbacks = new ArrayList<>();
	    String sql = """
	        SELECT f.id, f.rating, f.comments, f.status, f.created_at,
	               p.name AS product_name, p.category,
	               u.email AS user_email
	        FROM feedback f
	        JOIN products p ON f.product_id = p.id
	        LEFT JOIN users u ON f.user_id = u.id
	        ORDER BY f.created_at DESC
	    """;

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            FeedbackList fb = new FeedbackList();
	            fb.setId(rs.getString("id"));
	            fb.setRating(rs.getInt("rating"));
	            fb.setComments(rs.getString("comments"));
	            fb.setStatus(rs.getString("status"));
	            fb.setCreatedAt(rs.getTimestamp("created_at"));

	            fb.setProductName(rs.getString("product_name"));
	            fb.setCategory(rs.getString("category"));
	            fb.setUserEmail(rs.getString("user_email") != null ? rs.getString("user_email") : "Guest");

	            feedbacks.add(fb);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return feedbacks;
	}
	public FeedbackList getFeedbackById(String id) {
	    FeedbackList fb = null;
	    

	    String sql = """
	        SELECT f.id, f.rating, f.comments, f.status, f.created_at,
	               f.email, f.allow_contact,
	               p.name AS product_name, p.category,
	               u.email AS user_email,
	               f.admin_response
	        FROM feedback f
	        JOIN products p ON f.product_id = p.id
	        LEFT JOIN users u ON f.user_id = u.id
	        WHERE f.id = ?
	    """;

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, id);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            fb = new FeedbackList();
	            fb.setId(rs.getString("id"));
	            fb.setRating(rs.getInt("rating"));
	            fb.setComments(rs.getString("comments"));
	            fb.setStatus(rs.getString("status"));
	            fb.setCreatedAt(rs.getTimestamp("created_at"));
	            fb.setEmail(rs.getString("email"));
	            fb.setAllowContact(rs.getBoolean("allow_contact"));
	            fb.setAllowContact(rs.getBoolean("allow_contact"));
	            fb.setAdminResponse(rs.getString("admin_response"));
	            fb.setProductName(rs.getString("product_name"));
	            fb.setCategory(rs.getString("category"));
	            fb.setUserEmail(rs.getString("user_email") != null ? rs.getString("user_email") : "Guest");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return fb;
	}
	public boolean updateAdminResponse(String feedbackId, String response, String status) {
	    String sql = "UPDATE feedback SET admin_response = ?, status = ? WHERE id = ?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, response);
	        ps.setString(2, status);
	        ps.setString(3, feedbackId);

	        int rows = ps.executeUpdate();
	        return rows > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}



}