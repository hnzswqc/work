/*
 * @项目名称: ewsm
 * @文件名称: SendMsgServiceImpl.java
 * @日期: 2016-11-10 下午05:52:47  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.quartz.mapper.SendMsgMapper;
import com.hnzskj.quartz.model.SendMsg;
import com.hnzskj.quartz.model.Type;
import com.hnzskj.quartz.service.ISendMsgService;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：SendMsgServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-11-10 下午05:52:47   <br/>
 * 修改人：King   <br/>
 * 修改时间：2016-11-10 下午05:52:47   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class SendMsgServiceImpl extends BaseServiceImpl<SendMsg, SendMsgMapper> implements
		ISendMsgService {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3200695934283327152L;
	
	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private SendMsgMapper sendMsgMapper = null;

	/**
	 * 
	 * 方法描述：需要设置对应的mapper类<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-7-31 下午12:30:32<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@Autowired
	public void setBaseMapper(){
		super.setBaseMapper(sendMsgMapper);
	}
	
	/**
	 * 
	 * 方法描述：查询预警信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-11-10 下午07:35:36<br/>         
	 * @param <br/>   
	 * @return List<SendMsg><br/>   
	 * @version   1.0<br/>
	 */
	public List<SendMsg> findSendMsgListInfo(String viewName){
		return sendMsgMapper.findSendMsgListInfo(viewName);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.quartz.service.ISendMsgService#findSendMsgTypeListInfo()
	 */
	public List<Type> findSendMsgTypeListInfo() {
		return sendMsgMapper.findSendMsgTypeListInfo();
	}
	
	
	
	
	
	
}
