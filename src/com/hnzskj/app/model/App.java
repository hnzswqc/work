/*
 * @项目名称: spms
 * @文件名称: App.java
 * @日期: 2017-4-13 下午04:09:20  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.model;

import com.hnzskj.server.model.Server;

/**    
 * 项目名称：spms   <br/>
 * 类名称：App.java   <br/>
 * 类描述：应用实体对象   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-13 下午04:09:20   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-13 下午04:09:20   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class App extends Server {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2681389755772139818L;
	
	/**
	 * 所属单位
	 */
	private String orgUuid;

	/**
	 * 所在服务器uuid
	 */
	private String serverUuid;
	
	/**
	 * 所在服务器名称
	 */
	private String serverName;
	
	/**
	 * 应用名称
	 */
	private String name;
	
	/**
	 * 项目名称
	 */
	private String projectName;
	
	/**
	 * 部署tomcat根目录
	 */
	private String path;
	
	/**
	 * 运行端口
	 */
	private Integer port;
	
	/**
	 * 部署时间
	 */
	private String deployTime;
	
	/**
	 * 部署版本
	 */
	private String version;
	
	/**
	 * 测试连接的URL
	 */
	private String testUrl;
	
	/**
	 * 检测方式。1自动2手动
	 */
	private Integer type;
	
	/**
	 * 开始命令
	 */
	private String start;
	
	/**
	 * 结束命令
	 */
	private String stop;
	
	/**
	 * 运行状态
	 */
	private Integer runStatus;
	
	
	
	

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
	 * 所在服务器uuid
	 * @return the serverUuid
	 */
	public String getServerUuid() {
		return serverUuid;
	}

	/**
	 * 所在服务器uuid
	 * @param serverUuid the serverUuid to set
	 */
	public void setServerUuid(String serverUuid) {
		this.serverUuid = serverUuid;
	}

	/**
	 * 所在服务器名称
	 * @return the serverName
	 */
	public String getServerName() {
		return serverName;
	}

	/**
	 * 所在服务器名称
	 * @param serverName the serverName to set
	 */
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	/**
	 * 应用名称
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * 应用名称
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 项目名称
	 * @return the projectName
	 */
	public String getProjectName() {
		return projectName;
	}

	/**
	 * 项目名称
	 * @param projectName the projectName to set
	 */
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	/**
	 * 部署tomcat根目录
	 * @return the path
	 */
	public String getPath() {
		return path;
	}

	/**
	 * 部署tomcat根目录
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * 运行端口
	 * @return the port
	 */
	public Integer getPort() {
		return port;
	}

	/**
	 * 运行端口
	 * @param port the port to set
	 */
	public void setPort(Integer port) {
		this.port = port;
	}

	/**
	 * 部署时间
	 * @return the deployTime
	 */
	public String getDeployTime() {
		return deployTime;
	}

	/**
	 * 部署时间
	 * @param deployTime the deployTime to set
	 */
	public void setDeployTime(String deployTime) {
		this.deployTime = deployTime;
	}

	/**
	 * 部署版本
	 * @return the version
	 */
	public String getVersion() {
		return version;
	}

	/**
	 * 部署版本
	 * @param version the version to set
	 */
	public void setVersion(String version) {
		this.version = version;
	}

	/**
	 * 测试连接的URL
	 * @return the testUrl
	 */
	public String getTestUrl() {
		return testUrl;
	}

	/**
	 * 测试连接的URL
	 * @param testUrl the testUrl to set
	 */
	public void setTestUrl(String testUrl) {
		this.testUrl = testUrl;
	}

	/**
	 * 检测方式。1自动2手动
	 * @return the type
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * 检测方式。1自动2手动
	 * @param type the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 开始命令
	 * @return the start
	 */
	public String getStart() {
		return start;
	}

	/**
	 * 开始命令
	 * @param start the start to set
	 */
	public void setStart(String start) {
		this.start = start;
	}

	/**
	 * 结束命令
	 * @return the stop
	 */
	public String getStop() {
		return stop;
	}

	/**
	 * 结束命令
	 * @param stop the stop to set
	 */
	public void setStop(String stop) {
		this.stop = stop;
	}

	/**
	 * 运行状态
	 * @return the runStatus
	 */
	public Integer getRunStatus() {
		return runStatus;
	}

	/**
	 * 运行状态
	 * @param runStatus the runStatus to set
	 */
	public void setRunStatus(Integer runStatus) {
		this.runStatus = runStatus;
	}
	
	
	
	
	
}
