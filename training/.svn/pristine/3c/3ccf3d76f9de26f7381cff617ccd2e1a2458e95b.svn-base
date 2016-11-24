package com.ehighsun.training.teacher.action;

import java.io.File;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.omg.CORBA.OBJ_ADAPTER;

import com.alibaba.fastjson.JSONObject;
import com.ehighsun.training.base.action.BaseAction;
import com.ehighsun.training.dao.impl.FindPageByMapWithoutFK;
import com.ehighsun.training.pojo.ClassTable;
import com.ehighsun.training.pojo.Course;
import com.ehighsun.training.pojo.Student;
import com.ehighsun.training.pojo.Teacher;
import com.ehighsun.training.service.impl.TeacherServiceImpl;
import com.ehighsun.training.util.StringUtil;

public class TeacherAdminCourseAction extends BaseAction{
	
	private ClassTable classTable = new ClassTable();
	
	private File img;
	private String imgFileName;
	
	private Teacher teacher;
	
	@Resource(name="teacheService")
	private TeacherServiceImpl teacheService;
	
	public TeacherAdminCourseAction() {
		super();
		setObject(classTable);
		initialize();
	}


	/*返回教师个人信息*/
	@Override
	public String getObjectById() {
		
		Teacher teacher = (Teacher) getRequest().getSession().getAttribute("teacher");
		
		super.setObject(teacher);
		super.setId(teacher.getPid());
		
		return super.getObjectById();
	}

	/*查询该老师的排班表*/
	@Override
	public String findPage() {

		Teacher teacher = (Teacher) getRequest().getSession().getAttribute("teacher");
		
		super.setCount_str("select count(*) from ClassTable where teacher.pid=" + teacher.getPid());
		
		super.setHql("From ClassTable where teacher.pid="+teacher.getPid());
		
		super.findPageFunc();
		
		return "findPage";
	}

	
	/*查找自己的学生，通过报名表来划分学生属于哪个哪个老师*/
	public String findStudentPage() {
		
		Teacher teacher = (Teacher) getRequest().getSession().getAttribute("teacher");
		
		setObject(new Student());
		
		String hql = "From Student where pid in"
				+ "(select student.pid from Apply where classNo in"
				+ "(select classNo from ClassTable where teacher.pid = ?))";
		
		super.setCount_str("select count(*) from Student where pid in"
				+ "(select student.pid from Apply where classNo in "
				+ "(select classNo from ClassTable where teacher.pid = "+teacher.getPid()+"))");
		super.setHql(hql);
		super.setParam(new Object[]{teacher.getPid()});		
		
		super.findPageFunc();
		
		return "findStudentPage";
	}
	
	/*在我的学生里搜索学生*/
	public String filterStudent(){
		
		setObject(new Student());

		Teacher teacher = (Teacher) getRequest().getSession().getAttribute("teacher");
		
		String hql = "From Student where pid in"
				+ "(select student.pid from Apply where classNo in"
				+ "(select classNo from ClassTable where teacher.pid = ?))";
		
		super.setCount_str("select count(*) from Student where pid in"
				+ "(select student.pid from Apply where classNo in "
				+ "(select classNo from ClassTable where teacher.pid = "+teacher.getPid()+"))");
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.parseObject(getSearchContent());
		
		for (Entry<String, Object> entry : jsonObject.entrySet()) {
			if (entry.getValue() !=null && !entry.getValue().equals("")) {
				hql = hql + " and " + entry.getKey() + "=" +"'"+entry.getValue()+"'";
				super.setCount_str(super.getCount_str() + " and " + entry.getKey() + "=" + "'" + entry.getValue()+"'");
			}
		}
		
		
		setHql(hql);
		super.setParam(new Object[]{teacher.getPid()});		
		
		findPageFunc();
		
		
		setMainPage("myStudent.jsp");
		
		return "filterStudent";
	}
	
	/*教师修改个人信息*/
	public String modifyTeacher(){
		
		Teacher teacher_session = (Teacher) getRequest().getSession().getAttribute("teacher");
		
		teacher.setAccountNum(teacher_session.getAccountNum());
		teacher.setPassword(teacher_session.getPassword());
		teacher.setRole(teacher_session.getRole());
		teacher.setOpenId(teacher_session.getOpenId());
		teacher.setIdCard(teacher_session.getIdCard());
		teacher.setTno(teacher_session.getTno());
		teacher.setName(teacher_session.getName());
		teacher.setOrganization(teacher_session.getOrganization());
		
		teacheService.saveOrUpdateTeacher(img, imgFileName, teacher);
		
		if (img == null) {
			teacher.setHeadUrl(teacher_session.getHeadUrl());
		}
		
		getRequest().getSession().setAttribute("teacher", teacher);
		
		setMainPage("adminTeacherInfo.jsp");
		
		return "modifyTeacher";
	}


	public File getImg() {
		return img;
	}

	public void setImg(File img) {
		this.img = img;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public TeacherServiceImpl getTeacheService() {
		return teacheService;
	}

	public void setTeacheService(TeacherServiceImpl teacheService) {
		this.teacheService = teacheService;
	}


	public Teacher getTeacher() {
		return teacher;
	}


	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
	

}
