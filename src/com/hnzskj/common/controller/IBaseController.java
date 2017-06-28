/*
 * @项目名称: ewsm
 * @文件名称: IBaseController.java
 * @日期: 2016-10-9 上午10:54:44  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.controller;

import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.common.model.PageBean;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：IBaseController.java   <br/>
 * 类描述：  控制接口,其中T为实体对象 <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-9 上午10:54:44   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-9 上午10:54:44   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public abstract interface IBaseController<T> {
	
	
	/**
	 * 成功状态
	 */
	public static final boolean SUCCESS=true;
	/**
	 * 操作成功
	 */
	public static final String SUCCESS_STRING="操作成功";
	
	/**
	 * 失败状态
	 */
	public static final boolean FAIL=false;
	/**
	 * 操作失败
	 */
	public static final String FAIL_STRING="操作失败";
	
	
	/**
	 * 
	 * 方法描述：进入主界面，列表界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午10:56:40<br/>         
	 * @param t 实体对象，<br/>
	 * @param pageBean 分页<br/>      
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	abstract ModelAndView index(T t,PageBean<T> pageBean);
	
	
	
	/**
	 * 
	 * 方法描述：添加的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午10:57:27<br/>         
	 * @param t 实体对象，<br/>
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	abstract String add(T t);
	
	/**
	 * 
	 * 方法描述：查询一条记录的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午10:57:27<br/>         
	 * @param t 实体对象，<br/>
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	abstract String findByPrimaryKey(T t);
	
	/**
	 * 
	 * 方法描述：修改一条记录的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午10:57:27<br/>         
	 * @param t 实体对象，<br/>
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	abstract String update(T t);
	
	/**
	 * 
	 * 方法描述：删除一条记录的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午10:57:27<br/>         
	 * @param t 实体对象，<br/>
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	abstract String delete(T t);
	
	/**
	 * 
	 * 方法描述：批量删除一条记录的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午10:57:27<br/>         
	 * @param uuid 形如a,b,c,d,e，<br/>
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	abstract String delete(String uuid);
	
	
	

}
