package com.model;

public class Students {
	private int id;
	private String name;
	private int age;
	private double marks;
	
	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public int getAge() { return age; }
	public void setAge(int age) { this.age = age; }
	
	public double getMarks() { return marks; }
	public void setMarks(double marks) { this.marks = marks; }
	
	@Override
	public String toString() {
		return "Students [id=" + id + ", name=" + name + ", age=" + age + ", marks=" + marks + "]";
	}
}
