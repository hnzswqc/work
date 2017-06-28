/*
 * @项目名称: spms
 * @文件名称: UserMapper.java
 * @日期: 2017-4-5 下午06:33:28  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.user.mapper;

import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.user.model.User;

/**    
 * 项目名称：spms   <br/>
 * 类名称：UserMapper.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-5 下午06:33:28   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-5 下午06:33:28   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface UserMapper extends BaseMapper<User, UserMapper> {

	/**
	 * 
	 * 方法描述：用户登录<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午04:14:33<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	User login(User user);
	
	/**
	 * 
	 * 方法描述：修改密码<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午08:02:19<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	int updPassword(User user);
}
