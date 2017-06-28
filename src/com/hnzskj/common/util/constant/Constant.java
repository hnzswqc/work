/*
 * @项目名称: ewsm_jz
 * @文件名称: Constant.java
 * @日期: 2016-10-8 上午09:21:49  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.constant;

import java.io.File;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.hnzskj.common.util.sendmsg.SmsConfig;
import com.hnzskj.user.model.User;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

/**    
 * 项目名称：ewsm_jz   <br/>
 * 类名称：Constant.java   <br/>
 * 类描述：系统常量类   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-8 上午09:21:49   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-8 上午09:21:49   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class Constant {

	/**
	 * 项目根目录（在InitServlet中初始化）
	 */
	public static String webRoot = "";

	/**
	 * 系统配置参数路径（在InitServlet中初始化）
	 */
	public static String config_parameter_path = "";
	
	/**
	 * 登录用户信息
	 */
	public static String SESSION_USER_KEY="SESSION_USER_KEY";
	
	/**
	 * 项目标题
	 */
	public static  String config_title="";
	
	/**
	 * 项目当前版本
	 */
	public static String config_version="";
	
	/**
	 * 短信配置信息
	 */
	public static SmsConfig smsConfig = null;
	
	/**
	 * 开启短信
	 */
	public static String SMSCONFIG_OPEN = "1";
	
	/**
	 * 开启调试
	 */
	public static String SMSCONFIG_DEBUG = "1";
	
	/**
	 * 启用状态
	 */
	public static Integer STATUS_ENABLE = 1;
	
	/**
	 * 停用状态
	 */
	public static Integer STATUS_DISABLE = 0;
	
	/**
	 * 模块启用
	 */
	public static Integer MODEL_STATUS_ENABLE =1;
	
	/**
	 * 模块停用
	 */
	public static Integer MODEL_STATUS_DISABLE=0;
	
	/**
	 * 功能启用
	 */
	public static Integer POWER_STATUS_ENABLE =1;
	
	/**
	 * 功能停用
	 */
	public static Integer POWER_STATUS_DISABLE=0;
	
	/**
	 * 删除类别
	 */
	public static Integer DELETE_TYPE_YES=1;
	
	/**
	 * 未删除
	 */
	public static Integer DELETE_TYPE_NO = 0;
	
	/**
	 * 短信只提醒一次
	 */
	public static Integer POWER_LOOP_ONCE=1;
	
	/**
	 * 短信永久提醒，直至办理完成
	 */
	public static Integer POWER_LOOP_EVER=0;
	
	/**
	 * 短信发送成功
	 */
	public static Integer SENDMSG_SUCCESS = 2;
	
	/**
	 * 发送短息未开启 
	 */
	public static Integer SENDMSG_UNOPEN = 0;
	
	/**
	 * 短信发送失败 
	 */
	public static Integer SENDMSG_FAIL = 1;
	
	/**
	 * 是否隐藏header标题，用于嵌入OA界面里面，不需要显示顶部标题栏
	 */
	public static String HEADER_HIDDEN="header_hidden";
	
	/**
	 * 默认密码
	 */
	public static String DEFAULT_PASSWORD="123456";
	
	/**
	 * 默认根节点
	 */
	public static String DEFAULT_ROOT_CODE="0000-0000-0000-0000";
	
	/**
	 * 失败码
	 */
	public static String RESULT_ERROR_CODE="-1";
	
	
	public static Integer STATUS_UNKNOW=-1;
	public static Integer STATUS_STARTING=1;
	public static Integer STATUS_START=2;
	public static Integer STATUS_STOPING=3;
	public static Integer STATUS_STOP=4;
	/**正常*/
	public static Integer STATUS_NORMAL=2;
	/**异常*/
	public static Integer STATUS_ANOMALY=4;
	
	/**自动任务*/
	public static Integer TASK_TYPE_AUTO=1;
	/**手动任务*/
	public static Integer TASK_TYPE_HAND=2;
	
	/**类别*/
	public static String TASK_FOREIGN_NAME_SERVER="server";
	/**app*/
	public static String TASK_FOREIGN_NAME_APP="app";
	/**
	 * 运行状态
	 */
	public static HashMap<Integer, String> STATUSMAP = new LinkedHashMap<Integer, String>();
	/**
	 * 运行状态，查询 用到
	 */
	public static HashMap<Integer, String> STATUSMAP_VALUE = new LinkedHashMap<Integer, String>();
	
	public static HashMap<Integer, String> SERVER_STATUS_VALUE = new LinkedHashMap<Integer, String>();
	public static HashMap<Integer, String> SERVER_STATUS_TEXT = new LinkedHashMap<Integer, String>();
	
	/**
	 * 考核打分
	 */
	public static HashMap<Integer, String> SCORE_MAP = new LinkedHashMap<Integer, String>();
	public static Integer SCORE_EXCELLENT=1;
	public static Integer SCORE_NICE=2;
	public static Integer SCORE_WELL=3;
	public static Integer SCORE_BAD=4;
	
	
	static {
		STATUSMAP.put(STATUS_UNKNOW,"<span style='color:#0078D7;font-weight:bold;'>未  知</span>");
		STATUSMAP.put(STATUS_STARTING, "<span style='color:#C1E80F;font-weight:bold;'>启动中</span>");
		STATUSMAP.put(STATUS_START, "<span style='color:green;font-weight:bold;'>运行中</span>");
		STATUSMAP.put(STATUS_STOPING, "<span style='color:#C1E80F;font-weight:bold;'>停止中</span>");
		STATUSMAP.put(STATUS_STOP, "<span style='color:red;font-weight:bold;'>已停止</span>");
		
		STATUSMAP_VALUE.put(STATUS_UNKNOW,"未  知");
		STATUSMAP_VALUE.put(STATUS_STARTING, "启动中");
		STATUSMAP_VALUE.put(STATUS_START, "运行中");
		STATUSMAP_VALUE.put(STATUS_STOPING, "停止中");
		STATUSMAP_VALUE.put(STATUS_STOP, "已停止");
		
		SERVER_STATUS_VALUE.put(STATUS_NORMAL, "正常");
		SERVER_STATUS_VALUE.put(STATUS_ANOMALY, "异常");
		
		SERVER_STATUS_TEXT.put(STATUS_NORMAL, "<span style='color:green;font-weight:bold'>正常</span>");
		SERVER_STATUS_TEXT.put(STATUS_ANOMALY, "<span style='color:red;font-weight:bold'>异常</span>");
		
		SCORE_MAP.put(SCORE_EXCELLENT, "<span style='color:green;font-weight:bold'>优</span>");
		SCORE_MAP.put(SCORE_NICE, "<span style='color:#1AE3B4;font-weight:bold'>良</span>");
		SCORE_MAP.put(SCORE_WELL, "<span style='color:blue;font-weight:bold'>中</span>");
		SCORE_MAP.put(SCORE_BAD, "<span style='color:red;font-weight:bold'>差</span>");
	}
	
	/**
	 * 监测App定时器
	 */
	public static String TIMER_NAME_CHECK_APP="CHECKAPP";
	
	/**
	 * 工种类别
	 */
	public static String SYS_WORK_TYPE="WORKTYPE";
	
	/**
	 * 工作支出类别
	 */
	public static String SYS_WORK_SPENDING="SPENDING";
	
	/**
	 * 出勤
	 */
	public static Integer CHECK_WORK_STATUS_CQ=1;
	
	/**
	 * 出勤
	 */
	public static Integer CHECK_WORK_STATUS_QQ=2;
	
	/**
	 * 上午
	 */
	public static Integer CHECK_WORK_TIME_MORNING=1;
	
	/**
	 * 下午
	 */
	public static Integer CHECK_WORK_TIME_AFTERNOON=2;
	
	/**
	 * 晚上
	 */
	public static Integer CHECK_WORK_TIME_NIGHT=3;
	
	
	
	
	
	
	/**
	 * 
	 * 方法描述：获取配置文件中某一节点的属性值<br/>
	 * 创建人：王亲臣   <br/>
	 * 创建时间：2014-2-12 下午01:31:28<br/>         
	 * @param nodePath 配置文件节点信息。以"//system"开头<br/>   
	 * @return String<br/>   
	 * @version   1.0<br/>
	 */
	public static String getNodeInfo(String nodePath) {
		String result="";
		File file = new File(config_parameter_path);
		if(!file.exists()){
			return "";
		}
		SAXReader reader = new SAXReader();
		Document doc = null;
		try {
			doc = reader.read(file);
			result=doc.selectSingleNode(nodePath).getText();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	/**
	 * 
	 * 方法描述：反射配置文件为实体对象信息。<br/>例如：Constant.getConfigBean("system//SmsConfig", "SmsConfig", SmsConfig.class);<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-8 上午09:49:51<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@SuppressWarnings("unchecked")
	public static Object getConfigBean(String nodeInfo,String rootNodeName,Class clazz){
		File file = new File(config_parameter_path);
		if(!file.exists()){
			return "";
		}
		SAXReader reader = new SAXReader();
		Document doc = null;
		List<Node> l = null;
		Object object = null;
		try {
			doc = reader.read(file);
			Element root = doc.getRootElement();
			l = root.selectNodes(nodeInfo);
			XStream stream = new XStream(new DomDriver());
			for (Node node : l) {
				stream.alias(rootNodeName, clazz);
				object = stream.fromXML(node.asXML());
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return object;
	}
	
	/**
	 * 
	 * 方法描述：获取当前登录用户<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-21 下午04:40:13<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static User getCurrentLoginUser(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		User user  = (User)request.getSession().getAttribute(Constant.SESSION_USER_KEY);
		return user;
	}
	
	/**
	 * 
	 * 方法描述：获取配置文件信息你<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 下午03:59:20<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static Integer getNum(){
		String text = getNodeInfo("//system//num");
		try {
			return Integer.valueOf(text);
		} catch (Exception e) {
			return 10;
		}
	}
	
	/**
	 * 
	 * 方法描述：获取lic文件信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 下午04:00:35<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getLic(){
		String text = getNodeInfo("//system//lic");
		return text;
	}

	/**
	 * 
	 * 方法描述：获取lic文件信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 下午04:00:35<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getPhone(){
		String text = getNodeInfo("//system//phone");
		return text;
	}
	
}
