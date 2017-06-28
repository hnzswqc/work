/*
 * @项目名称: spms
 * @文件名称: User.java
 * @日期: 2017-4-5 下午06:23:56  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.user.model;

import java.io.Serializable;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：spms   <br/>
 * 类名称：User.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-5 下午06:23:56   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-5 下午06:23:56   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class User extends BaseModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4025447354029095336L;

	/**
	 * 用户信息
	 */
	private String userName;
	
	/**
	 * 用户登录名
	 */
	private String loginName;
	
	/**
	 * 用户登录密码
	 */
	private String password;
	
	/**
	 * 新密码
	 */
	private String newPassword;
	
	/**
	 * 用户类别
	 */
	private Integer type;
	
	/**
	 * 用户性别
	 */
	private Integer gender;
	
	/**
	 * 手机号码
	 */
	private String mobile;
	
	/**
	 * 邮箱
	 */
	private String mail;
	

	/**
	 * 用户信息
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 用户信息
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 用户登录名
	 * @return the loginName
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * 用户登录名
	 * @param loginName the loginName to set
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	/**
	 * 用户登录密码
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 用户登录密码
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 用户类别
	 * @return the type
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * 用户类别
	 * @param type the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 用户性别
	 * @return the gender
	 */
	public Integer getGender() {
		return gender;
	}

	/**
	 * 用户性别
	 * @param gender the gender to set
	 */
	public void setGender(Integer gender) {
		this.gender = gender;
	}

	/**
	 * 手机号码
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * 手机号码
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * 邮箱
	 * @return the mail
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * 邮箱
	 * @param mail the mail to set
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	/**
	 * 新密码
	 * @return the newPassword
	 */
	public String getNewPassword() {
		return newPassword;
	}

	/**
	 * 新密码
	 * @param newPassword the newPassword to set
	 */
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	
}
