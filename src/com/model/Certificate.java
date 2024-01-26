package com.model;

public class Certificate {
    private int userId;
    private int year;
    private int month;


    public Certificate() {
    }

    public Certificate(int userId, int year, int month) {
        this.userId = userId;
        this.year = year;
        this.month = month;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }
}
