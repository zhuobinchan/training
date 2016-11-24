package com.ehighsun.training.pojo;

import java.util.ArrayList;
import java.util.List;

public class Student extends Person {
	
	/*
	 * sno:学生编号
	 * school:学校
	 * unit:单位
	 * integral:积分
	 * */

	private String sno;
	private String school;
	private String unit;
	private Integer integral;
	private List<Resume> resumes = new ArrayList<>();
	private List<Apply> applies = new ArrayList<>();
	
	
	public Student(Integer pid, String accountNum, String password,
			String role, String name, String telephone, String idCard,
			String gender, String openId, String headUrl, String address,
			String email, String nickName, List<Story> stories, String sno,
			String school, String unit, Integer integral, List<Resume> resumes) {
		super(pid, accountNum, password, role, name, telephone, idCard, gender,
				openId, headUrl, address, email, nickName, stories);
		this.sno = sno;
		this.school = school;
		this.unit = unit;
		this.integral = integral;
		this.resumes = resumes;
	}
	public Student() {
		super();
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Integer getIntegral() {
		return integral;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	public List<Resume> getResumes() {
		return resumes;
	}
	public void setResumes(List<Resume> resumes) {
		this.resumes = resumes;
	}
	public List<Apply> getApplies() {
		return applies;
	}
	public void setApplies(List<Apply> applies) {
		this.applies = applies;
	}
	
	
	
}
