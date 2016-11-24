package com.ehighsun.training.organization.action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.pojo.Course;
import com.ehighsun.training.pojo.Lump;
import com.ehighsun.training.pojo.Organization;
import com.ehighsun.training.service.impl.CourseServiceImp;

public class AdminCourseAction extends BaseAction {

	private Course course = new Course();
	private List<Lump> lumps;
	
	private File img;
	private String imgFileName;
	
	@Resource(name="courseService")
	private CourseServiceImp courseServiceImp;
	
	@Override
	public String deleteObjects() {
		String[] idList = super.getIds().split(",");
		for (String id : idList) {
			
			courseServiceImp.deleteCourse(Integer.parseInt(id));
			
		}

		super.getJson().put("message", "true");
		
		return "deleteObjects";
	}

	public AdminCourseAction() {
		super.setObject(course);
		super.initialize();
	}

	@Override
	public String deleteObject() {
		
		courseServiceImp.deleteCourse(super.getId());
		
		super.getJson().put("message", "true");
		return "deleteObject";
	}

	/*机构后台--课程搜索*/
	public String FilterCourse(){
		
		lumps = (List<Lump>) getBaseService().find("From Lump");
		
		Integer organizationId = ((Organization)ServletActionContext.getContext().getSession().get("organization")).getId();
		
		getMap().put("organization.id", organizationId);
		
		super.setMainPage("myCourse.jsp");
		super.setFindPageTarget("/organization/OrganizationCourse_FilterCourse");
		super.setFindPageByMapImpl(new FindPageByMapWithFK());
		
		
		findPageByMapFunc();
		
		return "findPageByMap";
	}
	
	/*机构后台--课程管理*/
	public String adminCourse(){
		
		lumps = (List<Lump>) getBaseService().find("From Lump");
		
		Integer organizationId = ((Organization)ServletActionContext.getContext().getSession().get("organization")).getId();
		
		String hql = "From Course where organization.id = "+organizationId;
		String count_str = "select count(*) from Course where organization.id = "+organizationId;
		
		super.setHql(hql);
		super.setCount_str(count_str);		
		
		super.setMainPage("myCourse.jsp");
		super.setFindPageTarget("/organization/OrganizationCourse_adminCourse");
		
		return super.findPage();
		
	}

	@Override
	public String saveObject() {
		courseServiceImp.saveCourse(img, imgFileName, course);
		
		return "saveObject";
	}
	
	

	@Override
	public String saveOrUpdateObject() {
		
		courseServiceImp.saveOrUpdateCourse(img, imgFileName, course);
		
		return "saveOrUpdateObject";
	}

	public List<Lump> getLumps() {
		return lumps;
	}

	public void setLumps(List<Lump> lumps) {
		this.lumps = lumps;
	}

	public File getImg() {
		return img;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImg(File img) {
		this.img = img;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
	
}
