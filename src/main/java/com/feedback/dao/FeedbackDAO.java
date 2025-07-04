package com.feedback.dao;

import com.feedback.model.Feedback;
import com.feedback.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, Integer> getMonthlyFeedbackCounts() {
        Map<String, Integer> monthlyData = new LinkedHashMap<>();
        String sql = """
            SELECT DATE_FORMAT(created_at, '%b') AS month, COUNT(*) AS count
            FROM feedback
            GROUP BY MONTH(created_at)
            ORDER BY MONTH(created_at)
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String month = rs.getString("month");
                int count = rs.getInt("count");
                monthlyData.put(month, count);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return monthlyData;
    }
    public Map<String, Integer> getFeedbackStatusCounts() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT status, COUNT(*) AS count FROM feedback GROUP BY status";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                result.put(rs.getString("status"), rs.getInt("count"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
 // Get total number of feedbacks
    public int getTotalFeedbackCount() {
        String sql = "SELECT COUNT(*) FROM feedback";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get average rating
    public double getAverageRating() {
        String sql = "SELECT AVG(rating) FROM feedback";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) return rs.getDouble(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
 // In FeedbackDAO.java
    public List<Map<String, Object>> getTopFeedbackedProducts() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = """
            SELECT p.name, 
                   ROUND(AVG(f.rating), 1) AS avg_rating, 
                   COUNT(f.id) AS count
            FROM feedback f
            JOIN products p ON f.product_id = p.id
            GROUP BY f.product_id
            ORDER BY count DESC
            LIMIT 5
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("name", rs.getString("name"));
                row.put("avg_rating", rs.getDouble("avg_rating"));
                row.put("count", rs.getInt("count"));
                result.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }




}
