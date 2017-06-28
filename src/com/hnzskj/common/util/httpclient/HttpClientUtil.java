package com.hnzskj.common.util.httpclient;

import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.log4j.Logger;

import com.hnzskj.common.model.Json;

/**
 * 
 * 项目名称：ewsm_jz   <br/>
 * 类名称：HttpClientUtils.java   <br/>
 * 类描述：httpclient接口   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-8 上午10:35:17   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-8 上午10:35:17   <br/>
 * 修改备注：    <br/>
 * @version  1.0
 */
public class HttpClientUtil {
	private static final Logger log = Logger.getLogger(HttpClientUtil.class);

	public static String post(String url, Map<String, String> map) {
		// 创建默认的 HttpClient 实例
		HttpClient httpClient = new HttpClient();
		PostMethod post = null;
		Json json = new Json();
		try {
			// 创建 httpUriRequest 实例
			post = new PostMethod(url);
			post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,"utf-8"); 
			
			for (String key : map.keySet()) {
				post.addParameter(key, (String)map.get(key));
			}
			int responseCode = httpClient.executeMethod(post);
			String responseBody = post.getResponseBodyAsString();
			/*StringBuffer responseBody = new StringBuffer();  
			InputStream inputStream = post.getResponseBodyAsStream();  //返回信息大于1M使用该方法
			BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));  
			String str= "";  
			while((str = br.readLine()) != null){  
				responseBody.append(str );  
			}  */
			System.out.println(responseCode);
			if (200 == responseCode) {
				return responseBody;
			}else {
				json.setData(responseCode);
				json.setSuccess(false);
				log.error("服务器返回内容" + responseBody);
			}
		} catch (Exception e) {
			json.setData("-1");
			json.setSuccess(false);
			log.info("》"+e.getClass().getName()+"："+e.getMessage());
		} finally {
			// 关闭连接，释放资源
			if (null != post) {
				post.releaseConnection();
			}
		}
		return json.toJson();//未知错误
	}
	
	
	
	
	
}
