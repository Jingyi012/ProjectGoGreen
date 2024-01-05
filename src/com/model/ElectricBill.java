package com.model;

public class ElectricBill {
	private int eid;
	private double electric_consumption;
	private byte[] electricBill_proof;
	private int year;
	private int month;
	private double carbon_footprint;
	private int user_id;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public double getElectric_consumption() {
		return electric_consumption;
	}
	public void setElectric_consumption(double electric_consumption) {
		this.electric_consumption = electric_consumption;
	}
	public byte[] getElectricBill_proof() {
		return electricBill_proof;
	}
	public void setElectricBill_proof(byte[] electricBill_proof) {
		this.electricBill_proof = electricBill_proof;
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public double getCarbon_footprint() {
		return carbon_footprint;
	}
	public void setCarbon_footprint(double carbon_footprint) {
		this.carbon_footprint = carbon_footprint;
	}
	
}
