/*
 * @项目名称: work
 * @文件名称: WorkCollect.java
 * @日期: 2017-6-5 下午03:59:39  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.model;

import java.math.BigDecimal;
import java.util.List;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkCollect.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 下午03:59:39   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 下午03:59:39   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class WorkCollect extends CheckWork {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7426933155335972680L;
	
	/**
	 * 统计总人数
	 */
	private Integer workerNum;
	
	/**
	 * 其他花费总项
	 */
	private BigDecimal other;
	
	/**
	 * 考勤信息
	 */
	private List<CheckWork> list = null;
	
	/**
	 * 其他花销
	 */
	private List<WorkCost> workCostList = null;
	
	

	/**
	 * 统计总人数
	 * @return the workerNum
	 */
	public Integer getWorkerNum() {
		return workerNum;
	}

	/**
	 * 统计总人数
	 * @param workerNum the workerNum to set
	 */
	public void setWorkerNum(Integer workerNum) {
		this.workerNum = workerNum;
	}

	/**
	 * 其他花费总项
	 * @return the other
	 */
	public BigDecimal getOther() {
		return other;
	}

	/**
	 * 其他花费总项
	 * @param other the other to set
	 */
	public void setOther(BigDecimal other) {
		this.other = other;
	}

	/**
	 * 考勤信息
	 * @return the list
	 */
	public List<CheckWork> getList() {
		return list;
	}

	/**
	 * 考勤信息
	 * @param list the list to set
	 */
	public void setList(List<CheckWork> list) {
		this.list = list;
	}

	/**
	 * 其他花销
	 * @return the workCostList
	 */
	public List<WorkCost> getWorkCostList() {
		return workCostList;
	}

	/**
	 * 其他花销
	 * @param workCostList the workCostList to set
	 */
	public void setWorkCostList(List<WorkCost> workCostList) {
		this.workCostList = workCostList;
	}
	
	
	
	

}
