package com.ehighsun.training.pojo;

import java.util.ArrayList;
import java.util.List;

public class Teacher extends Person {
	
	/*
	 * tno:教师编号
	 * introduce:教师简介
	 * */

	private String tno;
	private String introduction;
	private Organization organization;
	private List<ClassTable> classTables = new ArrayList<>();
	
	public Teacher(Integer pid, String accountNum, String password,
			String role, String name, String telephone, String idCard,
			String gender, String openId, String headUrl, String address,
			String email, String nickName, List<Story> stories, String tno,
			String introduction, Organization organization,
			List<ClassTable> classTables) {
		super(pid, accountNum, password, role, name, telephone, idCard, gender,
				openId, headUrl, address, email, nickName, stories);
		this.tno = tno;
		this.introduction = introduction;
		this.organization = organization;
		this.classTables = classTables;
	}
	public Teacher() {
		super();
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public List<ClassTable> getClassTables() {
		return classTables;
	}
	public void setClassTables(List<ClassTable> classTables) {
		this.classTables = classTables;
	}
	
	
}
