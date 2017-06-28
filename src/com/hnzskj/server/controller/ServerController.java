/*
 * @项目名称: spms
 * @文件名称: ServerController.java
 * @日期: 2017-4-12 下午04:17:49  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.server.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.Json;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.shell.PortUtil;
import com.hnzskj.org.model.Org;
import com.hnzskj.org.service.IOrgService;
import com.hnzskj.server.model.Server;
import com.hnzskj.server.service.IServerService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：ServerController.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-12 下午04:17:49   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-12 下午04:17:49   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="server")
public class ServerController extends BaseController<Server> {

	/**
	 * 业务注入
	 */
	@Autowired(required=true)
	private IServerService serverService = null;
	
	/**
	 * 部门注入
	 */
	@Autowired(required=true)
	private IOrgService orgService = null;
	
	
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
		super.setBaseService(serverService);
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
	public String modify(@ModelAttribute()Server server){
		String msg=null;
		if(StringUtils.isEmpty(server.getUuid())){
			server.setUuid(UUID.randomUUID().toString());//设置主键
			msg =  super.add(server);
		}else{
			msg = super.update(server);
		}
		//判断当前服务器是否能够正常。
		boolean result = PortUtil.isPing(server.getServerIp());
		if(result){
			server.setStatus(Constant.STATUS_NORMAL);
		}else{
			server.setStatus(Constant.STATUS_ANOMALY);
		}
		serverService.updateStatus(server);
		return msg;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()Server server) {
		//判断当前节点下是否存在应用 信息。
		int result = serverService.findAppCount(server);
		if(result>0){
			return 	new Json(false,"<span style='color:red;font-weight:bold;'>该服务器下存在应用信息，请先删除！</span>").toJson();
		}
		return super.delete(server);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="findByPrimaryKey")
	@ResponseBody
	public String findByPrimaryKey(@ModelAttribute()Server server) {
		return super.findByPrimaryKey(server);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@RequestMapping(value="main")
	public ModelAndView main() {
		ModelAndView modelAndView = new ModelAndView("server/main");
		modelAndView.addObject(DEFAULT_MENU,"server");
		return modelAndView;
	}
	

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()Server server, @ModelAttribute()PageBean<Server> pageBean) {
		if(StringUtils.isNotEmpty(server.getOrgName())){
			try {
				server.setOrgName(URLDecoder.decode(server.getOrgName(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return super.index(server, pageBean);
	}
	
	
	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@RequestMapping(value="tree")
	public ModelAndView tree() {
		ModelAndView modelAndView = new ModelAndView("server/tree");
		List<Org> orgList = orgService.find(null,new Org()).getList();
		modelAndView.addObject("orgList", orgList);
		modelAndView.addObject(DEFAULT_MENU,"server");
		return modelAndView;
	}
	
	
	
	/**
	 * 
	 * 方法描述：验证IP地址是否已经存在<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-6 下午05:56:50<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="checkServerIp")
	@ResponseBody
	public String checkServerIp(@ModelAttribute()Server server){
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Boolean> map = new HashMap<String, Boolean>(); 
		map.put("valid", true);
		String result="{\"valid\":true}";
		try {
			if(StringUtils.isNotEmpty(server.getUuid())){
				map.put("valid", true);
			}else{
				if(null!=serverService.findByExample(server)){
					map.put("valid", false);
				}
			}
			result = mapper.writeValueAsString(map);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 
	 * 方法描述：判断服务器IP是否通畅<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-13 下午03:00:14<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="testConnection")
	@ResponseBody
	public String testConnection(@ModelAttribute()Server server){
		boolean result = false;
		if(StringUtils.isNotEmpty(server.getServerIp())){
			result= PortUtil.isPing(server.getServerIp());
		}
		if(result){
			server.setStatus(Constant.STATUS_NORMAL);
		}else{
			server.setStatus(Constant.STATUS_ANOMALY);
		}
		serverService.updateStatus(server);
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}
	
	
}
