/*
 * @项目名称: ewsm
 * @文件名称: SendMsg.java
 * @日期: 2016-11-10 下午04:39:49  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.model;


/**    
 * 项目名称：ewsm   <br/>
 * 类名称：SendMsg.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-11-10 下午04:39:49   <br/>
 * 修改人：King   <br/>
 * 修改时间：2016-11-10 下午04:39:49   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class SendMsg extends Warn {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5395447775737388215L;
	
	/**
	 * 发送的内容
	 */
	private String content;

	/**
	 *	成功失败状态0失败1未开启2成功
	 */
	private Integer state;
	
	
	
	
	
	/**
	 * 发送的内容
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 发送的内容
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 成功失败状态
	 * @return the state
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * 成功失败状态
	 * @param state the state to set
	 */
	public void setState(Integer state) {
		this.state = state;
	}
	

}
