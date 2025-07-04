package com.feedback.model;

public class Product {
  private int id;
  private String name;
  private String sku;
  private String category;
  private String brand;
  private String description;
  private String specifications;
  private String status;
  private String thumbnail;
  private String thumbnailFileName;
  
  private int feedbackCount;
  private double averageRating;

  // Getters
  public String getName() {
    return name;
  }

  public String getSku() {
    return sku;
  }

  public String getCategory() {
    return category;
  }

  public String getBrand() {
    return brand;
  }

  public String getDescription() {
    return description;
  }


  // Getters and Setters
  public int getFeedbackCount() { return feedbackCount; }

  public double getAverageRating() { return averageRating; }


  public String getSpecifications() {
      return specifications;
  }

  public String getThumbnail() {
    return thumbnail;
  }
  public int getId() {
	    return id;
	}

	public void setId(int id) {
	    this.id = id;
	}

	public void setFeedbackCount(int feedbackCount) { this.feedbackCount = feedbackCount; }
	public void setAverageRating(double averageRating) { this.averageRating = averageRating; }

  // Setters
  public void setName(String name) {
    this.name = name;
  }

  public void setSku(String sku) {
    this.sku = sku;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public void setBrand(String brand) {
    this.brand = brand;
  }

  public void setDescription(String description) {
    this.description = description;
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


  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }
 
}
