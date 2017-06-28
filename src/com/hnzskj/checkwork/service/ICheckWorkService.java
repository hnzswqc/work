/*
 * @项目名称: work
 * @文件名称: ICheckWork.java
 * @日期: 2017-6-5 下午03:28:52  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.hnzskj.checkwork.model.CheckWork;
import com.hnzskj.checkwork.model.WorkCollect;
import com.hnzskj.common.service.IBaseService;
import com.hnzskj.worker.model.Worker;

/**    
 * 项目名称：work   <br/>
 * 类名称：ICheckWork.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 下午03:28:52   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 下午03:28:52   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public interface ICheckWorkService extends IBaseService<CheckWork> {


	/**
	 * 
	 * 方法描述：根据日期删除<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-5 下午03:33:32<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public boolean deleteByDate(CheckWork checkWork);
	
	
	/**
	 * 
	 * 方法描述：批量添加考勤信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午03:41:54<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public boolean addCheckWorkList(@RequestParam("list")List<CheckWork> list);
	
	
	/**
	 * 
	 * 方法描述：获取添加的人员<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-11 下午06:49:00<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public List<Worker> findByDate(WorkCollect workCollect);
}
