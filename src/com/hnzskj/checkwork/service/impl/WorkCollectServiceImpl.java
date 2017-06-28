/*
 * @项目名称: work
 * @文件名称: WorkCollectServiceImpl.java
 * @日期: 2017-6-5 下午04:19:42  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.checkwork.mapper.WorkCollectMapper;
import com.hnzskj.checkwork.model.WorkCollect;
import com.hnzskj.checkwork.model.WorkCost;
import com.hnzskj.checkwork.service.IWorkCollectService;
import com.hnzskj.common.service.impl.BaseServiceImpl;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkCollectServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 下午04:19:42   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 下午04:19:42   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class WorkCollectServiceImpl extends BaseServiceImpl<WorkCollect, WorkCollectMapper> implements
		IWorkCollectService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1389101864592900767L;
	
	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private WorkCollectMapper workCollectMapper  = null;

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
		super.setBaseMapper(workCollectMapper);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#deleteByDate(com.hnzskj.checkwork.model.WorkCollect)
	 */
	public boolean deleteByDate(WorkCollect workCollect) {
		int result = workCollectMapper.deleteByDate(workCollect);
		return result>=0?true:false;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#checkDate(com.hnzskj.checkwork.model.WorkCollect)
	 */
	public boolean checkDate(WorkCollect workCollect) {
		Integer result = super.findCount(workCollect);
		return result>0?true:false;
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectDate()
	 */
	public List<WorkCollect> collectDate() {
		List<WorkCollect> list = workCollectMapper.collectDate();
		return list;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectMonth(java.lang.String)
	 */
	public List<WorkCollect> collectMonth(String month) {
		List<WorkCollect> list = workCollectMapper.collectMonth(month);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectQuarter(java.lang.Integer)
	 */
	public List<WorkCollect> collectQuarter(Integer quarter) {
		List<WorkCollect> list = workCollectMapper.collectQuarter(quarter);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectYear(java.lang.String)
	 */
	public List<WorkCollect> collectYear(String year) {
		List<WorkCollect> list = workCollectMapper.collectYear(year);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectMonthByDate(com.hnzskj.checkwork.model.WorkCollect)
	 */
	public List<WorkCollect> collectMonthByDate(WorkCollect workCollect) {
		List<WorkCollect> list = workCollectMapper.collectMonthByDate(workCollect);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectYearByMonth(com.hnzskj.checkwork.model.WorkCollect)
	 */
	public List<WorkCollect> collectYearByMonth(WorkCollect workCollect) {
		List<WorkCollect> list = workCollectMapper.collectYearByMonth(workCollect);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectWorkerByMonth(com.hnzskj.checkwork.model.WorkCollect)
	 */
	public List<WorkCollect> collectWorkerByMonth(WorkCollect workCollect) {
		List<WorkCollect> list = workCollectMapper.collectWorkerByMonth(workCollect);
		return list;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.IWorkCollectService#collectCostByMonth(com.hnzskj.checkwork.model.WorkCollect)
	 */
	public List<WorkCost> collectCostByMonth(WorkCollect workCollect) {
		List<WorkCost> list = workCollectMapper.collectCostByMonth(workCollect);
		return list;
	}
	
	
	
	
	
}
