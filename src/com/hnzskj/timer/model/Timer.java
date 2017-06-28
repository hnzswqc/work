/*
 * @项目名称: spms
 * @文件名称: Timer.java
 * @日期: 2017-4-26 下午02:16:05  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.timer.model;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：spms   <br/>
 * 类名称：Timer.java   <br/>
 * 类描述：定时任务信息   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-26 下午02:16:05   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-26 下午02:16:05   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Timer extends BaseModel {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 定时器名称
	 */
	private String timerName;
	
	/**
	 * 定时器启动方式
	 */
	private Integer timerWay;

	/**
	 * 定时器名称
	 * @return the timerName
	 */
	public String getTimerName() {
		return timerName;
	}

	/**
	 * 定时器名称
	 * @param timerName the timerName to set
	 */
	public void setTimerName(String timerName) {
		this.timerName = timerName;
	}

	/**
	 * 定时器启动方式
	 * @return the timerWay
	 */
	public Integer getTimerWay() {
		return timerWay;
	}

	/**
	 * 定时器启动方式
	 * @param timerWay the timerWay to set
	 */
	public void setTimerWay(Integer timerWay) {
		this.timerWay = timerWay;
	}
	
	
	
	

}
