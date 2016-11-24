package com.ehighsun.training.admin.action;

import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.pojo.Lump;

public class AdminLumpAction  extends BaseAction {
	private Lump lump = new Lump();
	
	public AdminLumpAction() {
		super();
		setObject(lump);
		initialize();
	}
	
	public Lump getLump() {
		return lump;
	}

	public void setLump(Lump lump) {
		this.lump = lump;
	}
	
}
