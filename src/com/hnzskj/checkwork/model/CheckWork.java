/*
 * @项目名称: work
 * @文件名称: CheckWork.java
 * @日期: 2017-6-5 上午11:01:33  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.model;

import java.math.BigDecimal;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：work   <br/>
 * 类名称：CheckWork.java   <br/>
 * 类描述：日常考勤   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 上午11:01:33   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 上午11:01:33   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class CheckWork extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5111737051014137764L;

	public CheckWork(){}
	
	public CheckWork(String date){
		this.date = date;
	}
	/**
	 * 考勤日期
	 */
	private String date;
	
	/**
	 * 考勤人员uuid
	 */
	private String workerUuid;
	
	/**
	 * 考勤人员姓名
	 */
	private String workerName;
	
	/**
	 * 工种
	 */
	private String workType;
	
	/**
	 * 考勤类别
	 */
	private String time;
	
	/**
	 * 考勤打分
	 */
	private String score;
	
	/**
	 * 年度
	 */
	private Integer year;
	
	/**
	 * 月份
	 */
	private Integer month;
	
	
	/**
	 * 工资。按天计算。正常上下午除以2。
	 */
	private BigDecimal wages;
	
	/**
	 * 当天借款项
	 */
	private BigDecimal lendMoney;

	/**
	 * 考勤日期
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * 考勤日期
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * 考勤人员uuid
	 * @return the workerUuid
	 */
	public String getWorkerUuid() {
		return workerUuid;
	}

	/**
	 * 考勤人员uuid
	 * @param workerUuid the workerUuid to set
	 */
	public void setWorkerUuid(String workerUuid) {
		this.workerUuid = workerUuid;
	}

	/**
	 * 考勤人员姓名
	 * @return the workerName
	 */
	public String getWorkerName() {
		return workerName;
	}

	/**
	 * 考勤人员姓名
	 * @param workerName the workerName to set
	 */
	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}

	/**
	 * 考勤类别
	 * @return the time
	 */
	public String getTime() {
		return time;
	}

	/**
	 * 考勤类别
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}

	/**
	 * 考勤打分
	 * @return the score
	 */
	public String getScore() {
		return score;
	}

	/**
	 * 考勤打分
	 * @param score the score to set
	 */
	public void setScore(String score) {
		this.score = score;
	}

	/**
	 * 工资。按天计算。正常上下午除以2。
	 * @return the wages
	 */
	public BigDecimal getWages() {
		return wages;
	}

	/**
	 * 工资。按天计算。正常上下午除以2。
	 * @param wages the wages to set
	 */
	public void setWages(BigDecimal wages) {
		this.wages = wages;
	}

	/**
	 * 当天借款项
	 * @return the lendMoney
	 */
	public BigDecimal getLendMoney() {
		return lendMoney;
	}

	/**
	 * 当天借款项
	 * @param lendMoney the lendMoney to set
	 */
	public void setLendMoney(BigDecimal lendMoney) {
		this.lendMoney = lendMoney;
	}

	/**
	 * 年度
	 * @return the year
	 */
	public Integer getYear() {
		return year;
	}

	/**
	 * 年度
	 * @param year the year to set
	 */
	public void setYear(Integer year) {
		this.year = year;
	}

	/**
	 * 月份
	 * @return the month
	 */
	public Integer getMonth() {
		return month;
	}

	/**
	 * 月份
	 * @param month the month to set
	 */
	public void setMonth(Integer month) {
		this.month = month;
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
	
	
}
