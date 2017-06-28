/*
 * @项目名称: ewsm
 * @文件名称: SendMsgController.java
 * @日期: 2016-11-14 下午05:49:32  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.quartz.model.SendMsg;
import com.hnzskj.quartz.model.Type;
import com.hnzskj.quartz.service.ISendMsgService;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：SendMsgController.java   <br/>
 * 类描述： 短信记录逻辑控制层  <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-11-14 下午05:49:32   <br/>
 * 修改人：King   <br/>
 * 修改时间：2016-11-14 下午05:49:32   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="sendMsg")
public class SendMsgController extends BaseController<SendMsg> {

	
	
	/**
	 * 业务注入
	 */
	@Autowired
	private ISendMsgService sendMsgService = null;
	
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
		super.setBaseService(sendMsgService);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()SendMsg sendMsg, @ModelAttribute()PageBean<SendMsg> pageBean) {
		ModelAndView modelAndView =super.index(sendMsg, pageBean); 
		List<Type> list = sendMsgService.findSendMsgTypeListInfo();
		modelAndView.addObject("typeList",list);
		return  modelAndView;
	}
	
	
	
	
}
