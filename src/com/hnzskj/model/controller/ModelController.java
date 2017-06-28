/*
 * @项目名称: ewsm
 * @文件名称: ModelController.java
 * @日期: 2016-10-9 上午10:16:09  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.model.controller;

import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.model.model.Model;
import com.hnzskj.model.service.IModelService;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：ModelController.java   <br/>
 * 类描述：预警模块管理   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-9 上午10:16:09   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-9 上午10:16:09   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="/model")
public class ModelController extends BaseController<Model> {

	/**
	 * 业务注入
	 */
	@Autowired(required=true)
	private IModelService modelService = null;
	
	
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
		super.setBaseService(modelService);
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
	public String modify(@ModelAttribute()Model model){
		if(StringUtils.isEmpty(model.getUuid())){
			model.setUuid(UUID.randomUUID().toString());//设置主键
			model.setModelDeleteType(Constant.DELETE_TYPE_NO);//未删除标记
			return super.add(model);
		}
		return super.update(model);
	}
	


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.String)
	 */
	@Override
	@RequestMapping(value="deleteBatch")
	@ResponseBody
	public String delete(String uuid) {
		return super.delete(uuid);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="findByPrimaryKey")
	@ResponseBody
	public String findByPrimaryKey(@ModelAttribute()Model model) {
		return super.findByPrimaryKey(model);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()Model model, @ModelAttribute()PageBean<Model> pageBean) {
		ModelAndView modelAndView = super.index(model, pageBean);
		modelAndView.setViewName("model/list_model");
		modelAndView.addObject("model", model);
		modelAndView.addObject("menu", "model");
		return modelAndView;
	}
}
