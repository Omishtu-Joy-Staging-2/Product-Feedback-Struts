package com.feedback.model;

import java.util.List;

public class ProductList {
    private int id;
    private String name;
    private String sku;
    private String category;
    private String brand;
    private String description;
    private String thumbnail;
    private String specifications;
    private String status;
    private List<String> galleryImages;

    private Double averageRating; // Nullable – if no feedback
    private int feedbackCount;

    // ====== Constructors ======
    public ProductList() {
    }
    

    public ProductList(int id, String name, String sku, String category, String brand,
                       String description, String thumbnail, String specifications, String status,
                       Double averageRating, int feedbackCount) {
        this.id = id;
        this.name = name;
        this.sku = sku;
        this.category = category;
        this.brand = brand;
        this.description = description;
        this.thumbnail = thumbnail;
        this.specifications = specifications;
        this.status = status;
        this.averageRating = averageRating;
        this.feedbackCount = feedbackCount;
    }

    // ====== Getters and Setters ======
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(Double averageRating) {
        this.averageRating = averageRating;
    }

    public int getFeedbackCount() {
        return feedbackCount;
    }

    public void setFeedbackCount(int feedbackCount) {
        this.feedbackCount = feedbackCount;
    }



    public List<String> getGalleryImages() {
        return galleryImages;
    }
    public void setGalleryImages(List<String> galleryImages) {
        this.galleryImages = galleryImages;
    }
	
}
