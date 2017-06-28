/*
 * @项目名称: ewsm
 * @文件名称: SendMsgMapper.java
 * @日期: 2016-11-10 下午04:53:22  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.quartz.model.SendMsg;
import com.hnzskj.quartz.model.Type;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：SendMsgMapper.java   <br/>
 * 类描述：短信查询发送预警   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-11-10 下午04:53:22   <br/>
 * 修改人：King   <br/>
 * 修改时间：2016-11-10 下午04:53:22   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface SendMsgMapper extends BaseMapper<SendMsg, SendMsgMapper> {

	/**
	 * 
	 * 方法描述：查询待发送的信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-11-10 下午07:33:14<br/>         
	 * @param <br/>   
	 * @return List<SendMsg><br/>   
	 * @version   1.0<br/>
	 */
	List<SendMsg> findSendMsgListInfo(@Param("viewName")String viewName);
	
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
