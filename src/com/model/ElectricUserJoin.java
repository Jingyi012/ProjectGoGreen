package com.model;

public class ElectricUserJoin {
	private int eid;
	private double electric_consumption;
	private byte[] electricBill_proof;
	private int year;
	private int month;
	private double carbon_footprint;
	private int user_id;
	private String status;

	private int id;
	private String firstName;
	private String lastName;
	private String category;
	private String Address;
	
	public String getName() {
		return firstName + " " + lastName;
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
