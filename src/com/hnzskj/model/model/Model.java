/*
 * @项目名称: ewsm
 * @文件名称: Model.java
 * @日期: 2016-10-9 上午09:08:13  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.model.model;

import org.apache.commons.lang.StringUtils;

import com.hnzskj.common.model.BaseModel;
import com.hnzskj.common.util.date.DateUtil;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：Model.java   <br/>
 * 类描述：预警模块管理   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-9 上午09:08:13   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-9 上午09:08:13   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Model extends BaseModel{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7904382734980069618L;
	
	/**
	 * 主键
	 */
	private String uuid;
	
	/**
	 * 模块名称
	 */
	private  String modelName;
	
	/**
	 * 模块描述说明信息
	 */
	private String modelDescription;
	
	/**
	 * 创建时间
	 */
	private String modelCreateTime;
	
	/**
	 * 模块当前状态。1启用0不启用
	 */
	private Integer modelStatus;
	
	/**
	 * 模块排序
	 */
	private Integer modelSequence;
	
	/**
	 * 删除标记
	 */
	private Integer modelDeleteType;
	

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
	 * 模块名称
	 * @return the modelName
	 */
	public String getModelName() {
		return modelName;
	}

	/**
	 * 模块名称
	 * @param modelName the modelName to set
	 */
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	/**
	 * 模块描述说明信息
	 * @return the modelDescription
	 */
	public String getModelDescription() {
		return modelDescription;
	}

	/**
	 * 模块描述说明信息
	 * @param modelDescription the modelDescription to set
	 */
	public void setModelDescription(String modelDescription) {
		this.modelDescription = modelDescription;
	}

	/**
	 * 创建时间
	 * @return the modelCreateTime
	 */
	public String getModelCreateTime() {
		if(StringUtils.isEmpty(modelCreateTime)){
			return DateUtil.getCurrentTime();
		}
		return modelCreateTime;
	}

	/**
	 * 创建时间
	 * @param modelCreateTime the modelCreateTime to set
	 */
	public void setModelCreateTime(String modelCreateTime) {
		this.modelCreateTime = modelCreateTime;
	}

	/**
	 * 模块当前状态。1启用0不启用
	 * @return the modelStatus
	 */
	public Integer getModelStatus() {
		return modelStatus;
	}

	/**
	 * 模块当前状态。1启用0不启用
	 * @param modelStatus the modelStatus to set
	 */
	public void setModelStatus(Integer modelStatus) {
		this.modelStatus = modelStatus;
	}

	/**
	 * 模块排序
	 * @return the modelSequence
	 */
	public Integer getModelSequence() {
		return modelSequence;
	}

	/**
	 * 模块排序
	 * @param modelSequence the modelSequence to set
	 */
	public void setModelSequence(Integer modelSequence) {
		this.modelSequence = modelSequence;
	}

	/**
	 * 删除标记
	 * @return the modelDeleteType
	 */
	public Integer getModelDeleteType() {
		return modelDeleteType;
	}

	/**
	 * 删除标记
	 * @param modelDeleteType the modelDeleteType to set
	 */
	public void setModelDeleteType(Integer modelDeleteType) {
		this.modelDeleteType = modelDeleteType;
	}

	
	
	

}
