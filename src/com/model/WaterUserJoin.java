package com.model;

public class WaterUserJoin {

		private int waterId;
		private double water_consumption;
		private byte[] water_proof;
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

		public int getwaterId() {
			return waterId;
		}

		public void setWaterId(int waterId) {
			this.waterId = waterId;
		}

		public double getWater_consumption() {
			return water_consumption;
		}

		public void setWater_consumption(double water_consumption) {
			this.water_consumption = water_consumption;
		}

		public byte[] getWater_proof() {
			return water_proof;
		}

		public void setWater_proof(byte[] water_proof) {
			this.water_proof = water_proof;
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

	
	

