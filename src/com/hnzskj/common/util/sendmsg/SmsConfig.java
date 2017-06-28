/*
 * @项目名称: ewsm_jz
 * @文件名称: SmsConfig.java
 * @日期: 2016-10-8 上午10:09:38  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.sendmsg;

import org.apache.commons.lang.StringUtils;

import com.hnzskj.common.util.constant.Constant;


/**    
 * 项目名称：ewsm_jz   <br/>
 * 类名称：SmsConfig.java   <br/>
 * 类描述：短信配置实体信息   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-8 上午10:09:38   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-8 上午10:09:38   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class SmsConfig {
	
	/**
	 * 是否开启短信。1开启0不开启
	 */
	private String open;
	
	/**
	 * 是否开启调试模式。1开启0不开启
	 */
	private String debug;
	
	/**
	 * 调试模式手机号码
	 */
	private String debugPhone;
	
	/**
	 * 短信服务接口
	 */
	private String server;
	
	/**
	 * 经过处理后的url
	 */
	private String url;
	
	/**
	 * 发送的内容
	 */
	private String text;
	
	/**
	 * 接收的短信
	 */
	private String mobile;

	/**
	 * 是否开启短信。1开启0不开启
	 * @return the open
	 */
	public String getOpen() {
		return open;
	}

	/**
	 * 是否开启短信。1开启0不开启
	 * @param open the open to set
	 */
	public void setOpen(String open) {
		this.open = open;
	}

	/**
	 * 是否开启调试模式。1开启0不开启
	 * @return the debug
	 */
	public String getDebug() {
		return debug;
	}

	/**
	 * 是否开启调试模式。1开启0不开启
	 * @param debug the debug to set
	 */
	public void setDebug(String debug) {
		this.debug = debug;
	}

	/**
	 * 调试模式手机号码
	 * @return the debugPhone
	 */
	public String getDebugPhone() {
		return debugPhone;
	}

	/**
	 * 调试模式手机号码
	 * @param debugPhone the debugPhone to set
	 */
	public void setDebugPhone(String debugPhone) {
		this.debugPhone = debugPhone;
	}

	/**
	 * 短信服务接口
	 * @return the server
	 */
	public String getServer() {
		return server;
	}

	/**
	 * 短信服务接口
	 * @param server the server to set
	 */
	public void setServer(String server) {
		this.server = server;
	}
	

	/**
	 * @return the url
	 */
	public String getUrl() {
		if(StringUtils.isEmpty(server)){
			return null;
		}
		if(debug==Constant.SMSCONFIG_DEBUG){
			url = server.replaceAll("#text#", text).replaceAll("#mobile#", debugPhone);
		}else{
			url = server.replaceAll("#text#", text).replaceAll("#mobile#", mobile);
		}
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * 发送的内容
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * 发送的内容
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * 接收的短信
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * 接收的短信
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
	

}
