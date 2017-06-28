/*
 * @项目名称: ewsm
 * @文件名称: Type.java
 * @日期: 2016-11-16 下午05:01:37  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.model;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：Type.java   <br/>
 * 类描述： 短信预警类别  <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-11-16 下午05:01:37   <br/>
 * 修改人：King   <br/>
 * 修改时间：2016-11-16 下午05:01:37   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Type extends BaseModel{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5183385335964402543L;
	
	/**
	 * 主键
	 */
	private String uuid;
	
	/**
	 * 类别名称
	 */
	private String name;
	
	/**
	 * 对应视图
	 */
	private String viewName;

	/**
	 * 主键
	 * @return the uuid
	 */
	public String getUuid() {
		return uuid;
	}

	/**
	 * 主键
	 * @param uuid the uuid to set
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}


	/**
	 * 类别名称
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * 类别名称
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 对应视图
	 * @return the viewName
	 */
	public String getViewName() {
		return viewName;
	}

	/**
	 * 对应视图
	 * @param viewName the viewName to set
	 */
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	
	
	

}
