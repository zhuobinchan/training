package com.ehighsun.training.pojo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ClassTable implements Serializable{
	
	/*
	 * className:班名
	 * startTime:开始时间
	 * teacher:该班次的老师
	 * course:该班次的课程
	 * 
	 * */
	
	private String classNo;
	private String className;
	private Timestamp startTime;
	private Teacher teacher;
	private Course course;
	
	private List<Apply> applies = new ArrayList<>();
	
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public String getClassNo() {
		return classNo;
	}
	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	public List<Apply> getApplies() {
		return applies;
	}
	public void setApplies(List<Apply> applies) {
		this.applies = applies;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	
	
}
