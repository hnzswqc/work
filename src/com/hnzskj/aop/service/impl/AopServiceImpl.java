/*
 * @项目名称: spms
 * @文件名称: LogServiceImpl.java
 * @日期: 2017-4-11 上午10:45:44  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.aop.service.impl;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;

/**    
 * 项目名称：spms   <br/>
 * 类名称：LogServiceImpl.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-11 上午10:45:44   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-11 上午10:45:44   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class AopServiceImpl {
	
	
	/**
	 * 
	 * 方法描述：调用方法前执行<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-11 下午06:27:34<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public void beforeTest(){
		System.out.println("beforeTest....");
	}
	/**
	 * 
	 * 方法描述：执行切面的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-11 上午10:47:20<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 * @throws Throwable 
	 */
	public Object aroundTest(ProceedingJoinPoint pj) throws Throwable{
	       System.out.println(getMethod(pj));
	        return pj.proceed();  
	}
	
	/**
	 * 
	 * 方法描述：调用后执行<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-11 下午06:28:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public void afterTest(){
		System.out.println("afterTest....");
	}
	
	/**
	 * 方法描述：获得执行的方法名<br/>
	 * 创建人：苏国庆   <br/>
	 * 创建时间：2011-6-21 上午08:15:33<br/>         
	 * @param pj
	 * @return
	 * @version   1.0  
	 */
	private Method getMethod(ProceedingJoinPoint pj) {
		Method method = null;
		Class<?> clazz = pj.getTarget().getClass();
		Method[] ms = clazz.getMethods();
		for (Method m : ms) {
			if (m.getName().equals(pj.getSignature().getName())) {
				method = m;
				break;
			}
		}
		return method;
	}
	
	/**
	 * 
	 * 方法描述：获得客户端真实的IP地址,用户在使用代理时也可获得真实IP地址<br/>
	 * 创建人：苏国庆   <br/>
	 * 创建时间：2011-5-17 下午04:48:48<br/>         
	 * @return	当前用户的IP地址
	 * @version   1.0
	 */
	public String getIpAddr(HttpServletRequest request) {		
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
