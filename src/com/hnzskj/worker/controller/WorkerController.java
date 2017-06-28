/*
 * @项目名称: work
 * @文件名称: WorkerController.java
 * @日期: 2017-6-4 下午04:04:58  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.worker.controller;

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
import com.hnzskj.common.model.PageBean;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.worker.model.Worker;
import com.hnzskj.worker.service.IWorkerService;
import com.hnzskj.worktype.model.WorkType;
import com.hnzskj.worktype.service.IWorkTypeService;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkerController.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-4 下午04:04:58   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-4 下午04:04:58   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@RequestMapping(value="worker")
@Controller
public class WorkerController extends BaseController<Worker> {

	/**
	 * 业务注入
	 */
	@Autowired
	private IWorkerService workerService = null;
	
	/**
	 * 业务注入
	 */
	@Autowired
	private IWorkTypeService workTypeService = null;
	
	
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
		super.setBaseService(workerService);
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
	public String modify(@ModelAttribute()Worker worker){
		if(StringUtils.isEmpty(worker.getUuid())){
			worker.setUuid(UUID.randomUUID().toString());//设置主键
			return super.add(worker);
		}
		return super.update(worker);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()Worker worker) {
		return super.delete(worker);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@RequestMapping(value="findByPrimaryKey")
	@ResponseBody
	public String findByPrimaryKey(@ModelAttribute()Worker worker) {
		return super.findByPrimaryKey(worker);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()Worker worker, PageBean<Worker> pageBean) {
		ModelAndView modelAndView = super.index(worker, pageBean);
		PageBean<WorkType> p = workTypeService.find(null, new WorkType(Constant.SYS_WORK_TYPE));
		modelAndView.addObject("list",p.getList());
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
	@RequestMapping(value="checkExists")
	@ResponseBody
	public String checkExists(@ModelAttribute()Worker worker){
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Boolean> map = new HashMap<String, Boolean>(); 
		map.put("valid", true);
		String result="{\"valid\":true}";
		try {
			if(StringUtils.isNotEmpty(worker.getUuid())){
				map.put("valid", true);
			}else{
				if(null!=workerService.findByExample(worker)){
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
