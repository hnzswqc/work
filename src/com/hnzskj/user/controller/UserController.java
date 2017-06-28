/*
 * @项目名称: spms
 * @文件名称: UserController.java
 * @日期: 2017-4-5 下午06:51:42  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.user.controller;

import java.io.IOException;
import java.util.HashMap;
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
import com.hnzskj.common.util.encry.Encrypt;
import com.hnzskj.user.model.User;
import com.hnzskj.user.service.IUserService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：UserController.java   <br/>
 * 类描述：逻辑控制层   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-5 下午06:51:42   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-5 下午06:51:42   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="user")
public class UserController extends BaseController<User> {

	/**
	 * 业务注入
	 */
	@Autowired
	private IUserService userService = null;
	
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
		super.setBaseService(userService);
	}
	
	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()User user, PageBean<User> pageBean) {
		ModelAndView modelAndView = super.index(user, pageBean);
		return modelAndView;
	}
	
	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@RequestMapping(value="updPassword")
	@ResponseBody
	public String updPassword(@ModelAttribute()User user) {
		User currentUser = Constant.getCurrentLoginUser();
		boolean result = false;
		String text="修改成功";
		if(!currentUser.getPassword().equals(Encrypt.digest(user.getPassword()))){
			text="原密码不正确！";
			return new Json(result,text).toJson();
		}
		currentUser.setPassword(Encrypt.digest(user.getNewPassword()));
		result = userService.updPassword(currentUser);
		return new Json(result,text).toJson();
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
	public String modify(@ModelAttribute()User user){
		if(StringUtils.isEmpty(user.getUuid())){
			user.setUuid(UUID.randomUUID().toString());//设置主键
			user.setPassword(Encrypt.digest(Constant.DEFAULT_PASSWORD));//默认密码
			return super.add(user);
		}
		return super.update(user);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()User user) {
		return super.delete(user);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="findByPrimaryKey")
	@ResponseBody
	public String findByPrimaryKey(@ModelAttribute()User user) {
		return super.findByPrimaryKey(user);
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
	@RequestMapping(value="checkLoginName")
	@ResponseBody
	public String checkLoginName(@ModelAttribute()User user){
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Boolean> map = new HashMap<String, Boolean>(); 
		map.put("valid", true);
		String result="{\"valid\":true}";
		try {
			if(StringUtils.isNotEmpty(user.getUuid())){
				map.put("valid", true);
			}else{
				if(null!=userService.findByExample(user)){
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
	 * 方法描述：进入修改密码页面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午07:28:14<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping("setPassword")
	public ModelAndView setPassword(){
		ModelAndView modelAndView = new ModelAndView("user/password");
		return modelAndView;
	}
	
	
	
}
