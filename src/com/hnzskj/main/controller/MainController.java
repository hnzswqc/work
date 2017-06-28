/*
 * @项目名称: spms
 * @文件名称: MainController.java
 * @日期: 2017-4-12 下午05:26:09  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.main.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.app.model.App;
import com.hnzskj.app.model.Chart;
import com.hnzskj.app.service.IAppService;
import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.Json;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.encry.Encrypt;
import com.hnzskj.user.model.User;
import com.hnzskj.user.service.IUserService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：MainController.java   <br/>
 * 类描述： 框架跳转  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-12 下午05:26:09   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-12 下午05:26:09   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="/")
public class MainController extends BaseController<User>{

	
	/**
	 * 业务注入
	 */
	@Autowired
	private IAppService appService = null;
	
	/**
	 * 业务注入
	 */
	@Autowired
	private IUserService userService = null;
	
	
	/**
	 * 
	 * 方法描述：进入主框架界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-12 下午05:28:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="login")
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：进入主框架界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-12 下午05:28:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="adminLogin")
	public ModelAndView adminLogin(@ModelAttribute()User user){
		ModelAndView modelAndView = new ModelAndView("main");
		if(StringUtils.isEmpty(user.getLoginName())||StringUtils.isEmpty(user.getPassword())){
			modelAndView.setViewName("login");
			modelAndView.addObject("loginMsg", "loginError");
			return modelAndView;
		}
		
		user.setPassword(Encrypt.digest(user.getPassword()));
		user = userService.login(user);
		if(null==user){
			modelAndView.setViewName("login");
			modelAndView.addObject("loginMsg", "loginError");
			return modelAndView;
		}
		setSessionAttr(Constant.SESSION_USER_KEY, user);
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：退出登录<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午05:40:54<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="loginOut")
	public ModelAndView loginOut(String info,String loginMsg){
		destorySessionAttr(Constant.SESSION_USER_KEY);
		ModelAndView modelAndView = new ModelAndView("login");
		modelAndView.addObject("loginMsg", loginMsg);
		return modelAndView;
	}
	
	
	
	
	/**
	 * 
	 * 方法描述：进入主框架界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-12 下午05:28:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="main")
	public ModelAndView main(){
		ModelAndView modelAndView = new ModelAndView("main");
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：进入head界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-12 下午05:28:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="header")
	public ModelAndView header(){
		ModelAndView modelAndView = new ModelAndView("header");
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：进入主界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-19 上午10:04:43<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="index")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：地图展示信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-19 下午04:44:48<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="mapIndex")
	public ModelAndView mapIndex(){
		ModelAndView modelAndView = new ModelAndView("index/map");
		List<App> list = appService.queryErrorOrgList();
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	
	/**
	 * 
	 * 方法描述：地图展示信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-19 下午04:44:48<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="orgAppStatusCountIndex")
	public ModelAndView orgAppStatusCountIndex(){
		ModelAndView modelAndView = new ModelAndView("index/orgAppStatusCount");
		List<Chart> list = appService.queryOrgStatusCountList();
		modelAndView.addObject("list", list);
		return modelAndView;
	}

	/**
	 * 
	 * 方法描述：地图展示信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-19 下午04:44:48<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="orgAppCountIndex")
	public ModelAndView orgAppCountIndex(){
		ModelAndView modelAndView = new ModelAndView("index/orgAppCount");
		List<Chart> list = appService.queryOrgAppCountList();
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：地图展示信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-19 下午04:44:48<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="orgServerCountIndex")
	public ModelAndView orgServerCountIndex(){
		ModelAndView modelAndView = new ModelAndView("index/orgServerCount");
		List<Chart> list = appService.queryOrgServerCountList();
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：生成授权码<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 下午03:09:05<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="test")
	@ResponseBody
	public String test(String date){
		if(StringUtils.isNotEmpty(date)){
			return new Json(true,Encrypt.base64(date)).toJson();
		}
		String lic = Constant.getLic();
		return new Json(true,Encrypt.getDecoderBase64(lic)).toJson();
	}
	
	
	/**
	 * 
	 * 方法描述：测试主界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-13 下午06:18:22<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="content")
	public ModelAndView content(){
		ModelAndView modelAndView = new ModelAndView("/content/main");
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：左侧菜单栏<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-14 上午10:41:53<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="left")
	public ModelAndView left(){
		ModelAndView modelAndView = new ModelAndView("/content/left");
		return modelAndView;
	}
	
	
	/**
	 * 
	 * 方法描述：中间工具栏<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-14 下午06:24:37<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="middle")
	public ModelAndView middle(){
		ModelAndView modelAndView = new ModelAndView("/middle");
		return modelAndView;
	}
	
}
