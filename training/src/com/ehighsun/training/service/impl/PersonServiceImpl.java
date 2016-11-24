package com.ehighsun.training.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ehighsun.training.dao.BaseDao;
import com.ehighsun.training.dao.CrudDao;
import com.ehighsun.training.pojo.Administrator;
import com.ehighsun.training.pojo.Person;
import com.ehighsun.training.pojo.Story;
import com.ehighsun.training.pojo.Student;
import com.ehighsun.training.pojo.Teacher;
import com.ehighsun.training.service.IPersonService;

@Service("personService")
public class PersonServiceImpl extends BaseServiceImpl implements IPersonService{
	
	@Resource(name="crudDao")
	private CrudDao crudDao;
	
	@Override
	public List<Story> getMyStories(){
		return null;
		
	}

	/*用户登录*/
	@Override
	public Person Login(String account,String password) {
		
		Person person = null;
	
		List<Person> persons = (List<Person>) crudDao.find("from Person where accountNum=? and password=?",new Object[] {account,password});
		
		if(persons != null && persons.size()!=0) person = persons.get(0);
		
		String role = "";
		
		if (person !=null) {
			role = person.getRole();
		}
		
		switch (role) {
			case "admin":{
				
				Administrator admin = (Administrator) person;
				return admin;
				
			}
			case "student":{
				
				Student student = (Student) person;
				return student;
				
			}
			case "teacher":{
				
				Teacher teacher = (Teacher) person;
				return teacher;
				
			}
		}
			
		return null;
	}
	
}
