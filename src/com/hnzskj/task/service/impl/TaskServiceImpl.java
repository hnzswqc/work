/*
 * @项目名称: spms
 * @文件名称: TaskServiceImpl.java
 * @日期: 2017-4-20 下午06:13:37  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.task.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.task.mapper.TaskMapper;
import com.hnzskj.task.model.Task;
import com.hnzskj.task.service.ITaskService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：TaskServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-20 下午06:13:37   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-20 下午06:13:37   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class TaskServiceImpl extends BaseServiceImpl<Task, TaskMapper>
		implements ITaskService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private TaskMapper taskMapper = null;

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
		super.setBaseMapper(taskMapper);
	}
	

}
