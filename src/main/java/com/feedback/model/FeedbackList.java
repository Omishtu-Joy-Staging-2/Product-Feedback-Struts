package com.feedback.model;

import java.sql.Timestamp;

public class FeedbackList {
    private String id;
    private int rating;
    private String comments;
    private String status;
    private Timestamp createdAt;
    private String email;
    private boolean allowContact;
    private String adminResponse;
    private String productName;
    private String category;
    private String userEmail;

    // ====== Getters and Setters ======

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    public String getEmail() { return email; }
    
    public void setEmail(String email) { this.email = email; }

    public boolean isAllowContact() { return allowContact; }
    public void setAllowContact(boolean allowContact) { this.allowContact = allowContact; }

    public String getAdminResponse() { return adminResponse; }
    public void setAdminResponse(String adminResponse) { this.adminResponse = adminResponse; }
}
