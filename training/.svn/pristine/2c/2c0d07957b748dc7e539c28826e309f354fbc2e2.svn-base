package com.ehighsun.training.organization.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithFK;
import com.ehighsun.training.dao.impl.FindPageByMapWithoutFK;
import com.ehighsun.training.pojo.ClassTable;
import com.ehighsun.training.pojo.Course;
import com.ehighsun.training.pojo.Lump;
import com.ehighsun.training.pojo.Organization;
import com.ehighsun.training.pojo.Teacher;

public class OrganizationAction extends BaseAction {
	
	/*机构后台--教师搜索*/
	public String teacherFilter() {
		
		super.setObject(new Teacher());
		
		super.setMainPage("myTeacher.jsp");
		super.setFindPageTarget("/organization/Organization_teacherFilter");
		
		return super.findPageByMap();
	}

	/*机构后台--教师管理*/
	public String getAllTeachers(){
		
		Integer organizationId = ((Organization)ServletActionContext.getContext().getSession().get("organization")).getId();
	
		String hql = "From Teacher where organization.id = "+organizationId;
		String count_str = "select count(*) from Teacher where organization.id = "+organizationId;
		
		super.setHql(hql);
		super.setCount_str(count_str);
		super.setObject(new Teacher());
		super.setFindPageTarget("/organization/Organization_getAllTeachers");
		super.setMainPage("myTeacher.jsp");	

		
		
		return super.findPage();
	}

	
	
}
