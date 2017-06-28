/*
 * @项目名称: spms
 * @文件名称: Server.java
 * @日期: 2017-4-12 下午03:11:16  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.server.model;

import com.hnzskj.org.model.Org;

/**    
 * 项目名称：spms   <br/>
 * 类名称：Server.java   <br/>
 * 类描述： 服务器实体对象  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-12 下午03:11:16   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-12 下午03:11:16   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Server extends Org {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 所属单位
	 */
	private String orgUuid;
	
	/**
	 * 所属单位名称
	 */
	private String orgName;
	
	/**
	 * 服务器名
	 */
	private String serverName;
	
	/**
	 * 服务器品牌
	 */
	private String serverBrand;
	
	/**
	 * 使用时间
	 */
	private String useTime;
	
	/**
	 * 操作系统类别
	 */
	private String osName;
	
	/**
	 * 操作系统版本
	 */
	private String osVersion;
	
	/**
	 * 服务器IP
	 */
	private String serverIp;
	
	/**
	 * 登录名称
	 */
	private String loginName;
	
	/**
	 * 登录密码
	 */
	private String password;
	

	/**
	 * 定时任务uuid
	 */
	private String timerUuid;
	

	/**
	 * 所属单位
	 * @return the orgUuid
	 */
	public String getOrgUuid() {
		return orgUuid;
	}

	/**
	 * 所属单位
	 * @param orgUuid the orgUuid to set
	 */
	public void setOrgUuid(String orgUuid) {
		this.orgUuid = orgUuid;
	}

	/**
	 * 所属单位名称
	 * @return the orgName
	 */
	public String getOrgName() {
		return orgName;
	}

	/**
	 * 所属单位名称
	 * @param orgName the orgName to set
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/**
	 * 服务器名
	 * @return the serverName
	 */
	public String getServerName() {
		return serverName;
	}

	/**
	 * 服务器名
	 * @param serverName the serverName to set
	 */
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	/**
	 * 服务器品牌
	 * @return the serverBrand
	 */
	public String getServerBrand() {
		return serverBrand;
	}

	/**
	 * 服务器品牌
	 * @param serverBrand the serverBrand to set
	 */
	public void setServerBrand(String serverBrand) {
		this.serverBrand = serverBrand;
	}

	/**
	 * 使用时间
	 * @return the useTime
	 */
	public String getUseTime() {
		return useTime;
	}

	/**
	 * 使用时间
	 * @param useTime the useTime to set
	 */
	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}

	/**
	 * 操作系统类别
	 * @return the osName
	 */
	public String getOsName() {
		return osName;
	}

	/**
	 * 操作系统类别
	 * @param osName the osName to set
	 */
	public void setOsName(String osName) {
		this.osName = osName;
	}

	/**
	 * 操作系统版本
	 * @return the osVersion
	 */
	public String getOsVersion() {
		return osVersion;
	}

	/**
	 * 操作系统版本
	 * @param osVersion the osVersion to set
	 */
	public void setOsVersion(String osVersion) {
		this.osVersion = osVersion;
	}

	/**
	 * 服务器IP
	 * @return the serverIp
	 */
	public String getServerIp() {
		return serverIp;
	}

	/**
	 * 服务器IP
	 * @param serverIp the serverIp to set
	 */
	public void setServerIp(String serverIp) {
		this.serverIp = serverIp;
	}

	/**
	 * 登录名称
	 * @return the loginName
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * 登录名称
	 * @param loginName the loginName to set
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	/**
	 * 登录密码
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 登录密码
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 定时任务uuid
	 * @return the timerUuid
	 */
	public String getTimerUuid() {
		return timerUuid;
	}

	/**
	 * 定时任务uuid
	 * @param timerUuid the timerUuid to set
	 */
	public void setTimerUuid(String timerUuid) {
		this.timerUuid = timerUuid;
	}
	
	

}
