/*
 * @项目名称: ewsm
 * @文件名称: ModelService.java
 * @日期: 2016-10-9 上午10:06:44  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.model.mapper.ModelMapper;
import com.hnzskj.model.model.Model;
import com.hnzskj.model.service.IModelService;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：ModelService.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-9 上午10:06:44   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-9 上午10:06:44   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
@Transactional
public class ModelService extends BaseServiceImpl<Model, ModelMapper>implements IModelService {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6219149742808883400L;
	
	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private ModelMapper modelMapper = null;

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
		super.setBaseMapper(modelMapper);
	}
	
	

}
