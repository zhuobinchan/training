package com.ehighsun.training.admin.action;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.expr.NewArray;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.pojo.Chapter;
import com.ehighsun.training.pojo.Course;
import com.ehighsun.training.pojo.Resource;
import com.ehighsun.training.service.impl.ResourceServiceImpl;
import com.ehighsun.training.util.StringUtil;

public class AdminResourceAction extends BaseAction {
	private Resource resource = new Resource();
	
	private File img;
	private String imgFileName;
	
	private List<Chapter> chapters;
	
	@javax.annotation.Resource(name ="resourceService")
	private ResourceServiceImpl resourceServiceImpl;
	
	public AdminResourceAction() {
		super();
		setObject(resource);
		initialize();
	}
	
	@Override
	public String saveObject() {
		resourceServiceImpl.saveResource(img, imgFileName, resource);
		
		return "saveObject";
	}
	
	@Override
	public String saveOrUpdateObject() {
		resourceServiceImpl.saveOrUpdateResource(img, imgFileName, resource);
		return "saveOrUpdateObject";
	}
	
	public String findPageByChapterId(){
		super.setHql("from Resource where chapter.chapterId = "+super.getId());
		super.setCount_str("select count(*) from Resource where chapter.chapterId = "+super.getId());
		super.setMainPage("adminResource.jsp");
		super.setPageCodeParam("&id="+super.getId());
		super.setTargetPage("/admin/AdminResource_findPageByChapterId");
		chapters =  (List<Chapter>) super.getBaseService().find("from Chapter where chapterId = "+super.getId());
		return super.findPage();
	}
	
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
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

	public List<Chapter> getChapters() {
		return chapters;
	}

	public void setChapters(List<Chapter> chapters) {
		this.chapters = chapters;
	}
}
