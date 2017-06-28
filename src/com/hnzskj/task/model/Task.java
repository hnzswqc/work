/*
 * @项目名称: spms
 * @文件名称: Task.java
 * @日期: 2017-4-20 下午05:54:03  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.task.model;

import com.hnzskj.app.model.App;

/**    
 * 项目名称：spms   <br/>
 * 类名称：Task.java   <br/>
 * 类描述：任务信息   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-20 下午05:54:03   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-20 下午05:54:03   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Task extends App {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 关联外键信息
	 */
	private String foreignKey;
	
	/**
	 * 外键类别
	 */
	private String foreignName;
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 用户uuid
	 */
	private String userUuid;
	
	/**
	 * 用户姓名
	 */
	private String userName;

	/**
	 * 所属定时任务
	 */
	private String timerUuid;
	
	
	/**
	 * 关联外键信息
	 * @return the foreignKey
	 */
	public String getForeignKey() {
		return foreignKey;
	}

	/**
	 * 关联外键信息
	 * @param foreignKey the foreignKey to set
	 */
	public void setForeignKey(String foreignKey) {
		this.foreignKey = foreignKey;
	}

	/**
	 * 外键类别
	 * @return the foreignName
	 */
	public String getForeignName() {
		return foreignName;
	}

	/**
	 * 外键类别
	 * @param foreignName the foreignName to set
	 */
	public void setForeignName(String foreignName) {
		this.foreignName = foreignName;
	}

	/**
	 * 名称
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * 名称
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 用户uuid
	 * @return the userUuid
	 */
	public String getUserUuid() {
		return userUuid;
	}

	/**
	 * 用户uuid
	 * @param userUuid the userUuid to set
	 */
	public void setUserUuid(String userUuid) {
		this.userUuid = userUuid;
	}

	/**-
	 * 用户姓名
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 用户姓名
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 所属定时任务
	 * @return the timerUuid
	 */
	public String getTimerUuid() {
		return timerUuid;
	}

	/**
	 * 所属定时任务
	 * @param timerUuid the timerUuid to set
	 */
	public void setTimerUuid(String timerUuid) {
		this.timerUuid = timerUuid;
	}
	
	
}
