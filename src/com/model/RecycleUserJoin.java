package com.model;

public class RecycleUserJoin {
	private int rid;
	private double recycle_weight;
	private byte[] recycleBill_proof;
	private double carbon_footprint;
	private int year;
	private int month;
	private int user_id;
	private String status;
	
	private int id;
	private String firstName;
	private String lastName;
	private String category;
	private String Address;
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public double getRecycle_weight() {
		return recycle_weight;
	}
	public void setRecycle_weight(double recycle_weight) {
		this.recycle_weight = recycle_weight;
	}
	public byte[] getRecycleBill_proof() {
		return recycleBill_proof;
	}
	public void setRecycleBill_proof(byte[] recycleBill_proof) {
		this.recycleBill_proof = recycleBill_proof;
	}
	public double getCarbon_footprint() {
		return carbon_footprint;
	}
	public void setCarbon_footprint(double carbon_footprint) {
		this.carbon_footprint = carbon_footprint;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getName() {
		return firstName + " " + lastName;
	}	
	
}
