/*
 * @项目名称: spms
 * @文件名称: AppController.java
 * @日期: 2017-4-13 下午04:31:11  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.app.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.app.model.App;
import com.hnzskj.app.service.IAppService;
import com.hnzskj.app.util.CommonRunable;
import com.hnzskj.app.util.ConnRunable;
import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.Json;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.shell.PortUtil;
import com.hnzskj.org.model.Org;

/**    
 * 项目名称：spms   <br/>
 * 类名称：AppController.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-13 下午04:31:11   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-13 下午04:31:11   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="app")
public class AppController extends BaseController<App> {

	
	/**
	 * 业务注入
	 */
	@Autowired(required=true)
	private IAppService appService = null;
	
	
	/**
	 * 
	 * 方法描述：信息注入<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午11:31:58<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@Autowired
	public void setBaseService() {
		super.setBaseService(appService);
	}
	

	/**
	 * 
	 * 方法描述：添加或修改的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 下午03:11:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@ResponseBody
	@RequestMapping(value="modify")
	public String modify(@ModelAttribute()App app){
		String result =null;
		if(StringUtils.isEmpty(app.getUuid())){
			app.setUuid(UUID.randomUUID().toString());//设置主键
			result= super.add(app);
		}else{
			result = super.update(app);
		}
		//获取单位服务器应用信息
		app = appService.findOrgServerApp(app);
		//开启新线程
		ConnRunable connRunable = new ConnRunable(app);
		Thread thread=new Thread(connRunable);
		thread.start();
		
		return result;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()App app) {
		return super.delete(app);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="findByPrimaryKey")
	@ResponseBody
	public String findByPrimaryKey(@ModelAttribute()App app) {
		return super.findByPrimaryKey(app);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@RequestMapping(value="main")
	public ModelAndView main() {
		ModelAndView modelAndView = new ModelAndView("app/main");
		modelAndView.addObject(DEFAULT_MENU,"app");
		return modelAndView;
	}
	

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()App app, @ModelAttribute()PageBean<App> pageBean) {
		if(StringUtils.isNotEmpty(app.getServerName())){
			try {
				app.setServerName(URLDecoder.decode(app.getServerName(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if(null!=app.getStatus()&&1==app.getStatus()){
			app.setOrgUuid(app.getServerUuid());
		}
		return super.index(app, pageBean);
	}
	
	
	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@RequestMapping(value="tree")
	public ModelAndView tree() {
		ModelAndView modelAndView = new ModelAndView("app/tree");
		List<Org> orgList = appService.queryOrgServerList();
		modelAndView.addObject(DEFAULT_MENU,"app");
		modelAndView.addObject("orgList",orgList);
		return modelAndView;
	}
	
	
	/**
	 * 
	 * 方法描述：判断应用端口是否能够ping通<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-13 下午03:00:14<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="testConnection")
	@ResponseBody
	public String testConnection(@ModelAttribute()App app){
		boolean result = false;
		if(StringUtils.isEmpty(app.getUuid()))
			return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
		app = appService.findOrgServerApp(app);
		if(null==app)return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
		
		String msg = FAIL_STRING;
		try {
			result = PortUtil.isPing(app.getServerIp());//判断网络是否通畅
			
			app.setRunStatus(Constant.STATUS_UNKNOW);
			if(result){
				result = PortUtil.isHostConnectable(app.getServerIp(), app.getPort());
				if(result){
					app.setRunStatus(Constant.STATUS_START);
					msg = SUCCESS_STRING;
				}else{
					app.setRunStatus(Constant.STATUS_STOP);
				}
			}
		
		} catch (Exception e) {
			
		}
		appService.updateStatus(app);//更改当前状态
		return new Json(result,msg).toJson();
	}
	
	
	/**
	 * 
	 * 方法描述：服务开启关闭<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-14 下午05:12:01<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="serverCommon")
	@ResponseBody
	public String serverCommon(@ModelAttribute()App app,@RequestParam()int type){
		boolean result = true;
		if(StringUtils.isEmpty(app.getUuid()))
			return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
		app = appService.findOrgServerApp(app);
		if(null==app)return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
		
		if(type==1){
			app.setRunStatus(Constant.STATUS_STARTING);
		}else{
			app.setRunStatus(Constant.STATUS_STOPING);
		}
		appService.updateStatus(app);
		
		//开启新线程
		CommonRunable commonRunable = new CommonRunable(app,type);
		Thread thread=new Thread(commonRunable);
		thread.start();
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
		
	}
	
	/**
	 * 
	 * 方法描述：查询所有的服务器应用信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-24 下午04:41:26<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="findAllApp")
	public ModelAndView findAllApp(String export){
		ModelAndView modelAndView = null;
		if(StringUtils.isNotEmpty(export)){
			 modelAndView = new ModelAndView("app/list_export");
		}else{
			 modelAndView = new ModelAndView("app/list");
		}
		buildMap(modelAndView);
		modelAndView.addObject("menu","app");
		return modelAndView;
	}


	/**
	 * 方法描述：封装所有信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-25 下午02:57:45<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>   
	 */
	private void buildMap(ModelAndView modelAndView) {
		List<App> list = appService.findAllApp();
		if(null==list||list.isEmpty()){
			return;
		}
		//部门
		LinkedHashMap<String, App> orgList = new LinkedHashMap<String, App>();
		
		//服务器集合
		LinkedHashMap<String, LinkedHashMap<String,App>> serverList = new LinkedHashMap<String, LinkedHashMap<String,App>>();
		
		//服务器
		LinkedHashMap<String, App> serverMap = null;
		
		//应用集合
		LinkedHashMap<String, LinkedHashMap<String,App>> appList = new LinkedHashMap<String, LinkedHashMap<String,App>>();
		
		//服务器
		LinkedHashMap<String, App> appMap = null;
		
		String orgUuid ="";
		String serverUuid ="";
		for (App app : list) {
			orgUuid = app.getOrgUuid();
			serverUuid = app.getServerUuid();
			//单位
			if(null==orgList.get(orgUuid)){
				app.setCount(1);
			}else{
				app.setCount(orgList.get(orgUuid).getCount()+1);
				
			}
			orgList.put(orgUuid, app);
			
			//服务器
			if(null!=serverList.get(orgUuid)){
				serverMap = serverList.get(orgUuid);
				if(null==serverMap){
					serverMap = new LinkedHashMap<String, App>();
				}
			}else{
				serverMap = new LinkedHashMap<String, App>();
			}
			
			
			serverMap.put(serverUuid, app);
			serverList.put(orgUuid,serverMap);
			
			//应用
			if(null!=appList.get(serverUuid)){
				appMap = appList.get(serverUuid);
				if(null==serverMap){
					appMap = new LinkedHashMap<String, App>();
				}
			}else{
				appMap = new LinkedHashMap<String, App>();
			}
			appMap.put(app.getUuid(), app);
			appList.put(serverUuid,appMap);
		}
		modelAndView.addObject("orgList", orgList);
		modelAndView.addObject("serverList", serverList);
		modelAndView.addObject("appList", appList);
	}
	
	
	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@RequestMapping(value="findByUuid")
	@ResponseBody
	public String findByUuid(@ModelAttribute()App app) {
		app = appService.findByUuid(app);
		return new Json(SUCCESS, app).toJson();
	}

}
