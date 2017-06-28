/*
 * @项目名称: spms
 * @文件名称: CommonRunable.java
 * @日期: 2017-4-17 下午03:33:32  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.util;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.hnzskj.app.model.App;
import com.hnzskj.app.service.IAppService;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.shell.LinuxUtil;
import com.hnzskj.common.util.shell.TelnetUtil;
import com.hnzskj.common.util.spring.SpringConfigTools;

/**    
 * 项目名称：spms   <br/>
 * 类名称：CommonRunable.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-17 下午03:33:32   <br/>
 * 修改人：King   <br/>
 * 修改时间：2017-4-17 下午03:33:32   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class CommonRunable implements Runnable {

	/**
	 * 日志
	 */
	private Logger log = Logger.getLogger(CommonRunable.class);
	
	/**
	 * app对象
	 */
	private  App app = new App();
	
	/**
	 * 类别
	 */
	private Integer type;
	
	/**
	 * 默认编码方式
	 */
	private final String DEFAULT_CODING="GBK";
	
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


	/**
	 * 类别
	 * @return the type
	 */
	public Integer getType() {
		return type;
	}


	/**
	 * 类别
	 * @param type the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	
	public CommonRunable(){}
	
	
	public CommonRunable(App app,Integer type){
		this.app = app;
		this.type = type;
	}


	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	public void run() {
		log.info("进入run方法...............");
		if(null!=app){	
			log.info("参数信息："+app.getServerIp()+"/"+app.getLoginName()+"/"+app.getPassword()+"/"+app.getPort());
			if(app.getOsName().equals("1")){
				linuxCommon(app, type);
			}else{
				telnetCommon(app, type);
			}
		
			
		}
		log.info("run方法执行结束...............");
	}


	/**
	 * 
	 * 方法描述：调用Linux执行命令<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-17 上午09:36:54<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	private void linuxCommon(App app,int type){
		LinuxUtil linuxUtil = new LinuxUtil(app.getServerIp(), app.getLoginName(), app.getPassword(), DEFAULT_CODING);
		String res=Constant.RESULT_ERROR_CODE;
		Integer status = -1;
		if(type==1){
			res= linuxUtil.exec(app.getStart());
			log.info("linux执行启动命令："+app.getStart());
			status = Constant.STATUS_START;
		}else{
			res= linuxUtil.exec(app.getStop());
			log.info("linux执行关闭命令："+app.getStop());
			status = Constant.STATUS_STOP;
		}
		if(!res.equals(Constant.RESULT_ERROR_CODE)){
			updStatus(status);
		}
	}
	
	/**
	 * 
	 * 方法描述：window调用命令<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-17 上午09:57:24<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	private void telnetCommon(App app, int type){
		TelnetUtil telnet = new TelnetUtil("VT100",">");//Windows,用VT220,否则会乱码  
        telnet.login(app.getServerIp(), 23, app.getLoginName(), app.getPassword());  
        String r1 = "-1";  
        Integer status = -1;
        if(type==1){
        	r1= telnet.sendCommand(app.getStart());
        	log.info("window执行启动命令："+app.getStart());
        	status = Constant.STATUS_START;
		}else{
			r1= telnet.sendCommand(app.getStop());
			log.info("window执行关闭命令："+app.getStop());
			status = Constant.STATUS_STOP;
		}
        telnet.distinct();
        if(StringUtils.isNotBlank(r1)){
        	updStatus(status);
        }

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
	private void updStatus(Integer status){
		app.setRunStatus(status);
		IAppService appService = (IAppService)SpringConfigTools.getBean(IAppService.class);
		appService.updateStatus(app);
		log.info(app.getName()+"状态更改为："+Constant.STATUSMAP_VALUE.get(app.getRunStatus()));
	}
	
	

}
