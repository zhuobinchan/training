package com.ehighsun.training.admin.action;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.pojo.Organization;

public class AdminOrganizationAction extends BaseAction {
	
	private Organization organization = new Organization();
	
	public AdminOrganizationAction() {
		super();
		setObject(organization);
		initialize();
	}
	
	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	
}
