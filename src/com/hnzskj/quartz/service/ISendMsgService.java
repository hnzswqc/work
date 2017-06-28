/*
 * @项目名称: ewsm
 * @文件名称: ISendMsgService.java
 * @日期: 2016-11-10 下午05:50:27  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.service;

import java.util.List;

import com.hnzskj.common.service.IBaseService;
import com.hnzskj.quartz.model.SendMsg;
import com.hnzskj.quartz.model.Type;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：ISendMsgService.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-11-10 下午05:50:27   <br/>
 * 修改人：King   <br/>
 * 修改时间：2016-11-10 下午05:50:27   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public interface ISendMsgService extends IBaseService<SendMsg> {

	/**
	 * 
	 * 方法描述：查询预警信息接口<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-11-10 下午07:36:34<br/>         
	 * @param <br/>   
	 * @return List<SendMsg><br/>   
	 * @version   1.0<br/>
	 */
	public List<SendMsg> findSendMsgListInfo(String viewName);
	
	

	/**
	 * 
	 * 方法描述：查询短信类别信息，根据类别进行过滤查询操作<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-11-16 下午05:27:01<br/>         
	 * @param <br/>   
	 * @return List<Type><br/>   
	 * @version   1.0<br/>
	 */
	List<Type> findSendMsgTypeListInfo();
}
