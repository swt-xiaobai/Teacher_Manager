package com.sss.users;

public class course {
	private String name;
	private String time;
	private String teacher;
	private int classTime;
	private String Taccount;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public int getClassTime() {
		return classTime;
	}
	public void setClassTime(int classTime) {
		this.classTime = classTime;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "course [name=" + name + ", time=" + time + ", teacher=" + teacher + ", classTime=" + classTime +"Taccount="+Taccount+ "]";
	}
	public String getTaccount() {
		return Taccount;
	}
	public void setTaccount(String taccount) {
		Taccount = taccount;
	}

	

}
