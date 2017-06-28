/*
 * @项目名称: ShellUtil
 * @文件名称: PortUtil.java
 * @日期: 2017-4-5 上午10:27:56  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.shell;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;

import org.apache.commons.lang.StringUtils;

/**    
 * 项目名称：ShellUtil   <br/>
 * 类名称：PortUtil.java   <br/>
 * 类描述：判断端口是否可以联通  <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-5 上午10:27:56   <br/>
 * 修改人：King   <br/>
 * 修改时间：2017-4-5 上午10:27:56   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class PortUtil {

	
	private static final int timeOut = 3000; //超时应该在3钞以上  
	/**
	 * 
	 * 方法描述：检测端口是否可以连接<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-5 上午10:51:53<br/>         
	 * @param <br/>   
	 * @return boolean<br/>   
	 * @version   1.0<br/>
	 * @throws IOException 
	 */
	public static boolean isHostConnectable(String host,int port) throws IOException{
		Socket socket = new Socket();
		socket.connect(new InetSocketAddress(host, port));
		socket.close();
		return true;
	}
	
	/**
	 * 
	 * 方法描述：判断ip是否联通<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-7 下午03:22:43<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static boolean isPing(String ip){
		boolean status = false;
		if(StringUtils.isNotEmpty(ip)){
			try {
				status = InetAddress.getByName(ip).isReachable(timeOut);
			} catch (UnknownHostException e) {
				//e.printStackTrace();
				return false;
			} catch (IOException e) {
				//e.printStackTrace();
				return false;
			}
		}
		return  status;
	}
	
	public static void main(String[] args) {
		boolean result=false;
		try {
			result = PortUtil.isHostConnectable("192.168.0.198", 8080);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(result){
			System.out.println("success");
		}else{
			System.out.println("error");
		}
		
		System.out.println(PortUtil.isPing("127.0.0.1"));
	}
}
