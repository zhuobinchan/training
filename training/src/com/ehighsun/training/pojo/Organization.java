package com.ehighsun.training.pojo;

import java.util.ArrayList;
import java.util.List;

public class Organization {

	/*
	 * id:id
	 * name:公司名
	 * address:地址
	 * linkMan:联系人
	 * telephone:联系方式
	 * email:邮箱
	 * */
	
	
	private Integer id;
	private String name;
	private String introduction;
	private String address;
	private String linkMan;
	private String telephone;
	private String email;
	private String accountNum;
	private String password;
	
	private List<Teacher> teachers = new ArrayList<>();
	private List<Course> courses = new ArrayList<>();
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<Teacher> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public String getPassword() {
		return password;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}
