package com.sss.users;

public class ct {
	private String name;
	private String teacher;
	private String sex;
	private String account;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "ct [name=" + name + ", teacher=" + teacher + ", sex=" + sex + ", account=" + account + "]";
	}
	
	
	
	
	
}
