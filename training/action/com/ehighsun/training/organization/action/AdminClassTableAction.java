package com.ehighsun.training.organization.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.pojo.ClassTable;
import com.ehighsun.training.pojo.Course;
import com.ehighsun.training.pojo.Organization;
import com.ehighsun.training.pojo.Teacher;

public class AdminClassTableAction extends BaseAction {
	
	private List<Teacher> teachers;
	private List<Course> courses;
	private ClassTable classTable = new ClassTable();
	
	
	
	public AdminClassTableAction() {
		super.setObject(classTable);
		super.initialize();
	}

	/*机构后台--排班*/
	public String adminClassTable(){
		
		
		Integer organizationId = ((Organization)ServletActionContext.getContext().getSession().get("organization")).getId();
		
		teachers = (List<Teacher>) getBaseService().find("From Teacher where organization.id = "+organizationId);
		
		courses = (List<Course>) getBaseService().find("From Course where organization.id = "+organizationId);
		
		String hql = "From ClassTable where teacher.pid in "
				+ "(select pid from Teacher where organization.id = "+organizationId+")";
		String count_str = "select count(*) from ClassTable where teacher.pid in "
				+ "(select pid from Teacher where organization.id = "+organizationId+")";
		
		
		setHql(hql);
		setCount_str(count_str);
		super.setMainPage("adminClassTable.jsp");
		super.setFindPageTarget("/organization/OrganizationClassTable_adminClassTable");
		
		return super.findPage();
	}
	
	@Override
	public String findPageByMap() {
		
		Integer organizationId = ((Organization)ServletActionContext.getContext().getSession().get("organization")).getId();
		
		teachers = (List<Teacher>) getBaseService().find("From Teacher where organization.id = "+organizationId);
		
		courses = (List<Course>) getBaseService().find("From Course where organization.id = "+organizationId);
		
		String hql = "From ClassTable where teacher.pid in "
				+ "(select pid from Teacher where organization.id = "+organizationId+")";
		String count_str = "select count(*) from ClassTable where teacher.pid in "
				+ "(select pid from Teacher where organization.id = "+organizationId+")";
		
		setHql(hql);
		setCount_str(count_str);
		setFindPageByMapImpl(new FindPageByMapWithFK());
		
		return super.findPageByMap();
	}

	public String SaveClassTable(){
		
		String teacherId = classTable.getTeacher().getPid()+"";
		String courseId = classTable.getCourse().getCourseId()+"";
		
		classTable.setClassNo("class"+teacherId+courseId);
		
		setObject(classTable);
		
		return super.saveObject();
	}
	
	
	public List<Teacher> getTeachers() {
		return teachers;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public ClassTable getClassTable() {
		return classTable;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public void setClassTable(ClassTable classTable) {
		this.classTable = classTable;
	}
	
}
