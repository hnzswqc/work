/*
 * @项目名称: work
 * @文件名称: WorkCollectMapper.java
 * @日期: 2017-6-5 下午04:03:46  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.hnzskj.checkwork.model.WorkCollect;
import com.hnzskj.checkwork.model.WorkCost;
import com.hnzskj.common.mapper.BaseMapper;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkCollectMapper.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 下午04:03:46   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 下午04:03:46   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface WorkCollectMapper extends BaseMapper<WorkCollect, WorkCollectMapper> {


	
	/**
	 * 
	 * 方法描述：根据日期删除<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-5 下午03:33:32<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public int deleteByDate(WorkCollect workCollect);
	
	
	/**
	 * 
	 * 方法描述：批量添加杂项花销信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午03:42:31<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public int addWorkCostList(@RequestParam("list")List<WorkCost> list);
	
	/**
	 * 
	 * 方法描述：查询当前年度<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:51:42<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCollect> collectYear(@RequestParam("year")String year);
	
	/**
	 * 
	 * 方法描述：查询当前季度<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:51:55<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCollect> collectQuarter(@RequestParam("quarter")Integer quarter);
	
	/**
	 * 
	 * 方法描述：查询当前月份<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:52:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCollect> collectMonth(@RequestParam("month")String month);
	
	/**
	 * 
	 * 方法描述：查询最后一次填报<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:52:13<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCollect> collectDate();
	
	/**
	 * 
	 * 方法描述：查询某月花费走势图<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 上午09:02:01<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCollect> collectMonthByDate(@RequestParam("workCollect")WorkCollect workCollect);
	
	/**
	 * 
	 * 方法描述：查询某年12个月的花费走势图<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 上午09:02:39<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCollect> collectYearByMonth(@RequestParam("workCollect")WorkCollect workCollect);
	
	/**
	 * 
	 * 方法描述：查询人员出出勤率以及获取优数量<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 上午09:02:39<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCollect> collectWorkerByMonth(@RequestParam("workCollect")WorkCollect workCollect);
	
	/**
	 * 
	 * 方法描述：获取其他花销类别占比<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 上午11:47:24<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<WorkCost> collectCostByMonth(@RequestParam("workCollect")WorkCollect workCollect);
	
	
	
	
	
}
