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

	
	public void setWaterId(int waterId) {
		this.waterId=waterId;
	}
	
	public int getWaterId() {
		return waterId;
	}
	
	public void setUserId(int user_id) {
		this.user_id=user_id;
	}
	
	public int getUserId() {
		return user_id;		
	}

	public void setYear(int year) {
		this.year=year;
	}
	
	public int getYear() {
		return year;
	}
	
	public void setMonth(int month) {
		this.month=month;
	}
	
	public int getMonth() {
		return month;
	}

	public void setWaterConsumption(double water_consumption) {
	    this.water_consumption = water_consumption;
	}

	
	public double getWaterConsumption() {
		return water_consumption;
	}
	
	public void setCarbonFootprint(double carbon_footprint) {
		this.carbon_footprint=carbon_footprint;
	}
	
	public double getCarbonFootprint() {
		return carbon_footprint;
	}
	
	public void setStatus(String status) {
		this.status=status;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setWaterProof(byte[]water_proof) {
		this.water_proof=water_proof;
	}
	
	public byte[] getWaterProof() {
		return water_proof;
	}
	
	
}
