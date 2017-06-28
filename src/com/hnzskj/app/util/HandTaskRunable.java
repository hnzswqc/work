/*
 * @项目名称: spms
 * @文件名称: HandTaskRunable.java
 * @日期: 2017-4-24 上午09:16:04  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.util;

import java.util.Date;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.hnzskj.app.service.IAppService;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.spring.SpringConfigTools;
import com.hnzskj.timer.model.Timer;
import com.hnzskj.timer.server.ITimerService;
import com.hnzskj.user.model.User;

/**    
 * 项目名称：spms   <br/>
 * 类名称：HandTaskRunable.java   <br/>
 * 类描述：手动执行任务   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-24 上午09:16:04   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-24 上午09:16:04   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class HandTaskRunable implements Runnable {

	/**
	 * 日志
	 */
	private Logger log = Logger.getLogger(HandTaskRunable.class);
	
	
	private IAppService appService=null;
	
	private ITimerService timerService = null;
	/**
	 * 当前用户
	 */
	private User user = new User();
	
	/**
	 * 方法描述：<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-26 下午03:36:12<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>   
	 */
	private void init() {
		appService = (IAppService)SpringConfigTools.getBean(IAppService.class);
		timerService = (ITimerService)SpringConfigTools.getBean(ITimerService.class);
	}
	
	
	public HandTaskRunable(){
		init();
	}
	
	public HandTaskRunable(User user){
		init();
		this.user = user;
	}
	
	
	
	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	public void run() {
		log.debug("手动执行任务开始执行......");
		Date startTime = new Date();
		Timer timer = extracted();
		timerService.add(timer);//添加定时信息
		appService.runTask(user,timer.getUuid());
		Date endTime = new Date();
		long interval = (endTime.getTime() - startTime.getTime())/1000;
		timer.setDuration(interval);
		timerService.update(timer);
		log.debug("手动执行任务执行结束......");
	}


	/**
	 * 方法描述：<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-26 下午03:53:32<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>   
	 */
	private Timer extracted() {
		Timer timer = new Timer();
		timer.setUuid(UUID.randomUUID().toString());
		timer.setTimerName(Constant.TIMER_NAME_CHECK_APP);
		timer.setTimerWay(Constant.TASK_TYPE_HAND);
		if(null!=user){
			timer.setUserUuid(user.getUuid());
			timer.setUserName(user.getUserName());
		}
		return timer;
	}
	

}
