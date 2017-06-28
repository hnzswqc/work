/*
 * @项目名称: work
 * @文件名称: WorkCostServiceImpl.java
 * @日期: 2017-6-7 下午04:31:31  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.checkwork.mapper.WorkCostMapper;
import com.hnzskj.checkwork.model.WorkCost;
import com.hnzskj.checkwork.service.IWorkCostService;
import com.hnzskj.common.service.impl.BaseServiceImpl;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkCostServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-7 下午04:31:31   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-7 下午04:31:31   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class WorkCostServiceImpl extends BaseServiceImpl<WorkCost, WorkCostMapper> implements IWorkCostService{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private WorkCostMapper workCostMapper = null;

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
		super.setBaseMapper(workCostMapper);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCostService#addCheckCostList(java.util.List)
	 */
	public boolean addCheckCostList(List<WorkCost> list) {
		int result = workCostMapper.addCheckCostList(list);
		return result>0?true:false;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCostService#deleteByDate(com.hnzskj.checkwork.model.WorkCost)
	 */
	public boolean deleteByDate(WorkCost workCost) {
		int result = workCostMapper.deleteByDate(workCost);
		return result>0?true:false;
	}
	
	
	
	
	
}
