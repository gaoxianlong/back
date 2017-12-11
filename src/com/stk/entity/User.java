package com.stk.entity;

public class User {

	 private int  age;
	    private String name;
	    private int height;
	    private String sex;
	    public User() {
	        super();
	    }
	    public User(int age, String name, int height, String sex) {
	        super();
	        this.age = age;
	        this.name = name;
	        this.height = height;
	        this.sex = sex;
	    }
	    public String getSex() {
	        return sex;
	    }

	    public void setSex(String sex) {
	        this.sex = sex;
	    }

	    public int getAge() {
	        return age;
	    }
	    public void setAge(int age) {
	        this.age = age;
	    }
	    public String getName() {
	        return name;
	    }
	    public void setName(String name) {
	        this.name = name;
	    }
	    public int getHeight() {
	        return height;
	    }
	    public void setHeight(int height) {
	        this.height = height;
	    }
}
