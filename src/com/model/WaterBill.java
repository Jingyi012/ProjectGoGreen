package com.model;

public class WaterBill {
	private int waterId;
	private int user_id;
	private int year;
	private int month;
	private double water_consumption;
	private double carbon_footprint;
	private String status;
	private byte[] water_proof;
	
	public int getWaterId() {
		return waterId;
	}
	public void setWaterId(int waterId) {
		this.waterId = waterId;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	public double getWater_consumption() {
		return water_consumption;
	}
	public void setWater_consumption(double water_consumption) {
		this.water_consumption = water_consumption;
	}
	public double getCarbon_footprint() {
		return carbon_footprint;
	}
	public void setCarbon_footprint(double carbon_footprint) {
		this.carbon_footprint = carbon_footprint;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public byte[] getWater_proof() {
		return water_proof;
	}
	public void setWater_proof(byte[] water_proof) {
		this.water_proof = water_proof;
	}
	
}
