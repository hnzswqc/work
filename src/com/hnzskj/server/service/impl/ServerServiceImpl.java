/*
 * @项目名称: spms
 * @文件名称: ServerServiceImpl.java
 * @日期: 2017-4-12 下午04:15:47  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.server.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.server.mapper.ServerMapper;
import com.hnzskj.server.model.Server;
import com.hnzskj.server.service.IServerService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：ServerServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-12 下午04:15:47   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-12 下午04:15:47   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class ServerServiceImpl extends BaseServiceImpl<Server, ServerMapper> implements IServerService{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private ServerMapper serverMapper = null;

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
		super.setBaseMapper(serverMapper);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.server.service.IServerService#updateStatus(com.hnzskj.server.model.Server)
	 */
	public int updateStatus(Server server) {
		return serverMapper.updateStatus(server);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.server.service.IServerService#findAppCount(com.hnzskj.server.model.Server)
	 */
	public int findAppCount(Server server) {
		return serverMapper.findAppCount(server);
	}
	
	
	
	

}
