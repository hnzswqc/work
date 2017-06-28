/*
 * @项目名称: spms
 * @文件名称: IAppService.java
 * @日期: 2017-4-13 下午04:27:58  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.service;

import java.util.List;

import com.hnzskj.app.model.App;
import com.hnzskj.app.model.Chart;
import com.hnzskj.common.service.IBaseService;
import com.hnzskj.org.model.Org;
import com.hnzskj.server.model.Server;
import com.hnzskj.user.model.User;

/**    
 * 项目名称：spms   <br/>
 * 类名称：IAppService.java   <br/>
 * 类描述： 应用业务层接口  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-13 下午04:27:58   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-13 下午04:27:58   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public interface IAppService extends IBaseService<App> {
	/**
	 * 
	 * 方法描述：查询部门下服务器信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-14 上午10:14:29<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	List<Org> queryOrgServerList();
	
	/**
	 * 
	 * 方法描述：查询单位服务器应用<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-14 下午03:18:23<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	App findOrgServerApp(App app);
	
	/**
	 * 
	 * 方法描述：修改状态<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-17 下午04:13:35<br/>         
	 * @param <br/>   
	 * @return int<br/>   
	 * @version   1.0<br/>
	 */
	int updateStatus(App app);
	
	/**
	 * 
	 * 方法描述：添加任务日志信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-18 下午04:56:08<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	boolean addTaskApp(App app);
	
	/**
	 * 
	 * 方法描述：添加任务日志信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-18 下午04:56:08<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	boolean addTaskServer(Server server);
	
	/**
	 * 
	 * 方法描述：查询所有信息 <br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-19 上午09:12:50<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	List<App> findList(App app);
	
	/**
	 * 
	 * 方法描述：查询存在问题的单位信息 <br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-19 上午09:12:50<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	List<App> queryErrorOrgList();
	
	/**
	 * 
	 * 方法描述：查询单位app应用状态太数量信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-20 下午03:20:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	List<Chart> queryOrgStatusCountList();
	
	/**
	 * 
	 * 方法描述： 查询单位下应用数量信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-20 下午03:20:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	List<Chart> queryOrgAppCountList();
	
	/**
	 * 
	 * 方法描述： 查询单位下服务器数量<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-20 下午03:20:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	List<Chart> queryOrgServerCountList();
	
	/**
	 * 
	 * 方法描述：定时任务<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-24 上午09:28:15<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public void runTask(User user,String timerUuid);
	
	/**
	 * 
	 * 方法描述：查询所有应用<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-24 下午04:01:36<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	List<App> findAllApp();
	
	/**
	 * 
	 * 方法描述：获取详细信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-25 下午03:52:53<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	App findByUuid(App app);
}

