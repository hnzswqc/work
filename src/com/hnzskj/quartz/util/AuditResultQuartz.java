/*
 * @项目名称: ewsm
 * @文件名称: AuditResultQuartz.java
 * @日期: 2016-10-25 下午03:31:18  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.quartz.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：AuditResultQuartz.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-25 下午03:31:18   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-25 下午03:31:18   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class AuditResultQuartz implements Job {

	
	/* (non-Javadoc)
	 * @see org.quartz.Job#execute(org.quartz.JobExecutionContext)
	 */
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		try {
			 DateFormat df = new SimpleDateFormat("yyyy年MM月dd日  HH时mm分ss秒");
			System.out.println(df.format(new Date()) + "时，AuditResultQuartz输出了：Hello World!!!"+arg0.getScheduler().getSchedulerName());  
		} catch (SchedulerException e) {
			e.printStackTrace();
		}  
	}

}
