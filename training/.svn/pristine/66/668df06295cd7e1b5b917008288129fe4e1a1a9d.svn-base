package com.ehighsun.training.service.impl;

import java.io.File;

import org.apache.struts2.ServletActionContext;

import com.ehighsun.training.pojo.Person;
import com.ehighsun.training.pojo.Story;
import com.ehighsun.training.util.FileUploadUtil;
import com.ehighsun.training.util.StringUtil;

public class StoryServerice extends BaseServiceImpl{
	
	public void saveStory(File img, String imgFileName, Story story) {

		if (img != null) {

			FileUploadUtil fileUtil = new FileUploadUtil();

			String headUrl = fileUtil.updateFile(img, imgFileName,
					"images/story");

			story.setImageUrl(headUrl);
		}

		super.saveObject(story);

	}

	public void saveOrUpdateStory(File img, String imgFileName,
			Story story) {

		FileUploadUtil fileUtil = new FileUploadUtil();
		Story index = (Story) super.getObjectById(story, story.getStoryId());
		if (img != null) {

			String pathname = ServletActionContext.getRequest().getSession()
					.getServletContext().getRealPath("/" + story.getImageUrl());

			fileUtil.deleteFile(pathname);

			String headUrl = fileUtil.updateFile(img, imgFileName,
					"images/story");

			index.setImageUrl(headUrl);

		} else if (StringUtil.isNotEmpty(index.getImageUrl())) {
			story.setImageUrl(index.getImageUrl());
		}

		super.saveOrUpdateObject(story);

	}
}
