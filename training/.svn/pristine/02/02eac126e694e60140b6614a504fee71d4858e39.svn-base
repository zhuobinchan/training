package com.ehighsun.training.pojo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Course {
	
	/*
	 * courseId:id
	 * name:课程名称
	 * publishTime:发布时间
	 * imageUrl:课程封面
	 * introduction:课程介绍
	 * lump:板块
	 * organization:机构
	 * status:状态 //0代表没有审核，1代表审核成功
	 * */
	
	private Integer courseId;
	private String name;
	private Timestamp publishTime;
	private String imageUrl;
	private String introduction;
	private Integer status;
	private Lump lump;
	
	private List<Chapter> chapters = new ArrayList<>();
	private List<ClassTable> classTables = new ArrayList<>();
	private Organization organization;

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Lump getLump() {
		return lump;
	}

	public void setLump(Lump lump) {
		this.lump = lump;
	}

	public List<Chapter> getChapters() {
		return chapters;
	}

	public void setChapters(List<Chapter> chapters) {
		this.chapters = chapters;
	}

	public List<ClassTable> getClassTables() {
		return classTables;
	}

	public void setClassTables(List<ClassTable> classTables) {
		this.classTables = classTables;
	}
	
	public Timestamp getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Course() {
		super();
	}
}
