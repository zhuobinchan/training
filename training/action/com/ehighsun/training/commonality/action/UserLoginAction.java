package com.ehighsun.training.commonality.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ehighsun.training.pojo.Organization;
import com.ehighsun.training.pojo.Person;
import com.ehighsun.training.pojo.Teacher;
import com.ehighsun.training.service.BaseService;
import com.ehighsun.training.service.impl.PersonServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UserLoginAction extends ActionSupport {

	private String account;
	private String password;
	
	private Object person;
	
	private String errorMessage;
	
	@Resource(name="personService")
	private PersonServiceImpl personService;
	@Resource(name="baseService")
	private BaseService baseService;
	
	private HttpServletRequest request = ServletActionContext.getRequest();
	
	
	public String person(){
		
		person = personService.Login(account, password);
		
		if (person==null) {
			
			errorMessage = "账户或密码不正确，请重新输入。";
			return "input";
			
		}
		
	
		switch (((Person)person).getRole()) {
		case "admin":
			request.getSession().setAttribute("admin", person);
			return "admin";
		case "teacher":
			request.getSession().setAttribute("teacher", person);
			System.out.println(((Person)person).getHeadUrl()+"((Teacher)request.getSession()..getHeadUrl():"+((Teacher)request.getSession().getAttribute("teacher")).getHeadUrl());
			return "teacher";
		case "student":
			request.getSession().setAttribute("student", person);
			return "student";
		default:
			errorMessage = "账号身份不明，请联系管理员。";
			return "input";		
		}
		
		
	}
	
	public String organization(){
		
		Organization organization=null;
		
		List<Organization> organizations = (List<Organization>) baseService.find("from Organization where accountNum=? and password=?",new Object[] {account,password});
		
		if(organizations != null && organizations.size()!=0) organization = organizations.get(0);

		if(organization != null){
			request.getSession().setAttribute("organization", organization);
			return "organization";
		}else {
			errorMessage = "账户或密码不正确，请重新输入。";
			return "organizationInput";					
		}
		
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public Object getPerson() {
		return person;
	}

	public void setPerson(Object person) {
		this.person = person;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
}
