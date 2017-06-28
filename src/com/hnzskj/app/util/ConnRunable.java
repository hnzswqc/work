/*
 * @项目名称: spms
 * @文件名称: ConnRunable.java
 * @日期: 2017-4-18 上午10:45:11  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.util;

import java.io.IOException;

import org.apache.log4j.Logger;

import com.hnzskj.app.model.App;
import com.hnzskj.app.service.IAppService;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.shell.PortUtil;
import com.hnzskj.common.util.spring.SpringConfigTools;

/**    
 * 项目名称：spms   <br/>
 * 类名称：ConnRunable.java   <br/>
 * 类描述： 测试当前服务是否正常联通的方法  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-18 上午10:45:11   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-18 上午10:45:11   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class ConnRunable implements Runnable {
	/**
	 * 日志
	 */
	private Logger log = Logger.getLogger(CommonRunable.class);
	
	public ConnRunable(){}
	
	/**
	 * 构造函数
	 * @param app
	 */
	public ConnRunable(App app){
		this.app = app;
	}
	
	/**
	 * app对象
	 */
	private  App app = new App();
	
	
	/**
	 * app对象
	 * @return the app
	 */
	public App getApp() {
		return app;
	}



	/**
	 * app对象
	 * @param app the app to set
	 */
	public void setApp(App app) {
		this.app = app;
	}



	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	public void run() {
		if(null==app){
			return;
		}
		log.info("进入run方法...............");
		log.info("参数信息："+app.getServerIp()+"/"+app.getLoginName()+"/"+app.getPassword()+"/"+app.getPort());
		try {
			PortUtil.isHostConnectable(app.getServerIp(), app.getPort());
			app.setRunStatus(Constant.STATUS_START);
		} catch (IOException e) {
			app.setRunStatus(Constant.STATUS_STOP);
		}
		updStatus();//更改当前状态
		log.info("run方法执行结束...............");
	}
	
	/**
	 * 
	 * 方法描述：更改状态<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-17 下午05:34:59<br/>         
	 * @param <br/>   
	 * @return void<br/>   
	 * @version   1.0<br/>
	 */
	private void updStatus(){
		IAppService appService = (IAppService)SpringConfigTools.getBean(IAppService.class);
		appService.updateStatus(app);
		log.info(app.getName()+"状态更改为："+Constant.STATUSMAP_VALUE.get(app.getRunStatus()));
	}
	

}
