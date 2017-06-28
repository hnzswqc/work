package com.hnzskj.common.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.user.model.User;

/**
 * 项目的过滤器
 * 
 * @author 常利召
 * @version 1.0
 * 
 */
public class URLFilter implements Filter {

	protected FilterConfig filterConfig;

	public void doFilter(final ServletRequest request,
			final ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res =(HttpServletResponse) response;
		User user = Constant.getCurrentLoginUser();
		String URI = req.getRequestURI();
		String context = req.getContextPath() + "/";
		if(null==user&&!filterUrl(context,URI)){
			String path = req.getContextPath();
			String goURI = path + "/skipPage.jsp?info=login";
			res.sendRedirect(goURI);
		}else{
			filterChain.doFilter(req, res);
		}
	}

	/**
	 * 
	 * 方法描述：包含以下链接，正常访问。<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-5-13 上午11:13:01<br/>         
	 * @param <br/>   
	 * @return boolean<br/>   
	 * @version   1.0<br/>
	 */
	public boolean filterUrl(String context,String URI){
		if(URI.contains("adminLogin.shtml") || URI.contains("skipPage.jsp") 
				||URI.contains("login.shtml") ){
			return true;
		}
		return false;
	}
	
	
	public void destroy() {
		this.filterConfig = null;
	}

	public void init(FilterConfig config) {
		this.filterConfig = config;
	}

	public void setFilterConfig(final FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}

}
