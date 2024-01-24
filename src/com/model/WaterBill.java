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
	
	public void setWaterId() {
		this.waterId=waterId;
	}
	

}
