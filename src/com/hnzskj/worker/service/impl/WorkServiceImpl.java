/*
 * @项目名称: work
 * @文件名称: WorkServiceImpl.java
 * @日期: 2017-6-4 下午03:59:26  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.worker.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.worker.mapper.WorkerMapper;
import com.hnzskj.worker.model.Worker;
import com.hnzskj.worker.service.IWorkerService;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-4 下午03:59:26   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-4 下午03:59:26   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class WorkServiceImpl extends BaseServiceImpl<Worker, WorkerMapper> implements
		IWorkerService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7691323193306920020L;

	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private WorkerMapper workerMapper = null;

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
		super.setBaseMapper(workerMapper);
	}


}
