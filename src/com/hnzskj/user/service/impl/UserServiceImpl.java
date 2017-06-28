/*
 * @项目名称: spms
 * @文件名称: UserServiceImpl.java
 * @日期: 2017-4-5 下午06:49:40  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzskj.common.service.impl.BaseServiceImpl;
import com.hnzskj.user.mapper.UserMapper;
import com.hnzskj.user.model.User;
import com.hnzskj.user.service.IUserService;

/**    
 * 项目名称：spms   <br/>
 * 类名称：UserServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-5 下午06:49:40   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-5 下午06:49:40   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User, UserMapper> implements
		IUserService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3200695934283327152L;
	
	/**
	 * mapper注入
	 */
	@Autowired(required=true)
	private UserMapper userMapper = null;

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
		super.setBaseMapper(userMapper);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.user.service.IUserService#login(com.hnzskj.user.model.User)
	 */
	public User login(User user) {
		return userMapper.login(user);
	}

	/* (non-Javadoc)
	 * @see com.hnzskj.user.service.IUserService#updPassword(com.hnzskj.user.model.User)
	 */
	public boolean updPassword(User user) {
		int result = userMapper.updPassword(user);
		return result>0?true:false;
	}
	
	

}
