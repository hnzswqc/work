/*
 * @项目名称: ewsm
 * @文件名称: BaseModel.java
 * @日期: 2016-7-24 下午05:19:34  
 * @版权: 2011 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.model;

import java.io.Serializable;
import java.math.BigDecimal;

import org.apache.commons.lang.StringUtils;

import com.hnzskj.common.util.date.DateUtil;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：BaseModel.java   <br/>
 * 类描述：   <br/>
 * 创建人：开发部笔记本   <br/>
 * 创建时间：2016-7-24 下午05:19:34   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-7-24 下午05:19:34   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class BaseModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8579954988052150041L;
 
	
	/**
	 * 当前时间
	 */
	private String currentTime;
	
	/**
	 * 主键
	 */
	private String uuid;
	
	/**
	 * 用户uuid
	 */
	public String userUuid;
	
	/**
	 * 用户姓名
	 */
	public String userName;
	
	/**
	 * 创建时间
	 */
	private String createTime;
	
	/**
	 * 查询开始时间
	 */
	private String startTime;
	
	/**
	 * 查询结束时间
	 */
	private String endTime;
	
	/**
	 *  持续时间
	 */
	private long duration;
	
	/**
	 * 状态信息
	 */
	private Integer status;
	
	/**
	 * 排序号
	 */
	private Integer sequenceNo;
	
	/**
	 * 备注信息
	 */
	private String note;
	
	/**
	 * 类别
	 */
	private Integer type;
	
	/**
	 * 数量信息
	 */
	private Integer count;
	
	/**
	 * 金额
	 */
	private BigDecimal money;
	
	

	/**
	 * 当前时间
	 * @return the currentTime
	 */
	public String getCurrentTime() {
		if(StringUtils.isEmpty(currentTime)){
			return DateUtil.getCurrentTime();
		}
		return currentTime;
	}

	/**
	 * 当前时间
	 * @param currentTime the currentTime to set
	 */
	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}

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
	 * 创建时间
	 * @return the createTime
	 */
	public String getCreateTime() {
		return createTime;
	}

	/**
	 * 创建时间
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	/**
	 * 查询开始时间
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * 查询开始时间
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * 查询结束时间
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * 查询结束时间
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/**
	 * 状态信息
	 * @return the status
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * 状态信息
	 * @param status the status to set
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 排序号
	 * @return the sequenceNo
	 */
	public Integer getSequenceNo() {
		return sequenceNo;
	}

	/**
	 * 排序号
	 * @param sequenceNo the sequenceNo to set
	 */
	public void setSequenceNo(Integer sequenceNo) {
		this.sequenceNo = sequenceNo;
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
	 * 类别
	 * @return the type
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * 类别
	 * @param type the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 用户uuid
	 * @return the userUuid
	 */
	public String getUserUuid() {
		return userUuid;
	}

	/**
	 * 用户uuid
	 * @param userUuid the userUuid to set
	 */
	public void setUserUuid(String userUuid) {
		this.userUuid = userUuid;
	}

	/**
	 * 用户姓名
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 用户姓名
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 数量信息
	 * @return the count
	 */
	public Integer getCount() {
		return count;
	}

	/**
	 * 数量信息
	 * @param count the count to set
	 */
	public void setCount(Integer count) {
		this.count = count;
	}

	/**
	 * @return the duration
	 */
	public long getDuration() {
		return duration;
	}

	/**
	 * @param duration the duration to set
	 */
	public void setDuration(long duration) {
		this.duration = duration;
	}

	/**
	 * 金额
	 * @return the money
	 */
	public BigDecimal getMoney() {
		return money;
	}

	/**
	 * 金额
	 * @param money the money to set
	 */
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	
	
	
	
}
