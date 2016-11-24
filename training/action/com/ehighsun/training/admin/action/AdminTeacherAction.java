package com.ehighsun.training.admin.action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.dao.impl.FindPageByMapWithoutFK;
import com.ehighsun.training.pojo.Organization;
import com.ehighsun.training.pojo.Teacher;
import com.ehighsun.training.service.impl.TeacherServiceImpl;
import com.ehighsun.training.util.FileUploadUtil;
import com.ehighsun.training.util.StringUtil;

public class AdminTeacherAction extends BaseAction {

	private Teacher teacher = new Teacher();
	private List<Organization> organizations;
	
	private File img;
	private String imgFileName;
	
	@Resource(name="teacheService")
	private TeacherServiceImpl teacheService;
	
	public AdminTeacherAction() {
		super();
		setObject(teacher);
		initialize();
	}
	
	@Override
	public String findPage() {
		
		organizations = (List<Organization>) getBaseService().find("From Organization");
		
		return super.findPage();
	}
	
	
	
	
	@Override
	public String findPageByMap() {
		findPageByMapFunc();
		
		super.setResults(super.getBaseService().findPageByMap(new FindPageByMapWithFK(),
				super.getHql(), super.getMap(), super.getPageBean()));
		
		return "findPageByMap";
	}

	@Override
	public String saveObject() {
		
		teacheService.saveTeacher(img, imgFileName, teacher);
		
		return "saveObject";
	}
	
	@Override
	public String saveOrUpdateObject() {

		teacheService.saveOrUpdateTeacher(img, imgFileName, teacher);
		
		return "saveOrUpdateObject";
	}
	
	
	
	
	
	
	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public List<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
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
