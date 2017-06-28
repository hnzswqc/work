/*
 * @项目名称: spms
 * @文件名称: LinuxUtil.java
 * @日期: 2017-4-5 下午07:01:41  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.shell;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;

import com.hnzskj.common.util.constant.Constant;

/**    
 * 项目名称：spms   <br/>
 * 类名称：LinuxUtil.java   <br/>
 * 类描述：linux系统服务   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-5 下午07:01:41   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-5 下午07:01:41   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class LinuxUtil {

	/**
	 * 链接
	 */
	private Connection conn;
	
	/**
	 * ip
	 */
	private String ipAddr;
	
	/**
	 * 编码
	 */
	private String charset=Charset.defaultCharset().toString();
	
	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 密码
	 */
	private String password;
	
	
	public LinuxUtil(String ipAddr,String userName,String password, String charset){
		this.ipAddr = ipAddr;
		this.userName = userName;
		this.password = password;
		if(null!=charset){
			this.charset = charset;
		}
	}
	
	/**
	 * 
	 * 方法描述：远程登录到系统<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-5 下午07:13:26<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public boolean login() throws IOException{
		conn = new Connection(ipAddr);
		conn.connect();//链接
		return conn.authenticateWithPassword(userName, password);//认证
	}
	
	/**
	 * 
	 * 方法描述：执行命令<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-5 下午07:13:38<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public String exec(String cmds){
		InputStream in = null;
		String result = "";
		try {
			if(this.login()){
				Session session = conn.openSession();//打开一个会话
				session.execCommand(cmds);
				in = session.getStdout();
				result = this.processStdout(in, this.charset);
				session.close();
				conn.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
			return Constant.RESULT_ERROR_CODE;
		}
		return result;
	}
	
	/**
	 * 
	 * 方法描述：返回相应信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-5 下午07:14:13<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public String processStdout(InputStream in,String charset){
		byte[] buf = new byte[1024];
		StringBuffer sb = new StringBuffer(200);
			try {
				while(in.read(buf)!=-1){
					sb.append(new String(buf,charset));
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return sb.toString();
	}
	
	
	public static void main(String[] args) {
		LinuxUtil linuxUtil = new LinuxUtil("10.65.0.200", "root", "pass1009", "GBK");
		//String result =linuxUtil.exec("/opt/apache-tomcat-6.0.20_MyQuartz/bin/startup.sh");
		String result =linuxUtil.exec("/opt/apache-tomcat-6.0.20_MyQuartz/bin/shutdown.sh");
		System.err.println("执行成功...."+result);
	}
	
	
}
