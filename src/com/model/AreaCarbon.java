package com.model;

public class AreaCarbon {
	private double sum_cf;
	private String area;
	private double water_consumption;
	private double electric_consumption;
	private double recycle_weight;
	private int num_participant;
	
	public int getNum_participant() {
		return num_participant;
	}
	public void setNum_participant(int num_participant) {
		this.num_participant = num_participant;
	}
	public double getWater_consumption() {
		return water_consumption;
	}
	public void setWater_consumption(double water_consumption) {
		this.water_consumption = water_consumption;
	}
	public double getElectric_consumption() {
		return electric_consumption;
	}
	public void setElectric_consumption(double electric_consumption) {
		this.electric_consumption = electric_consumption;
	}
	public double getRecycle_weight() {
		return recycle_weight;
	}
	public void setRecycle_weight(double recycle_weight) {
		this.recycle_weight = recycle_weight;
	}
	public double getSum_cf() {
		return sum_cf;
	}
	public void setSum_cf(double sum_cf) {
		this.sum_cf = sum_cf;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
}
