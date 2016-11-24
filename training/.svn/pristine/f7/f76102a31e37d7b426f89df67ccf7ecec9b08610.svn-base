package com.ehighsun.training.service.impl;

import java.io.File;
import java.sql.Timestamp;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import com.ehighsun.training.pojo.Course;
import com.ehighsun.training.pojo.Resource;
import com.ehighsun.training.util.FileUploadUtil;
import com.ehighsun.training.util.StringUtil;

@Service("resourceService")
public class ResourceServiceImpl extends BaseServiceImpl {
	public void saveResource(File img, String imgFileName, Resource resource) {

		if (img != null&&StringUtil.isNotEmpty(img.getPath())) {

			FileUploadUtil fileUtil = new FileUploadUtil();

			String resoureUrl = fileUtil.updateFile(img, imgFileName,
					"images/resoure");

			resource.setUrl(resoureUrl);
		}
		super.saveObject(resource);

	}

	public void saveOrUpdateResource(File img, String imgFileName,
			Resource resource) {

		FileUploadUtil fileUtil = new FileUploadUtil();
		Resource index = (Resource) super.getObjectById(resource, resource.getResourceId());
		if (img != null&&StringUtil.isNotEmpty(img.getPath())) {

			String pathname = ServletActionContext.getRequest().getSession()
					.getServletContext().getRealPath("/" + index.getUrl());

			fileUtil.deleteFile(pathname);

			String imageUrl = fileUtil.updateFile(img, imgFileName,
					"images/resoure");

			resource.setUrl(imageUrl);

		} else if (StringUtil.isNotEmpty(index.getUrl())) {
			resource.setUrl(index.getUrl());
		}

		super.saveOrUpdateObject(resource);

	}
}
