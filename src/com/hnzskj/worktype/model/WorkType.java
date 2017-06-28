/*
 * @项目名称: work
 * @文件名称: WorkType.java
 * @日期: 2017-6-4 上午08:28:01  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.worktype.model;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkType.java   <br/>
 * 类描述： 工种管理  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-4 上午08:28:01   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-4 上午08:28:01   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class WorkType extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public WorkType(){}
	
	public WorkType(String cateGory){
		this.cateGory = cateGory;
	}
	
	/**
	 * 类别
	 */
	private String  cateGory;
	
	/**
	 * 类别名称
	 */
	private String cateGoryName;
	
	/**
	 * 编码
	 */
	private String code;
	
	/**
	 * 内容
	 */
	private String text;

	/**
	 * 类别
	 * @return the cateGory
	 */
	public String getCateGory() {
		return cateGory;
	}

	/**
	 * 类别
	 * @param cateGory the cateGory to set
	 */
	public void setCateGory(String cateGory) {
		this.cateGory = cateGory;
	}

	/**
	 * 类别名称
	 * @return the cateGoryName
	 */
	public String getCateGoryName() {
		return cateGoryName;
	}

	/**
	 * 类别名称
	 * @param cateGoryName the cateGoryName to set
	 */
	public void setCateGoryName(String cateGoryName) {
		this.cateGoryName = cateGoryName;
	}

	/**
	 * 编码
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * 编码
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * 内容
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * 内容
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	

}
