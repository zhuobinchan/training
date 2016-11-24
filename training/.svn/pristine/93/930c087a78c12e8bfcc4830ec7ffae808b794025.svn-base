package com.ehighsun.training.service.impl;

import java.io.File;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import com.ehighsun.training.pojo.Person;
import com.ehighsun.training.pojo.Teacher;
import com.ehighsun.training.util.FileUploadUtil;
import com.ehighsun.training.util.StringUtil;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

@Service("teacheService")
public class TeacherServiceImpl extends BaseServiceImpl {

	
	public void saveTeacher(File img,String imgFileName,Teacher teacher) {
		
		if (img != null) {
			
			FileUploadUtil fileUtil = new FileUploadUtil();
			
			String headUrl = fileUtil.updateFile(img, imgFileName, "images/userLogo");
			
			teacher.setHeadUrl(headUrl);
		}
		
		super.saveObject(teacher);
		
	}
	
	public void saveOrUpdateTeacher(File img,String imgFileName,Teacher teacher){
		
		FileUploadUtil fileUtil = new FileUploadUtil();
		Person person = (Person) super.getObjectById(teacher, teacher.getPid());
		if(img !=null){
			

			String pathname = ServletActionContext.getRequest().getSession().getServletContext()
					.getRealPath("/"+person.getHeadUrl());
			
			fileUtil.deleteFile(pathname);
			
			
			
			String headUrl = fileUtil.updateFile(img, imgFileName, "images/userLogo");
			
			teacher.setHeadUrl(headUrl);			
			
		}else if (StringUtil.isNotEmpty(person.getHeadUrl())){
			teacher.setHeadUrl(person.getHeadUrl());
		}
		
		
		super.saveOrUpdateObject(teacher);
		
	}

}
