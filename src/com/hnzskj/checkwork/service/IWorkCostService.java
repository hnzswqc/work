/*
 * @项目名称: work
 * @文件名称: IWorkCostService.java
 * @日期: 2017-6-7 下午04:30:30  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.service;

import java.util.List;

import com.hnzskj.checkwork.model.WorkCost;
import com.hnzskj.common.service.IBaseService;

/**    
 * 项目名称：work   <br/>
 * 类名称：IWorkCostService.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-7 下午04:30:30   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-7 下午04:30:30   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public interface IWorkCostService extends IBaseService<WorkCost> {

	/**
	 * 
	 * 方法描述：根据日期删除<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午04:36:22<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public boolean deleteByDate(WorkCost workCost);
	
	/**
	 * 
	 * 方法描述：批量添加<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午04:31:00<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public boolean addCheckCostList(List<WorkCost> list);
}
