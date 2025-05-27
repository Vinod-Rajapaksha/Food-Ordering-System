package com.model;

public class Review {
    private int id;
    private int userId;
    private int orderid;
    private String comment;
    private int rating;
    private String reviewDate;

    public Review() {}

    public Review(int id, int userId, int orderid, String comment, int rating, String reviewDate) {
        this.id = id;
        this.userId = userId;
        this.orderid = orderid;
        this.comment = comment;
        this.rating = rating;
        this.reviewDate = reviewDate;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getOrderId() { return orderid; }
    public void setOrderId(int bookingId) { this.orderid = bookingId; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getReviewDate() { return reviewDate; }
    public void setReviewDate(String reviewDate) { this.reviewDate = reviewDate; }
}
