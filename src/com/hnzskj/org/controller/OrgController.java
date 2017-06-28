/*
 * @项目名称: spms
 * @文件名称: OrgController.java
 * @日期: 2017-4-7 下午03:38:29  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.org.controller;

import java.io.IOException;
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
import com.hnzskj.org.model.Org;
import com.hnzskj.org.service.IOrgService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：OrgController.java   <br/>
 * 类描述： 业务层接口  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-7 下午03:38:29   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-7 下午03:38:29   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="org")
public class OrgController extends BaseController<Org> {

	/**
	 * 业务注入
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
		super.setBaseService(orgService);
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
	@RequestMapping(value="modify")
	@ResponseBody
	public String modify(@ModelAttribute()Org org){
		if(StringUtils.isEmpty(org.getUuid())){
			org.setUuid(UUID.randomUUID().toString());//设置主键
			return super.add(org);
		}
		return super.update(org);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()Org org) {
		int result = orgService.findCount(new Org(org.getUuid()));
		if(result>0){
			return new Json(false,"存在子级单位，请先删除!").toJson();
		}
		return super.delete(org);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="findByPrimaryKey")
	@ResponseBody
	public String findByPrimaryKey(@ModelAttribute()Org org) {
		return super.findByPrimaryKey(org);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()Org org, PageBean<Org> pageBean) {
		ModelAndView modelAndView = super.index(org, pageBean);
		List<Org> orgList = orgService.find(null,new Org()).getList();
		modelAndView.addObject("orgList", orgList);
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：验证登录名是否存在<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-6 下午05:56:50<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="checkOrgCode")
	@ResponseBody
	public String checkOrgCode(@ModelAttribute()Org org){
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Boolean> map = new HashMap<String, Boolean>(); 
		map.put("valid", true);
		String result="{\"valid\":true}";
		try {
			if(StringUtils.isNotEmpty(org.getUuid())){
				map.put("valid", true);
			}else{
				if(null!=orgService.findByExample(org)){
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
	
	
	
}
