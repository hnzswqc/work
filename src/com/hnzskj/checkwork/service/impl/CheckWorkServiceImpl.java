/*
 * @项目名称: work
 * @文件名称: CheckWorkServiceImpl.java
 * @日期: 2017-6-5 下午03:29:59  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.checkwork.mapper.CheckWorkMapper;
import com.hnzskj.checkwork.model.CheckWork;
import com.hnzskj.checkwork.model.WorkCollect;
import com.hnzskj.checkwork.service.ICheckWorkService;
import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.worker.model.Worker;

/**    
 * 项目名称：work   <br/>
 * 类名称：CheckWorkServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 下午03:29:59   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 下午03:29:59   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class CheckWorkServiceImpl extends BaseServiceImpl<CheckWork, CheckWorkMapper> implements
ICheckWorkService {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1060716413018843586L;


	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private CheckWorkMapper checkWorkMapper = null;

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
		super.setBaseMapper(checkWorkMapper);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.ICheckWork#deleteByDate(com.hnzskj.checkwork.model.CheckWork)
	 */
	public boolean deleteByDate(CheckWork checkWork) {
		int result = checkWorkMapper.deleteByDate(checkWork);
		return result>=0?true:false;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.ICheckWorkService#addCheckWorkList(java.util.List)
	 */
	public boolean addCheckWorkList(List<CheckWork> list) {
		int result = checkWorkMapper.addCheckWorkList(list);
		return result>0?true:false;
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.checkwork.service.ICheckWorkService#findByDate(com.hnzskj.checkwork.model.WorkCollect)
	 */
	public List<Worker> findByDate(WorkCollect workCollect) {
		List<Worker> list = checkWorkMapper.findByDate(workCollect);
		return list;
	}
	
	
	
}
