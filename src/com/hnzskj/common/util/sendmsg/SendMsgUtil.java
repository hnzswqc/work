/*
 * @项目名称: ewsm_jz
 * @文件名称: SendMsgUtil.java
 * @日期: 2016-10-8 上午09:09:00  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.sendmsg;

import java.io.IOException;

import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.log4j.Logger;

import com.hnzskj.common.util.constant.Constant;


/**    
 * 项目名称：ewsm_jz   <br/>
 * 类名称：SendMsgUtil.java   <br/>
 * 类描述：短信发送实体对象   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-8 上午09:09:00   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-8 上午09:09:00   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class SendMsgUtil {

	/**
	 * 日志信息
	 */
	private Logger log = Logger.getLogger(SendMsgUtil.class);
	
	/**
	 * 短信发送状态
	 */
	private String SEND_RESULT="ERROR";
	
	
	/**
	 * 
	 * 方法描述：调用发送短信的方法<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-1-13 下午03:16:59<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	private String send(String url){
		if(StringUtils.isEmpty(url)){
			log.info("》短信发送URL异常："+url);
			return SEND_RESULT;
		}
		HttpClient httpClient = new DefaultHttpClient();
        HttpGet get = new HttpGet(url);
        HttpResponse response;
		try {
			log.info("》短信发送URL："+url);
			response = httpClient.execute(get);
	        int status = response.getStatusLine().getStatusCode();
	        if (status == HttpStatus.SC_OK) {
	        	SEND_RESULT = "SUCCESS";
	        	log.info("》发送状态：成功！");
	        }else{
	        	log.info("》发送状态：失败！");
	        }
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			log.info("》"+e.getClass().getName()+"："+e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			log.info("》"+e.getClass().getName()+"："+e.getMessage());
		}
		return SEND_RESULT;
	}
	
	/**
	 * 
	 * 方法描述：调用发送短信的方法<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-1-13 下午03:16:59<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public String send(SmsConfig smsConfig){
		if(null!=smsConfig&&!smsConfig.getOpen().equals(Constant.SMSCONFIG_OPEN)){
			//未开启
			log.info("》》》》未开启短信预警信息。如需开启，请在系统配置文件中进行配置。配置文件路径："+Constant.config_parameter_path+"，修改后需重启服务！");
			return "UNOPEN";
		}
		return send(smsConfig.getUrl());
	}
	
}
