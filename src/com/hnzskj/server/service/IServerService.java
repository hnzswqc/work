/*
 * @项目名称: spms
 * @文件名称: IServerService.java
 * @日期: 2017-4-12 下午04:15:05  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.server.service;

import com.hnzskj.common.service.IBaseService;
import com.hnzskj.server.model.Server;

/**    
 * 项目名称：spms   <br/>
 * 类名称：IServerService.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-12 下午04:15:05   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-12 下午04:15:05   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public interface IServerService extends IBaseService<Server> {
	
	/**
	 * 
	 * 方法描述：更改状态<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-18 下午02:07:44<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	int updateStatus(Server server);
	
	/**
	 * 
	 * 方法描述：查询当前服务器下的应用信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-18 下午03:08:21<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	int findAppCount(Server server); 

}
