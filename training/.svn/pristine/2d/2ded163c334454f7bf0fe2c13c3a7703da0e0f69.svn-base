package com.ehighsun.training.admin.action;

import java.util.List;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.pojo.Chapter;
import com.ehighsun.training.pojo.Course;

public class AdminChapterAction extends BaseAction {
	private Chapter chapter = new Chapter();
	private List<Course> courses; 
	public AdminChapterAction() {
		super();
		setObject(chapter);
		initialize();
	}
	
	
	public String findPageByCourseId() {
		super.setHql("from Chapter where course.courseId = "+super.getId());
		super.setCount_str("select count(*) from Chapter where course.courseId = "+super.getId());
		super.setMainPage("adminChapter.jsp");
		super.setPageCodeParam("&id="+super.getId());
		super.setTargetPage("/admin/AdminChapter_findPageByCourseId");
		courses = (List<Course>) super.getBaseService().find("from Course where courseId = "+super.getId());
		return super.findPage();
	}
	
	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	
}
