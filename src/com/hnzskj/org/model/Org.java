/*
 * @项目名称: spms
 * @文件名称: Org.java
 * @日期: 2017-4-7 下午03:10:31  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.org.model;

import com.hnzskj.common.model.BaseModel;
import com.hnzskj.common.util.constant.Constant;

/**    
 * 项目名称：spms   <br/>
 * 类名称：Org.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-7 下午03:10:31   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-7 下午03:10:31   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Org extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Org(){}
	
	/**
	 * 为了验证是否存在子级使用
	 * @param orgParentUuid
	 */
	public Org(String orgParentUuid){
		this.orgParentUuid = orgParentUuid;
	}
	
	/**
	 * 机构code
	 */
	private String orgCode;
	
	/**
	 * 机构名称
	 */
	private String orgName;
	
	/**
	 * 所属父级别
	 */
	private String orgParentUuid;
	
	/**
	 * 所属父节点信息
	 */
	private String orgParentName;
	
	
	/**
	 * 类别，区分是部门还是机构
	 */
	private String orgProp;
	
	/**
	 * 单位联系人
	 */
	private String linkMan;
	
	/**
	 * 联系人电话
	 */
	private String linkMobile;
	
	/**
	 * 对应地图的名称
	 */
	private String mapName;

	/**
	 * 机构code
	 * @return the orgCode
	 */
	public String getOrgCode() {
		return orgCode;
	}

	/**
	 * 机构code
	 * @param orgCode the orgCode to set
	 */
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	/**
	 * 机构名称
	 * @return the orgName
	 */
	public String getOrgName() {
		return orgName;
	}

	/**
	 * 机构名称
	 * @param orgName the orgName to set
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/**
	 * 所属父级别
	 * @return the orgParentUuid
	 */
	public String getOrgParentUuid() {
		return orgParentUuid;
	}

	/**
	 * 所属父级别
	 * @param orgParentUuid the orgParentUuid to set
	 */
	public void setOrgParentUuid(String orgParentUuid) {
		this.orgParentUuid = orgParentUuid;
	}


	/**
	 * 类别，区分是部门还是机构
	 * @return the orgProp
	 */
	public String getOrgProp() {
		return orgProp;
	}

	/**
	 * 类别，区分是部门还是机构
	 * @param orgProp the orgProp to set
	 */
	public void setOrgProp(String orgProp) {
		this.orgProp = orgProp;
	}

	/**
	 * 所属父节点信息
	 * @return the orgParentName
	 */
	public String getOrgParentName() {
		if(Constant.DEFAULT_ROOT_CODE.equals(orgParentUuid)){
			return "根节点";
		}
		return orgParentName;
	}

	/**
	 * 所属父节点信息
	 * @param orgParentName the orgParentName to set
	 */
	public void setOrgParentName(String orgParentName) {
		this.orgParentName = orgParentName;
	}

	/**
	 * 单位联系人
	 * @return the linkMan
	 */
	public String getLinkMan() {
		return linkMan;
	}

	/**
	 * 单位联系人
	 * @param linkMan the linkMan to set
	 */
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	/**
	 * 联系人电话
	 * @return the linkMobile
	 */
	public String getLinkMobile() {
		return linkMobile;
	}

	/**
	 * 联系人电话
	 * @param linkMobile the linkMobile to set
	 */
	public void setLinkMobile(String linkMobile) {
		this.linkMobile = linkMobile;
	}

	/**
	 * 对应地图的名称
	 * @return the mapName
	 */
	public String getMapName() {
		return mapName;
	}

	/**
	 * 对应地图的名称
	 * @param mapName the mapName to set
	 */
	public void setMapName(String mapName) {
		this.mapName = mapName;
	}
	
	
	
	

}
