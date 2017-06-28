/*
 * @项目名称: work
 * @文件名称: WorkCost.java
 * @日期: 2017-6-7 上午10:37:20  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.model;

import java.math.BigDecimal;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkCost.java   <br/>
 * 类描述： 其他花费  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-7 上午10:37:20   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-7 上午10:37:20   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class WorkCost extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public WorkCost(){}
	public WorkCost(String date){
		this.date = date;
	}
	/**
	 * 日期
	 */
	private String date;
	
	/**
	 * 花销类别
	 */
	private String workType;
	
	/**
	 * 类别名称
	 */
	private String workTypeName;
	
	/**
	 * 金额
	 */
	private BigDecimal cost;

	/**
	 * 日期
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * 日期
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * 花销类别
	 * @return the workType
	 */
	public String getWorkType() {
		return workType;
	}

	/**
	 * 花销类别
	 * @param workType the workType to set
	 */
	public void setWorkType(String workType) {
		this.workType = workType;
	}

	/**
	 * 类别名称
	 * @return the workTypeName
	 */
	public String getWorkTypeName() {
		return workTypeName;
	}

	/**
	 * 类别名称
	 * @param workTypeName the workTypeName to set
	 */
	public void setWorkTypeName(String workTypeName) {
		this.workTypeName = workTypeName;
	}
	/**
	 * 花费
	 * @return the cost
	 */
	public BigDecimal getCost() {
		return cost;
	}
	/**
	 * 花费
	 * @param cost the cost to set
	 */
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	
	
	
	
	

}
