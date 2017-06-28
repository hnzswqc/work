/*
 * @项目名称: ewsm
 * @文件名称: DateUtil.java
 * @日期: 2016-7-24 下午05:25:15  
 * @版权: 2011 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.common.util.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：DateUtil.java   <br/>
 * 类描述：时间格式化   <br/>
 * 创建人：开发部笔记本   <br/>
 * 创建时间：2016-7-24 下午05:25:15   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-7-24 下午05:25:15   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
public class DateUtil {
	
	/**
	 * 月份
	 */
	public static String[]numberText = new String[]{"一","二","三","四","五","六","七","八","九","十","十一","十二"};
	
	/**
	 * 
	 * 方法描述：时间格式化yyyy<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-7-24 下午05:27:23<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getCurrentYear(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		String data = format.format(date);
		return data;
	}
	
	/**
	 * 
	 * 方法描述：时间格式化yyyy-MM-dd<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-7-24 下午05:27:23<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getCurrentDate(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String data = format.format(date);
		return data;
	}
	
	/**
	 * 
	 * 方法描述：时间格式化yyyy-MM-dd HH:mm:ss<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-7-24 下午05:27:23<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getCurrentTime(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String data = format.format(date);
		return data;
	}
	
	/**
	 * 
	 * 方法描述：时间格式化yyyy-MM-dd HH:mm:ss<br/>
	 * 创建人：开发部笔记本   <br/>
	 * 创建时间：2016-7-24 下午05:27:23<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getCurrentTimeStamp(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String data = format.format(date);
		return data;
	}
	
	/**
	 * 
	 * 方法描述：获取当前月份<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 上午10:47:43<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@SuppressWarnings("static-access")
	public static Integer getCurrentMonth(){
	   Calendar c=Calendar.getInstance();
       c.setTime(new Date());
       int month=c.get(c.MONTH)+1;
       return month;
	}
	
	/**
	 * 
	 * 方法描述：获取当前季度1、2、3、4<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 上午10:50:03<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static Integer getCurrentQuarter(){
	    Integer month = getCurrentMonth();
	    Integer quarter = 1;    
        if(month>=1&&month<=3){     
            quarter=1;     
        }     
        if(month>=4&&month<=6){     
            quarter=2;       
        }     
        if(month>=7&&month<=9){     
            quarter =3;     
        }     
        if(month>=10&&month<=12){     
            quarter = 4;     
        }
        return quarter;
	}
	
	/**
	 * 
	 * 方法描述：获取当前季度中文名一、二、三、四<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 上午10:50:03<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public static String getCurrentQuarterName(){
		Integer quarter = getCurrentQuarter();
		String quarterName = numberText[quarter-1];
		return quarterName;
	}
	
	
}
