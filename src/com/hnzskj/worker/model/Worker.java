/*
 * @项目名称: work
 * @文件名称: Worker.java
 * @日期: 2017-6-4 下午03:22:22  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.worker.model;

import java.math.BigDecimal;

import org.apache.commons.lang.StringUtils;

import com.hnzskj.common.model.BaseModel;
import com.hnzskj.common.util.date.DateUtil;

/**    
 * 项目名称：work   <br/>
 * 类名称：Worker.java   <br/>
 * 类描述：工人管理   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-4 下午03:22:22   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-4 下午03:22:22   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Worker extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 工人姓名
	 */
	private String name;
	
	/**
	 * 手机号码
	 */
	private String mobile;
	
	/**
	 * 出生日期，方便计算年龄使用
	 */
	private String birthday;
	
	/**
	 * 年龄，通过出生日期计算出来
	 */
	private int age;
	
	/**
	 * 性别
	 */
	private Integer gender;
	
	/**
	 * 籍贯地址
	 */
	private String addRess;
	
	/**
	 * 工种
	 */
	private String workType;
	
	/**
	 * 工种名称，数据字典查询出来
	 */
	private String workTypeName;
	
	/**
	 * 工资。按计算。
	 */
	private BigDecimal wages;

	/**
	 * 工人姓名
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * 工人姓名
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	 * 出生日期，方便计算年龄使用
	 * @return the birthday
	 */
	public String getBirthday() {
		return birthday;
	}

	/**
	 * 出生日期，方便计算年龄使用
	 * @param birthday the birthday to set
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	/**
	 * 年龄，通过出生日期计算出来
	 * @return the age
	 */
	public int getAge() {
		if(StringUtils.isNotEmpty(birthday)){
			Integer birthdayYear = Integer.valueOf(birthday.substring(0,4));
			Integer currentYear = Integer.valueOf(DateUtil.getCurrentYear());
			return currentYear-birthdayYear+1;
		}
		return age;
	}

	/**
	 * 年龄，通过出生日期计算出来
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * 性别
	 * @return the gender
	 */
	public Integer getGender() {
		return gender;
	}

	/**
	 * 性别
	 * @param gender the gender to set
	 */
	public void setGender(Integer gender) {
		this.gender = gender;
	}

	/**
	 * 籍贯地址
	 * @return the addRess
	 */
	public String getAddRess() {
		return addRess;
	}

	/**
	 * 籍贯地址
	 * @param addRess the addRess to set
	 */
	public void setAddRess(String addRess) {
		this.addRess = addRess;
	}

	/**
	 * 工种
	 * @return the workType
	 */
	public String getWorkType() {
		return workType;
	}

	/**
	 * 工种
	 * @param workType the workType to set
	 */
	public void setWorkType(String workType) {
		this.workType = workType;
	}

	/**
	 * 工种名称，数据字典查询出来
	 * @return the workTypeName
	 */
	public String getWorkTypeName() {
		return workTypeName;
	}

	/**
	 * 工种名称，数据字典查询出来
	 * @param workTypeName the workTypeName to set
	 */
	public void setWorkTypeName(String workTypeName) {
		this.workTypeName = workTypeName;
	}

	/**
	 * 工资。按计算。
	 * @return the wages
	 */
	public BigDecimal getWages() {
		return wages;
	}

	/**
	 * 工资。按计算。
	 * @param wages the wages to set
	 */
	public void setWages(BigDecimal wages) {
		this.wages = wages;
	}
	
	
	
	

}
