/*
 * @项目名称: ewsm
 * @文件名称: AuthInterceptorAdapter.java
 * @日期: 2016-7-31 下午04:15:34  
 * @版权: 2011 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.date.DateUtil;
import com.hnzskj.common.util.encry.Encrypt;
import com.hnzskj.user.model.User;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：AuthInterceptorAdapter.java   <br/>
 * 类描述：   <br/>
 * 创建人：开发部笔记本   <br/>
 * 创建时间：2016-7-31 下午04:15:34   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-7-31 下午04:15:34   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class AuthInterceptorAdapter extends HandlerInterceptorAdapter {
	
	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		return super.preHandle(request, response, handler);
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//先判断是否已经到期。
		if(!validate()){
			modelAndView.setViewName("login");
			modelAndView.addObject("loginMsg", "autoCodeError");
		}else{
			User user = Constant.getCurrentLoginUser();
			if(null==user){
				String URI = request.getRequestURI();
				if(!URI.contains("/adminLogin.shtml")
						||!URI.contains("/login.shtml")
						||!URI.contains("/skipPage.shtml")
						||!URI.contains("/loginOut.shtml")
						||!URI.contains("/login")
						||!URI.contains("/test.shtml")){
					modelAndView.setViewName("login");
					modelAndView.addObject("loginMsg", "loginError");
				}
			}
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#afterConcurrentHandlingStarted(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	

	/**
	 * 
	 * 方法描述：验证时间<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 下午02:50:24<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public boolean validate(){
		String lic = Constant.getLic();
		if(StringUtils.isEmpty(lic)){
			return false;
		}
		String date = DateUtil.getCurrentDate();
		String authLicDate="";
		try {
			 authLicDate = Encrypt.getDecoderBase64(lic);
		} catch (Exception e) {
			return false;
		}
		int result = date.compareTo(authLicDate);   
		//未到期，可以继续使用
		if(result<=0){
			return true;
		}else{
			return false;
		}
	} 
	
	
	public static void main(String[] args) {
		String lic = "2017-06-9";
		String date = DateUtil.getCurrentDate();
		int   res   =   date.compareTo(lic);   
		System.out.println(res);
	}

	

	
}
