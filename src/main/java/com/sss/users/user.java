package com.sss.users;

public class user {
	
	private int id;
	private String name;
	private String account ;
    private String password ;
	private int age ;
    private String sex ;
	private String der ;
    private String ders ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDer() {
		return der;
	}
	public void setDer(String der) {
		this.der = der;
	}
	public String getDers() {
		return ders;
	}
	public void setDers(String ders) {
		this.ders = ders;
	}
	
	@Override
	public String toString() {
		return "user [id=" + id + ", name=" + name + ", account=" + account + ", password=" + password + ", age=" + age
				+ ", sex=" + sex + ", der=" + der + ", ders=" + ders + "]";
	}
	
	
	
}
