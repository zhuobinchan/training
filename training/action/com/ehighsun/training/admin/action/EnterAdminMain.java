package com.ehighsun.training.admin.action;

import com.ehighsun.training.base.action.BaseAction;

public class EnterAdminMain extends BaseAction {

	private String mainPage;
	
	@Override
	public String execute() throws Exception {
		
		mainPage = "welcome.jsp";
		
		return SUCCESS;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	
	
}
