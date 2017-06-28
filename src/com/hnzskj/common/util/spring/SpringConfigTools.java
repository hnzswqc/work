/*
 * @项目名称: ewsm
 * @文件名称: SpringConfigTool.java
 * @日期: 2016-10-24 上午10:51:57  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.spring;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：SpringConfigTool.java   <br/>
 * 类描述：spring工具类   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-24 上午10:51:57   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-24 上午10:51:57   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class SpringConfigTools implements ApplicationContextAware {

	/**
	 * 配置信息
	 */
	private static ApplicationContext context = null;
	
	/**
	 * 工具类
	 */
	private static SpringConfigTools stools = null;
	
	/**
	 * 
	 * 方法描述：初始化实体类<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-24 上午10:55:13<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public synchronized static SpringConfigTools init(){
		if(null==stools){
			stools = new SpringConfigTools();
		}
		return stools;
	}
	
	/* (non-Javadoc)
	 * @see org.springframework.context.ApplicationContextAware#setApplicationContext(org.springframework.context.ApplicationContext)
	 */
	@Autowired
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		context=arg0;
	}
	
	/**
	 * 
	 * 方法描述：获取spring对象<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-24 上午10:55:00<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public synchronized static Object getBean(String beanName){
		return context.getBean(beanName);
	}
	
	/**
	 * 
	 * 方法描述：获取spring对象<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-24 上午10:55:00<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public synchronized static Object getBean(Class<?> clazz){
		return context.getBean(clazz);
	}
	
	

}
