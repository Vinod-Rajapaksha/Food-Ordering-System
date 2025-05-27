package com.model;

public class Admin {
    private int AdminId;
    private String email;
    private String password;

    public Admin() {}

    public Admin(int adminId, String email, String password) {
        AdminId = adminId;
        this.email = email;
        this.password = password;
    }

    public int getAdminId() {
        return AdminId;
    }

    public void setAdminId(int adminId) {
        AdminId = adminId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}