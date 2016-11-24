package com.ehighsun.training.service;

import java.util.List;

import com.ehighsun.training.pojo.Person;
import com.ehighsun.training.pojo.Story;

public interface IPersonService {
	public List<Story> getMyStories();
	Person Login(String account,String password);
}
