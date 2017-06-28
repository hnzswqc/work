/*
 * @项目名称: spms
 * @文件名称: OrgServiceImpl.java
 * @日期: 2017-4-7 下午03:37:09  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.org.mapper.OrgMapper;
import com.hnzskj.org.model.Org;
import com.hnzskj.org.service.IOrgService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：OrgServiceImpl.java   <br/>
 * 类描述：业务层接口   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-7 下午03:37:09   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-7 下午03:37:09   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class OrgServiceImpl extends BaseServiceImpl<Org, OrgMapper> implements IOrgService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private OrgMapper orgMapper = null;

	/**
	 * 
	 * 方法描述：需要设置对应的mapper类<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-7-31 下午12:30:32<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@Autowired
	public void setBaseMapper(){
		super.setBaseMapper(orgMapper);
	}
	

}
