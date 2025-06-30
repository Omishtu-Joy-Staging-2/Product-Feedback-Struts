package com.feedback.actions;

import com.feedback.dao.UserDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

import java.util.Map;

public class LoginAction extends ActionSupport {
    private String email;
    private String password;

    public String execute() {
        if (UserDAO.validateUser(email, password)) {
            int userId = UserDAO.getUserIdByEmail(email);
            String role = UserDAO.getUserRole(email);

            Map<String, Object> session = ActionContext.getContext().getSession();
            session.put("user", email);
            session.put("role", role);
            session.put("userId", userId);

            // Redirect based on role
            if ("admin".equalsIgnoreCase(role)) {
                return "admin";
            } else {
                return "user";
            }
        } else {
            addActionError("Invalid email or password");
            return ERROR;
        }
    }

    // Getters and setters
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
