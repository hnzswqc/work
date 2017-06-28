/*
 * @项目名称: work
 * @文件名称: CheckWorkMapper.java
 * @日期: 2017-6-5 上午11:45:46  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.hnzskj.checkwork.model.CheckWork;
import com.hnzskj.checkwork.model.WorkCollect;
import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.worker.model.Worker;

/**    
 * 项目名称：work   <br/>
 * 类名称：CheckWorkMapper.java   <br/>
 * 类描述：考勤mapper   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 上午11:45:46   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 上午11:45:46   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface CheckWorkMapper extends BaseMapper<CheckWork, CheckWorkMapper> {

	/**
	 * 
	 * 方法描述：根据日期删除<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-5 下午03:33:32<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public int deleteByDate(CheckWork checkWork);
	
	/**
	 * 
	 * 方法描述：批量添加考勤信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午03:41:54<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public int addCheckWorkList(@RequestParam("list")List<CheckWork> list);
	

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
