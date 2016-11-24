package com.ehighsun.training.commonality.action;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.pojo.Story;
import com.ehighsun.training.util.StringUtil;

public class StoryAction extends BaseAction {
	private Story story = new Story();
	public StoryAction() {
		super();
		setObject(story);
		initialize();
	}
	
	public String getStoryById() {
		if (StringUtil.isNotEmpty(super.getId())) {
			story = (Story) super.getBaseService().getObjectById(story, super.getId());
		}
		return "getStoryById";
	}
	
	
	
	
	public Story getStory() {
		return story;
	}
	public void setStory(Story story) {
		this.story = story;
	}
	
}
