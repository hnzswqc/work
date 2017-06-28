/*
 * @项目名称: work
 * @文件名称: WorkCostMapper.java
 * @日期: 2017-6-7 下午03:59:10  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.hnzskj.checkwork.model.WorkCost;
import com.hnzskj.common.mapper.BaseMapper;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkCostMapper.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-7 下午03:59:10   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-7 下午03:59:10   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface WorkCostMapper extends BaseMapper<WorkCost, WorkCostMapper> {

	/**
	 * 
	 * 方法描述：根据日期删除<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-5 下午03:33:32<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public int deleteByDate(WorkCost workCost);
	
	/**
	 * 
	 * 方法描述：批量添加<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午04:28:54<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public int addCheckCostList(@RequestParam("list")List<WorkCost> list);
	
	
}
