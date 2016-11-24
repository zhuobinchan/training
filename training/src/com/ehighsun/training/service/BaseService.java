package com.ehighsun.training.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.ehighsun.training.dao.IFindPageByMap;
import com.ehighsun.training.pojo.PageBean;

public interface BaseService {
	
	Long count(String hql);
	
	public Long countByMap(IFindPageByMap impl,String hql, Map<String, Object> map);
	
	Object getObjectById(Object object,Integer id);

	void saveObject(Object object);
	
	void saveOrUpdateObject(Object object);
	
	void deleteObject(Object object);
	
	List<?> find(String hql);
	
	List<?> find(String hql, Object[] param);
	
	List<?> find(String hql, List<Object> param);

	List<?> find(String hql, Object[] param, PageBean pageBean);

	List<?> findByMap(String hql, Map<String, Object> map);	
	
	List<?> findPageByMap(IFindPageByMap impl,String hql, Map<String, Object> map,
			PageBean pageBean);

}
