/*
 * @项目名称: ewsm
 * @文件名称: Warn.java
 * @日期: 2016-11-10 下午04:30:23  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.model;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：Warn.java   <br/>
 * 类描述：预警实体对象   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-11-10 下午04:30:23   <br/>
 * 修改人：King   <br/>
 * 修改时间：2016-11-10 下午04:30:23   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Warn extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4280485739161252889L;
	
	/**
	 * 预警用户uuid
	 */
	private String personUuid;
	
	/**
	 * 预警用户名称
	 */
	private String cnname;
	
	/**
	 * 手机号码
	 */
	private String mobile;
	
	/**
	 * 预警信息条数
	 */
	private Integer count;
	
	/**
	 * 预警类别，从type表中获取到
	 */
	private String typeName;
	
	/**
	 * 备注信息
	 */
	private String note;
	
	/**
	 * 要查询的视图表
	 */
	private String viewName;
	
	/**
	 * 关联信息外键，用于判断是否需要重复发送短信。
	 * 跟personuuid关联进行判断
	 */
	private String foreignKey;
	

	/**
	 * 关联信息外键，用于判断是否需要重复发送短信。 跟personuuid关联进行判断
	 * @return the foreignKey
	 */
	public String getForeignKey() {
		return foreignKey;
	}

	/**
	 * 关联信息外键，用于判断是否需要重复发送短信。 跟personuuid关联进行判断
	 * @param foreignKey the foreignKey to set
	 */
	public void setForeignKey(String foreignKey) {
		this.foreignKey = foreignKey;
	}
	

	/**
	 * 预警用户uuid
	 * @return the personUuid
	 */
	public String getPersonUuid() {
		return personUuid;
	}

	/**
	 * 预警用户uuid
	 * @param personUuid the personUuid to set
	 */
	public void setPersonUuid(String personUuid) {
		this.personUuid = personUuid;
	}

	/**
	 * 预警用户名称
	 * @return the cnname
	 */
	public String getCnname() {
		return cnname;
	}

	/**
	 * 预警用户名称
	 * @param cnname the cnname to set
	 */
	public void setCnname(String cnname) {
		this.cnname = cnname;
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
	 * 预警信息条数
	 * @return the count
	 */
	public Integer getCount() {
		return count;
	}

	/**
	 * 预警信息条数
	 * @param count the count to set
	 */
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
	/**
	 * 预警类别，从type表中获取到
	 * @return the typeName
	 */
	public String getTypeName() {
		return typeName;
	}

	/**
	 * 预警类别，从type表中获取到
	 * @param typeName the typeName to set
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**
	 * 备注信息
	 * @return the note
	 */
	public String getNote() {
		return note;
	}

	/**
	 * 备注信息
	 * @param note the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}

	/**
	 * 要查询的视图表
	 * @return the viewName
	 */
	public String getViewName() {
		return viewName;
	}

	/**
	 * 要查询的视图表
	 * @param viewName the viewName to set
	 */
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	
	
	

}
