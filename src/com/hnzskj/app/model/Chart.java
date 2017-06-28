/*
 * @项目名称: spms
 * @文件名称: Chart.java
 * @日期: 2017-4-20 下午02:37:25  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.model;

import com.hnzskj.common.model.BaseModel;

/**    
 * 项目名称：spms   <br/>
 * 类名称：Chart.java   <br/>
 * 类描述：图表实体类   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-20 下午02:37:25   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-20 下午02:37:25   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Chart extends BaseModel{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7108761582115353617L;
	
	/**
	 * 单位
	 */
	private String orgUuid;
	
	/**
	 * 单位名称
	 */
	private String orgName;
	
	
	/**
	 * 正常数量
	 */
	private Integer normal;
	
	/**
	 * 异常数量
	 */
	private Integer anomaly;

	/**
	 * 单位
	 * @return the orgUuid
	 */
	public String getOrgUuid() {
		return orgUuid;
	}

	/**
	 * 单位
	 * @param orgUuid the orgUuid to set
	 */
	public void setOrgUuid(String orgUuid) {
		this.orgUuid = orgUuid;
	}
	

	/**
	 * 单位名称
	 * @return the orgName
	 */
	public String getOrgName() {
		return orgName;
	}

	/**
	 * 单位名称
	 * @param orgName the orgName to set
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/**
	 * 正常数量
	 * @return the normal
	 */
	public Integer getNormal() {
		return normal;
	}

	/**
	 * 正常数量
	 * @param normal the normal to set
	 */
	public void setNormal(Integer normal) {
		this.normal = normal;
	}

	/**
	 * 异常数量
	 * @return the anomaly
	 */
	public Integer getAnomaly() {
		return anomaly;
	}

	/**
	 * 异常数量
	 * @param anomaly the anomaly to set
	 */
	public void setAnomaly(Integer anomaly) {
		this.anomaly = anomaly;
	}
}
