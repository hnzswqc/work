/*
 * @项目名称: zrw
 * @文件名称: JNDIConfigUtil.java
 * @日期: 2016-12-25 下午02:21:55  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.jndi;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**    
 * 项目名称：zrw   <br/>
 * 类名称：JNDIConfigUtil.java   <br/>
 * 类描述： 读取tomcat中server中配置的常量信息  <br/>
 * <Environment name="menu.visible" type="java.lang.String" value="Y"/>
 * 创建人：King   <br/>
 * 创建时间：2016-12-25 下午02:21:55   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-12-25 下午02:21:55   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class JNDIConfigUtil {

	/**
	 * jndi前缀
	 */
	private static String jNDINAME="java:comp/env/";
	
	/**
	 * 
	 * 方法描述：获取JNDI参数配置信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-12-25 下午02:23:42<br/>         
	 * @param name server中配置的常量信息<br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getJNDIConfig(String name){
		String value = null;
		try {
			Context ctx = new InitialContext();
			value = (String)ctx.lookup(jNDINAME+name);
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return value;
	}
	
	/**
	 * 
	 * 方法描述：是否显示菜单<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-12-25 下午02:29:03<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getMenuVisible(){
		return getJNDIConfig("menu.visible");
	}
	
}
