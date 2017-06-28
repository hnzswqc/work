/*
 * @项目名称: spms
 * @文件名称: TimerController.java
 * @日期: 2017-4-26 下午03:29:25  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.timer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.timer.model.Timer;
import com.hnzskj.timer.server.ITimerService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：TimerController.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-26 下午03:29:25   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-26 下午03:29:25   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="timer")
public class TimerController extends BaseController<Timer> {

	@Autowired
	private ITimerService timerService = null;
	
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
		super.setBaseService(timerService);
	}

	

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#delete(java.lang.String)
	 */
	@Override
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()Timer timer) {
		return super.delete(timer.getUuid());
	}

	
	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#findByPrimaryKey(java.lang.Object)
	 */
	@Override
	@ResponseBody
	@RequestMapping(value="findByPrimaryKey")
	public String findByPrimaryKey(@ModelAttribute()Timer timer) {
		return super.findByPrimaryKey(timer);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()Timer timer, @ModelAttribute()PageBean<Timer> pageBean) {
		return super.index(timer, pageBean);
	}

	
}
