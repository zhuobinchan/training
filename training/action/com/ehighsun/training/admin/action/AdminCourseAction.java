package com.ehighsun.training.admin.action;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.pojo.Course;
import com.ehighsun.training.pojo.Lump;
import com.ehighsun.training.pojo.Organization;
import com.ehighsun.training.service.impl.CourseServiceImp;

public class AdminCourseAction extends BaseAction {
	private Course course = new Course();
	private List<Lump> lumps;
	private List<Organization> organizations;
	private File img;
	private String imgFileName;
	
	@Resource(name="courseService")
	private CourseServiceImp courseServiceImp;
	
	public AdminCourseAction() {
		super();
		setObject(course);
		initialize();
	}
	
	@Override
	public String findPage() {
		organizations = (List<Organization>) getBaseService().find("From Organization");
		lumps = (List<Lump>) getBaseService().find("From Lump");
		
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
	
	@Override
	public String deleteObject() {
		courseServiceImp.deleteCourse(super.getId());
		return "deleteObject";
	}
	
	@Override
	public String deleteObjects() {
		String[] idList = super.getIds().split(",");
		for (String id : idList) {
			courseServiceImp.deleteCourse(Integer.parseInt(id));
		}
		super.getJson().put("message", "true");
		return "deleteObjects";
	}
	
	public String changeCourseStatusById() {
		course = (Course) super.getBaseService().getObjectById(course, super.getId());
		course.setStatus(~course.getStatus()+2);//1和0数值取反
		super.getBaseService().saveOrUpdateObject(course);
		Map<String, Object> jsonMap = new HashMap<>();
		jsonMap.put("message", "true");
		super.setJson(jsonMap);
		return "changeCourseStatus";
	}
	
	public String changeCourseStatusByIds() {
		String[] idList = super.getIds().split(",");
		for (String id : idList) {
			
			System.out.println("idList:"+id);
			
			course = (Course) super.getBaseService().getObjectById(course, Integer.parseInt(id));
			course.setStatus(~course.getStatus()+2);//1和0数值取反
			super.getBaseService().saveOrUpdateObject(course);
			Map<String, Object> jsonMap = new HashMap<>();
			jsonMap.put("message", "true");
			super.setJson(jsonMap);
		}
		return "changeCourseStatus";
	}
	
	public String findCourseByMap(){
		
		super.setObject(new Course());
		super.setFindPageByMapImpl(new FindPageByMapWithFK());
		organizations = (List<Organization>) getBaseService().find("From Organization");
		lumps = (List<Lump>) getBaseService().find("From Lump");
		super.findPageByMapFunc();
		
		return "findPageByMap";
	}
	
	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	

	public List<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
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

	public void setImg(File img) {
		this.img = img;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	
}
