/*
 * @项目名称: spms
 * @文件名称: TaskController.java
 * @日期: 2017-4-20 下午06:16:45  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.task.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.app.util.HandTaskRunable;
import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.Json;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.org.model.Org;
import com.hnzskj.org.service.IOrgService;
import com.hnzskj.task.model.Task;
import com.hnzskj.task.service.ITaskService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：TaskController.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-20 下午06:16:45   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-20 下午06:16:45   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="task")
public class TaskController extends BaseController<Task> {
	/**
	 * 业务注入
	 */
	@Autowired(required=true)
	private ITaskService taskService = null;
	
	/**
	 * 业务注入
	 */
	@Autowired
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
		super.setBaseService(taskService);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.String)
	 */
	@Override
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()Task task) {
		return super.delete(task.getUuid());
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="findByPrimaryKey")
	@ResponseBody
	public String findByPrimaryKey(@ModelAttribute()Task task) {
		return super.findByPrimaryKey(task);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()Task task, @ModelAttribute()PageBean<Task> pageBean) {
		ModelAndView modelAndView =  super.index(task, pageBean);
		List<Org> orgList = orgService.find(null,new Org()).getList();
		modelAndView.addObject("list", orgList);
		return modelAndView;
	}
	
	
	/**
	 * 
	 * 方法描述：手动执行定时任务信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-24 上午09:47:57<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@ResponseBody
	@RequestMapping(value="runTask")
	public String runTask(){
		HandTaskRunable handTaskRunable = new HandTaskRunable(Constant.getCurrentLoginUser());
		Thread thread = new Thread(handTaskRunable);
		thread.start();
		return new Json(true,"检测任务已经启动").toJson();
	}
	
}
