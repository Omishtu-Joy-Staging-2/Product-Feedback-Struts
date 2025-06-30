package com.feedback.dao;

import com.feedback.model.Feedback;
import com.feedback.util.DBUtil;

import java.sql.*;

public class FeedbackDAO {

    public String generateFeedbackId() throws SQLException {
        String id = "FB-0001";
        String sql = "SELECT id FROM feedback ORDER BY created_at DESC LIMIT 1";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                String lastId = rs.getString("id");
                int num = Integer.parseInt(lastId.substring(3)) + 1;
                id = String.format("FB-%04d", num);
            }
        }
        return id;
    }

    public boolean saveFeedback(Feedback feedback) throws SQLException {
        String insertFeedbackSQL = "INSERT INTO feedback (id, product_id, user_id, rating, comments, status, created_at, email, allow_contact) " +
                                   "VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(insertFeedbackSQL)) {

            ps.setString(1, feedback.getId());
            ps.setInt(2, feedback.getProductId());

            if (feedback.getUserId() > 0) {
                ps.setInt(3, feedback.getUserId());
            } else {
                ps.setNull(3, java.sql.Types.INTEGER); // user_id is NULL if not logged in
            }

            ps.setInt(4, feedback.getRating());
            ps.setString(5, feedback.getComments());
            ps.setString(6, feedback.getStatus());
            ps.setString(7, feedback.getEmail());
            ps.setBoolean(8, feedback.getAllowContact());

            int rowsInserted = ps.executeUpdate();
            System.out.println("Inserted feedback rows: " + rowsInserted);
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error during feedback submission: " + e.getMessage());
            return false;
        }
    }

}
