/*
 * @项目名称: ewsm
 * @文件名称: BaseController.java
 * @日期: 2016-7-24 下午04:20:47  
 * @版权: 2011 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.controller.impl;


import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.common.controller.IBaseController;
import com.hnzskj.common.model.Json;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.common.service.IBaseService;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.user.model.User;


/**    
 * 项目名称：ewsm   <br/>
 * 类名称：BaseController.java   <br/>
 * 类描述： 基础controller实现类。T为实体参数  <br/>
 * 创建人：开发部笔记本   <br/>
 * 创建时间：2016-7-24 下午04:20:47   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-7-24 下午04:20:47   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class BaseController<T> implements IBaseController<T>{

	/**
	 * 业务注入
	 */
	private IBaseService<T> baseService = null;
	
	/**
	 * 默认参数
	 */
	protected final String DEFAULT_MENU = "menu";
	
	
	protected final String DEFAULT_PAGEBEAN="pageBean";
	
	/**
	 * 设置实际要进行操作的业务类
	 * @param baseMapper the baseMapper to set
	 */
	public void setBaseService(IBaseService<T> baseService) {
		this.baseService = baseService;
	}
	
	@Autowired
	HttpServletRequest request;
	

	/**
	 * 
	 * 方法描述：获取当前类，首字母小写。符合骆驼命名法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-11-16 下午01:45:21<br/>         
	 * @param <br/>   
	 * @return String<br/>   
	 * @version   1.0<br/>
	 */
	private String getClassName(T t){
		String clazz = t.getClass().getSimpleName();
		return clazz.substring(0,1).toLowerCase() + clazz.substring(1);
	}
	
	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.IBaseController#add(java.lang.Object)
	 */
	public String add(T t) {
		boolean result = baseService.add(t);
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.IBaseController#delete(java.lang.Object)
	 */
	public String delete(T t) {
		boolean result = baseService.delete(t);
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.IBaseController#delete(java.lang.String)
	 */
	public String delete(String uuid) {
		boolean result = FAIL;
		if(StringUtils.isNotEmpty(uuid)){
			Serializable[]id = uuid.split(",");
			result = baseService.delete(id);
		}
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.IBaseController#findByPrimaryKey(java.lang.Object)
	 */
	public String findByPrimaryKey(T t) {
		t = baseService.findByPrimaryKey(t);
		return new Json(SUCCESS, t).toJson();
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.IBaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	public ModelAndView index(T t, PageBean<T> pageBean) {
		String className =getClassName(t);
		ModelAndView modelAndView = new ModelAndView(className+"/index");
		pageBean = baseService.find(pageBean, t);
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.addObject(className,t);
		modelAndView.addObject(DEFAULT_MENU,className);
		return modelAndView;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.IBaseController#update(java.lang.Object)
	 */
	public String update(T t) {
		boolean result = baseService.update(t);
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}
	
	/**
	 * 
	 * 方法描述：设置session信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午04:35:33<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public void setSessionAttr(String name,Object obj){
		request.getSession().setAttribute(name,obj);
	}
	
	/**
	 * 
	 * 方法描述：获取session信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午04:36:17<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public Object getSessionAttr(String name){
		Object obj = request.getSession().getAttribute(name);
		return obj;
	}
	
	/**
	 * 
	 * 方法描述：获取当前用户<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午03:23:33<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public User getCurrentUser(){
		User user =(User)getSessionAttr(Constant.SESSION_USER_KEY);
		return user;
	}
	
	/**
	 * 
	 * 方法描述：设置session信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午04:35:33<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public void destorySessionAttr(String name){
		setSessionAttr(name,null);
		request.getSession().removeAttribute(name);
	}
	
}
