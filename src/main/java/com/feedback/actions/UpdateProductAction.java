package com.feedback.actions;

import com.feedback.dao.ProductDAO;
import com.feedback.model.Product;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateProductAction extends ActionSupport {
    private int id;
    private String name;
    private String sku;
    private String category;
    private String brand;
    private String description;
    private String specifications;
    private String status;

    public String execute() {
        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setSku(sku);
        product.setCategory(category);
        product.setBrand(brand);
        product.setDescription(description);
        product.setSpecifications(specifications);
        product.setStatus(status);

        boolean updated = ProductDAO.updateProduct(product);
        return updated ? SUCCESS : ERROR;
    }

    // Getters and setters (required for Struts to inject form data)
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setSku(String sku) { this.sku = sku; }
    public void setCategory(String category) { this.category = category; }
    public void setBrand(String brand) { this.brand = brand; }
    public void setDescription(String description) { this.description = description; }
    public void setSpecifications(String specifications) { this.specifications = specifications; }
    public void setStatus(String status) { this.status = status; }
}
