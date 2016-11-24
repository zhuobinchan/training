package com.ehighsun.training.admin.action;

import java.util.HashMap;
import java.util.Map;

import javassist.expr.NewArray;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.pojo.Story;

public class AdminStoryAction extends BaseAction {
	private Story story = new Story();
	public AdminStoryAction() {
		super();
		setObject(story);
		initialize();
	}
	
	@Override
	public String findPageByMap() {
		setObject(new Story());
		super.setFindPageByMapImpl(new FindPageByMapWithFK());
		return super.findPageByMap();
	}
	
	public String changeStoryStatus() {
		story = (Story) super.getBaseService().getObjectById(story, super.getId());
		story.setStatus(~story.getStatus()+2);//1和0数值取反
		super.getBaseService().saveOrUpdateObject(story);
		Map<String, Object> jsonMap = new HashMap<>();
		jsonMap.put("message", "true");
		super.setJson(jsonMap);
		return "changeStoryStatus";
	}
	
	public String changeStoryStatusByIds() {
		String[] idList = super.getIds().split(",");
		for (String id : idList) {
			
			System.out.println("idList:"+id);
			
			story = (Story) super.getBaseService().getObjectById(story, Integer.parseInt(id));
			story.setStatus(~story.getStatus()+2);//1和0数值取反
			super.getBaseService().saveOrUpdateObject(story);
			Map<String, Object> jsonMap = new HashMap<>();
			jsonMap.put("message", "true");
			super.setJson(jsonMap);
		}
		return "changeStoryStatus";
	}
	
	public Story getStory() {
		return story;
	}
	public void setStory(Story story) {
		this.story = story;
	}
	
}
