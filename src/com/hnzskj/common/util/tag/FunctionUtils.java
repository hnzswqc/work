/*
 * @项目名称: tzsj
 * @文件名称: ELFunUtils.java
 * @日期: 2011-5-30
 * @版权: 2011 河南中审科技有限公司 Inc. All rights reserved.
 * @开发公司或单位：河南中审科技有限公司研发部
 */

package com.hnzskj.common.util.tag;


import java.util.List;

import org.apache.log4j.Logger;

import com.hnzskj.checkwork.model.CheckWork;
import com.hnzskj.checkwork.service.ICheckWorkService;
import com.hnzskj.common.util.shell.PortUtil;
import com.hnzskj.common.util.spring.SpringConfigTools;
import com.hnzskj.worker.model.Worker;


/**
 * 
 * 项目名称：ewsm   <br/>
 * 类名称：FunctionUtils.java   <br/>
 * 类描述： jsp页面函数  <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-18 上午10:01:55   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-18 上午10:01:55   <br/>
 * 修改备注：    <br/>
 * @version  1.0
 */
public class FunctionUtils {
	
	/**
	 * 日志
	 */
	private static Logger log = Logger.getLogger(FunctionUtils.class);
	
	public void test(){
		log.info("test");
	}
	
	/**
	 * 
	 * 方法描述：判断当前IP是否通畅<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-4-13 下午02:22:11<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static boolean isPing(String ip){
		return PortUtil.isPing(ip);
	}
	
	/**
	 * 
	 * 方法描述：获取考勤的信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午07:22:03<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static List<CheckWork> findCheckWorkList(String date,Worker worker){
		ICheckWorkService checkWorkService = (ICheckWorkService)SpringConfigTools.getBean(ICheckWorkService.class);
		CheckWork checkWork = new CheckWork();
		checkWork.setWorkerUuid(worker.getUuid());
		checkWork.setDate(date);
		List<CheckWork> list = checkWorkService.find(null,checkWork).getList();
		return list;
	}
	

}
