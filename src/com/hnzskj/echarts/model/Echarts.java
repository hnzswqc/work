/*
 * @项目名称: work
 * @文件名称: Echarts.java
 * @日期: 2017-6-8 下午05:43:29  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.echarts.model;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：work   <br/>
 * 类名称：Echarts.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-8 下午05:43:29   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-8 下午05:43:29   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Echarts extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * x轴
	 */
	private String xAxis;
	
	/**
	 * y轴
	 */
	private String yAxis;

	/**
	 * x轴
	 * @return the xAxis
	 */
	public String getxAxis() {
		return xAxis;
	}

	/**
	 * x轴
	 * @param xAxis the xAxis to set
	 */
	public void setxAxis(String xAxis) {
		this.xAxis = xAxis;
	}

	/**
	 * y轴
	 * @return the yAxis
	 */
	public String getyAxis() {
		return yAxis;
	}

	/**
	 * y轴
	 * @param yAxis the yAxis to set
	 */
	public void setyAxis(String yAxis) {
		this.yAxis = yAxis;
	}

}
