/*
 * @项目名称: spms
 * @文件名称: AppServiceImpl.java
 * @日期: 2017-4-13 下午04:28:46  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.app.mapper.AppMapper;
import com.hnzskj.app.model.App;
import com.hnzskj.app.model.Chart;
import com.hnzskj.app.service.IAppService;
import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.shell.PortUtil;
import com.hnzskj.org.model.Org;
import com.hnzskj.server.mapper.ServerMapper;
import com.hnzskj.server.model.Server;
import com.hnzskj.user.model.User;

/**    
 * 项目名称：spms   <br/>
 * 类名称：AppServiceImpl.java   <br/>
 * 类描述：业务实现类   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-13 下午04:28:46   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-13 下午04:28:46   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service("IAppService")
public class AppServiceImpl extends BaseServiceImpl<App, AppMapper> implements IAppService {
	
	
	private Logger log = Logger.getLogger(AppServiceImpl.class);
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6265342837063522503L;
	
	/**
	 * 业务注入
	 */
	@Autowired(required=true)
	private AppMapper appMapper = null;
	
	/**
	 * 业务注入
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
		super.setBaseMapper(appMapper);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#queryOrgServerList()
	 */
	public List<Org> queryOrgServerList() {
		return appMapper.queryOrgServerList();
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#findOrgServerApp(java.lang.String)
	 */
	public App findOrgServerApp(App app) {
		return appMapper.findOrgServerApp(app);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#updateStatus(com.hnzskj.app.model.App)
	 */
	public int updateStatus(App app) {
		return appMapper.updateStatus(app);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#addTaskApp(com.hnzskj.app.model.App)
	 */
	public boolean addTaskApp(App app) {
		int result = appMapper.addTaskApp(app);
		return result>0?true:false;
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#addTaskServer(com.hnzskj.server.model.Server)
	 */
	public boolean addTaskServer(Server server) {
		int result = appMapper.addTaskServer(server);
		return result>0?true:false;
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#findList(com.hnzskj.app.model.App)
	 */
	public List<App> findList(App app) {
		return appMapper.findList(app);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#queryErrorOrgList()
	 */
	public List<App> queryErrorOrgList() {
		return appMapper.queryErrorOrgList();
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#queryOrgStatusCountList()
	 */
	public List<Chart> queryOrgStatusCountList() {
		return appMapper.queryOrgStatusCountList();
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#queryOrgAppCountList()
	 */
	public List<Chart> queryOrgAppCountList() {
		return appMapper.queryOrgAppCountList();
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#queryOrgServerCountList()
	 */
	public List<Chart> queryOrgServerCountList() {
		return appMapper.queryOrgServerCountList();
	}
	
	
	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#runTask(com.hnzskj.user.model.User, java.lang.String)
	 */
	public void runTask(User user,String timerUuid){
		List<Server> list = serverMapper.find(null);
		 if(null==list||list.isEmpty()){
			 return;
		 }
		 String userName =null;
		 String userUuid = null;
		 Integer type = null;
		 if(null!=user){
			 userName = user.getUserName();
			 userUuid = user.getUserUuid();
			 type = Constant.TASK_TYPE_HAND;
		 }else{
			 type = Constant.TASK_TYPE_AUTO;
		 }
		 
		 boolean result = false;
		 App app = null;
		 //遍历服务器信息
		 for (Server server : list) {
			log.debug("开始检测"+server.getServerName()+"/"+server.getServerIp()+"服务器.......");
			result = PortUtil.isPing(server.getServerIp());
			
			server.setUserName(userName);
			server.setUserUuid(userUuid);
			server.setType(type);
			server.setTimerUuid(timerUuid);
			//开始检测服务器下应用信息
			app = new App();
			app.setServerUuid(server.getUuid());
			if(!result){
				addTaskResult(server);
				log.debug(server.getServerName()+"/"+server.getServerIp()+"服务器IP不通，应用停止检测......");
				//如果IP不同，则其下的所有程序状态都为未知状态。
				app.setRunStatus(Constant.STATUS_UNKNOW);//未知状态
				appMapper.updApp(app);
				continue;
			}
			server.setStatus(Constant.STATUS_NORMAL);
			addTaskResult(server);
			
			
			List<App> appList = appMapper.findList(app);
			if(null==appList||appList.isEmpty()){
				log.debug(server.getServerName()+"/"+server.getServerIp()+"下不存在应用信息，停止检测......");
				continue;
			}
			log.debug("开始检测"+server.getServerName()+"/"+server.getServerIp()+"下应用信息......");
			for (App ap : appList) {
				 ap.setUserName(userName);
				 ap.setUserUuid(userUuid);
				 ap.setType(type);
				 ap.setTimerUuid(timerUuid);
				 checkApp(ap);
			}
			log.debug(server.getServerName()+"/"+server.getServerIp()+"下应用信息检测完毕......");
		 }
			
	}
	
	
	 /**
	  * 
	  * 方法描述：检测APP运行状态<br/>
	  * 创建人：King   <br/>
	  * 创建时间：2017-4-18 下午04:37:57<br/>         
	  * @param <br/>   
	  * @return <br/>   
	  * @version   1.0<br/>
	  */
	 void checkApp(App app){
	 try {
			PortUtil.isHostConnectable(app.getServerIp(), app.getPort());
			app.setRunStatus(Constant.STATUS_START);
			log.debug(app.getName()+"服务运行正常......");
		} catch (Exception e) {
			app.setRunStatus(Constant.STATUS_STOP);
			log.debug(app.getName()+"服务运行异常，已设置停止......");
		}
		addTaskResult(app);
	 }
	 
	 
	 /**
	  * 
	  * 方法描述：记录服务运行状态信息<br/>
	  * 创建人：King   <br/>
	  * 创建时间：2017-4-18 下午04:26:36<br/>         
	  * @param <br/>   
	  * @return <br/>   
	  * @version   1.0<br/>
	  */
	 void addTaskResult(Server server){
		 //server.setType(Constant.TASK_TYPE_AUTO);
		 server.setNote(Constant.TASK_FOREIGN_NAME_SERVER);
		 //添加任务结果信息
		 appMapper.addTaskServer(server);
		 //更改状态
		 serverMapper.updateStatus(server);
	 }
	 
	 /**
	  * 
	  * 方法描述：继续app运行状态信息<br/>
	  * 创建人：King   <br/>
	  * 创建时间：2017-4-18 下午04:26:21<br/>         
	  * @param <br/>   
	  * @return <br/>   
	  * @version   1.0<br/>
	  */
	 void addTaskResult(App app){
		// app.setType(Constant.TASK_TYPE_AUTO);
		 app.setNote(Constant.TASK_FOREIGN_NAME_APP);
		 //添加任务结果信息
		 appMapper.addTaskApp(app);
		 //更改状态
		 serverMapper.updateStatus(app);
	 }


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#findAllApp()
	 */
	public List<App> findAllApp() {
		return appMapper.findAllApp();
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.app.service.IAppService#findByUuid(com.hnzskj.app.model.App)
	 */
	public App findByUuid(App app) {
		return appMapper.findByUuid(app);
	}
	
	
	

}
