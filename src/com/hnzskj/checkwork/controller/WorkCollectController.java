/*
 * @项目名称: work
 * @文件名称: WorkCollectController.java
 * @日期: 2017-6-5 下午04:24:00  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.checkwork.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnzskj.checkwork.model.CheckWork;
import com.hnzskj.checkwork.model.WorkCollect;
import com.hnzskj.checkwork.model.WorkCost;
import com.hnzskj.checkwork.service.ICheckWorkService;
import com.hnzskj.checkwork.service.IWorkCollectService;
import com.hnzskj.checkwork.service.IWorkCostService;
import com.hnzskj.common.controller.impl.BaseController;
import com.hnzskj.common.model.Json;
import com.hnzskj.common.model.PageBean;
import com.hnzskj.common.util.constant.Constant;
import com.hnzskj.common.util.date.DateUtil;
import com.hnzskj.user.model.User;
import com.hnzskj.worker.model.Worker;
import com.hnzskj.worker.service.IWorkerService;
import com.hnzskj.worktype.model.WorkType;
import com.hnzskj.worktype.service.IWorkTypeService;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkCollectController.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-5 下午04:24:00   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-5 下午04:24:00   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Controller
@RequestMapping(value="workCollect")
public class WorkCollectController extends BaseController<WorkCollect> {
	
	/**
	 * 用户信息注入
	 */
	@Autowired
	private IWorkCollectService workCollectService = null;
	
	/**
	 * 工人注入
	 */
	@Autowired
	private IWorkerService workerService = null;
	
	/**
	 * 开销类别
	 */
	@Autowired
	private IWorkTypeService workTypeService = null;
	
	/**
	 * 考勤业务
	 */
	@Autowired
	private ICheckWorkService checkWorkService = null;
	
	/**
	 * 其他花费业务层
	 */
	@Autowired
	private IWorkCostService workCostService = null;
	
	/**
	 * 导出标志
	 */
	private String EXPORT_STR="export";
	
	
	
	
	/**
	 * 
	 * 方法描述：信息注入<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2016-10-9 上午11:31:58<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@Autowired
	public void setBaseService() {
		super.setBaseService(workCollectService);
	}


	/* (non-Javadoc)
	 * @see com.hnzskj.common.controller.impl.BaseController#index(java.lang.Object, com.hnzskj.common.model.PageBean)
	 */
	@Override
	@RequestMapping(value="index")
	public ModelAndView index(@ModelAttribute()WorkCollect workCollect, @ModelAttribute()PageBean<WorkCollect> pageBean) {
		return super.index(workCollect, pageBean);
	}
	
	/**
	 * 
	 * 方法描述：导出功能<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午03:45:40<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="index_export")
	public ModelAndView index_export(@ModelAttribute()WorkCollect workCollect){
		ModelAndView modelAndView =super.index(workCollect, null);
		modelAndView.setViewName("/workCollect/index_export");
		return modelAndView;
	}
	
	
	/**
	 * 
	 * 方法描述：进入添加界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-5 下午04:57:36<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="addPage")
	public ModelAndView addPage(@ModelAttribute()WorkCollect workCollect){
		ModelAndView modelAndView = new ModelAndView("/workCollect/add");
		Worker worker = new Worker();
		worker.setStatus(1);//查询在职的人员
		List<Worker> list = workerService.find(null, worker).getList();
		modelAndView.addObject("list", list);
		String  date = DateUtil.getCurrentDate();
		if(StringUtils.isNotEmpty(workCollect.getDate())){
			date = workCollect.getDate();
		}
		
		//花销类别
		List<WorkCost> workCostList = workCostService.find(null,new WorkCost(date)).getList();
		if(null!=workCostList&&!workCostList.isEmpty()){
			modelAndView.addObject("workCostList", workCostList);
		}else{
			//花销类别
			List<WorkType> workTypeList = workTypeService.find(null,new WorkType(Constant.SYS_WORK_SPENDING)).getList();
			modelAndView.addObject("workTypeList", workTypeList);
		}
		modelAndView.addObject("date", date);
		return modelAndView;
	}
	
	/**
	 *
	 * 方法描述：进入修改界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午06:59:26<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="updPage")
	public ModelAndView updPage(@ModelAttribute()WorkCollect workCollect){
		ModelAndView modelAndView = getWorkCollectInfo(workCollect);
		return modelAndView;
	}


	/**
	 * 方法描述：<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 上午09:48:31<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>   
	 */
	private ModelAndView getWorkCollectInfo(WorkCollect workCollect) {
		ModelAndView modelAndView = new ModelAndView("/workCollect/add");
		
		//获取汇总信息
		workCollect = workCollectService.findByPrimaryKey(workCollect);
		modelAndView.addObject("workCollect", workCollect);
		
		
		Worker worker = new Worker();
		worker.setStatus(1);//查询在职的人员
		List<Worker> list = checkWorkService.findByDate(workCollect);
		modelAndView.addObject("list", list);
		
		//花销类别
		List<WorkCost> workCostList = workCostService.find(null,new WorkCost(workCollect.getDate())).getList();
		modelAndView.addObject("workCostList", workCostList);
		modelAndView.addObject("date", workCollect.getDate());
		return modelAndView;
	}
	
	
	/**
	 * 
	 * 方法描述：查看详细信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 上午09:47:03<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="show")
	public ModelAndView show(@ModelAttribute()WorkCollect workCollect,String export){
		ModelAndView modelAndView = getWorkCollectInfo(workCollect);
		if(EXPORT_STR.equals(export)){
			modelAndView.setViewName("/workCollect/show_export");
		}else{
			modelAndView.setViewName("/workCollect/show");
		}
		return modelAndView;
	}
	
	
	
	
	/**
	 * 
	 * 方法描述：保存或修改的方法<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 上午10:25:04<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="modify")
	@ResponseBody
	public String modify(@ModelAttribute()WorkCollect workCollect){
		User user = getCurrentUser();
		if(user==null){
			return new Json(false,"用户登录超时").toJson();
		}
		//添加考勤基础信息
		addCheckWork(user, workCollect.getList(),workCollect.getDate());
		//添加花费信息
		addWorkCost(user, workCollect.getWorkCostList(), workCollect.getDate());
		//添加汇总信息
		workCollect.setUserUuid(UUID.randomUUID().toString());
		workCollect.setUserName(user.getUserName());
		workCollect.setUserUuid(user.getUuid());
		workCollectService.deleteByDate(workCollect);
		workCollect.setUuid(UUID.randomUUID().toString());
		boolean result = workCollectService.add(workCollect);
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}
	
	/**
	 * 
	 * 方法描述：添加考勤基础信息<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午03:58:08<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	private void addCheckWork(User user,List<CheckWork> list,String date){
		if(list.isEmpty()){
			return;
		}
		
		List<CheckWork> newList = new ArrayList<CheckWork>();
		CheckWork checkWork = null;
		for (int i = 0; i < list.size(); i++) {
			checkWork = list.get(i);
			if(null!=checkWork&&StringUtils.isNotEmpty(checkWork.getTime())){
				checkWork.setUuid(UUID.randomUUID().toString());
				checkWork.setUserUuid(user.getUserUuid());
				checkWork.setUserName(user.getUserName());
				checkWork.setDate(date);
				newList.add(checkWork);
			}
		}
		//先删除
		checkWorkService.deleteByDate(new CheckWork(date));
		if(!newList.isEmpty()){
			//再添加
			checkWorkService.addCheckWorkList(newList);
		}
	}
	
	
	/**
	 * 
	 * 方法描述：添加<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午04:46:27<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	public void addWorkCost(User user,List<WorkCost> list,String date){
		if(list.isEmpty()){
			return;
		}
		List<WorkCost> newList = new ArrayList<WorkCost>();
		WorkCost workCost = null;
		for (int i = 0; i < list.size(); i++) {
			workCost = list.get(i);
			if(null!=workCost&&StringUtils.isNotEmpty(workCost.getWorkType())){
				workCost.setUuid(UUID.randomUUID().toString());
				workCost.setUserUuid(user.getUuid());
				workCost.setUserName(user.getUserName());
				workCost.setDate(date);
				newList.add(workCost);
			}
		}
		//删除
		workCostService.deleteByDate(new WorkCost(date));
		if(!newList.isEmpty()){
			//添加
			workCostService.addCheckCostList(newList);
		}
	}
	
	
	/**
	 * 
	 * 方法描述：检查当前日期的考核信息是否存在<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午06:27:22<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="checkDate")
	@ResponseBody
	public String checkDate(@ModelAttribute()WorkCollect workCollect){
		boolean result = workCollectService.checkDate(workCollect);
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}
	
	/**
	 * 
	 * 方法描述：删除<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-7 下午06:27:22<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@ModelAttribute()WorkCollect workCollect){
		workCollect = workCollectService.findByPrimaryKey(workCollect);
		checkWorkService.deleteByDate(new CheckWork(workCollect.getDate()));
		workCostService.deleteByDate(new WorkCost(workCollect.getDate()));
		boolean result = workCollectService.delete(workCollect);
		return new Json(result,result?SUCCESS_STRING:FAIL_STRING).toJson();
	}
	
	
	/**
	 * 
	 * 方法描述：统计年度数据<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:39:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectYear")
	public ModelAndView collectYear(String year){
		if(StringUtils.isEmpty(year)){
			year = DateUtil.getCurrentYear();
		}
		List<WorkCollect> list = workCollectService.collectYear(year);
		ModelAndView modelAndView =new ModelAndView("/index/year");
		if(null!=list&&!list.isEmpty()){
			modelAndView.addObject("workCollect", list.get(0));
			modelAndView.addObject("year", year);
		}
		return modelAndView;
	} 

	/**
	 * 
	 * 方法描述：统计年度数据<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:39:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectQuarter")
	public ModelAndView collectQuarter(Integer quarter){
		if(null==quarter||quarter==0){
			quarter = DateUtil.getCurrentQuarter();
		}
		List<WorkCollect> list = workCollectService.collectQuarter(quarter);
		ModelAndView modelAndView =new ModelAndView("/index/quarter");
		if(null!=list&&!list.isEmpty()){
			modelAndView.addObject("workCollect", list.get(0));
			modelAndView.addObject("year", DateUtil.getCurrentYear());
			modelAndView.addObject("quarter", quarter);
			modelAndView.addObject("quarterName", DateUtil.getCurrentQuarterName());
		}
		return modelAndView;
	} 
	
	/**
	 * 
	 * 方法描述：统计年度数据<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:39:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectMonth")
	public ModelAndView collectMonth(String month){
		if(StringUtils.isEmpty(month)){
			Integer m  = DateUtil.getCurrentMonth();
			if(m<10){
				month = "0"+m;
			}
		}
		List<WorkCollect> list = workCollectService.collectMonth(month);
		ModelAndView modelAndView =new ModelAndView("/index/month");
		if(null!=list&&!list.isEmpty()){
			modelAndView.addObject("workCollect", list.get(0));
			modelAndView.addObject("year", DateUtil.getCurrentYear());
			modelAndView.addObject("month", month);
			modelAndView.addObject("monthText", DateUtil.numberText[DateUtil.getCurrentMonth()-1]);
		}
		return modelAndView;
	} 
	
	/**
	 * 
	 * 方法描述：统计年度数据<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-8 下午05:39:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectDate")
	public ModelAndView collectDate(){
		List<WorkCollect> list = workCollectService.collectDate();
		ModelAndView modelAndView =new ModelAndView("/index/date");
		if(null!=list&&!list.isEmpty()){
			modelAndView.addObject("workCollect", list.get(0));
			modelAndView.addObject("year", DateUtil.getCurrentYear());
		}
		return modelAndView;
	} 
	
	
	/**
	 * 
	 * 方法描述：考勤分析界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 下午02:46:46<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="analysePage")
	public ModelAndView analysePage(@ModelAttribute()WorkCollect workCollect){
		ModelAndView modelAndView =new ModelAndView("/workCollect/analyse");
		return modelAndView;
	}
	
	/**
	 * 
	 * 方法描述：考勤分析界面<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 下午02:46:46<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="analyse_export")
	public ModelAndView analyse_export(@ModelAttribute()WorkCollect workCollect){
		ModelAndView modelAndView =new ModelAndView("/workCollect/analyse_export");
		buildParam(workCollect);
		List<WorkCollect> list1 = workCollectService.collectWorkerByMonth(workCollect);
		List<WorkCost> list2 = workCollectService.collectCostByMonth(workCollect);
		List<WorkCollect> list3 = workCollectService.collectMonthByDate(workCollect);
		List<WorkCollect> list4 = workCollectService.collectYearByMonth(workCollect);
		modelAndView.addObject("list1", list1);
		modelAndView.addObject("list2", list2);
		modelAndView.addObject("list3", list3);
		modelAndView.addObject("list4", list4);
		modelAndView.addObject("year", workCollect.getYear());
		modelAndView.addObject("month", workCollect.getMonth());
		return modelAndView;
	}
	
	
	
	

	/**
	 * 方法描述：设置参数<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 上午11:14:02<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>   
	 */
	private void buildParam(WorkCollect workCollect) {
		if(null==workCollect.getYear()){
			workCollect.setYear(Integer.valueOf(DateUtil.getCurrentYear()));
		}
		if(null==workCollect.getMonth()){
			workCollect.setMonth(DateUtil.getCurrentMonth());
		}
	}
	
	/**
	 * 
	 * 方法描述：查询某月花费的趋势图<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 下午03:43:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectMonthByDate")
	@ResponseBody
	public String collectMonthByDate(@ModelAttribute()WorkCollect workCollect){
		buildParam(workCollect);
		List<WorkCollect> list = workCollectService.collectMonthByDate(workCollect);
		return new Json(true, list, list.size()).toJson();
	}
	
	/**
	 * 
	 * 方法描述：查询近十天花费的趋势图<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-9 下午03:43:06<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectYearByMonth")
	@ResponseBody
	public String collectYearByMonth(@ModelAttribute()WorkCollect workCollect){
		buildParam(workCollect);
		List<WorkCollect> list = workCollectService.collectYearByMonth(workCollect);
		return new Json(true, list, list.size()).toJson();
	}
	
	/**
	 * 
	 * 方法描述：查询人员出出勤率以及获取优数量<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 上午11:13:31<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectWorkerByMonth")
	@ResponseBody
	public String collectWorkerByMonth(@ModelAttribute()WorkCollect workCollect){
		buildParam(workCollect);
		List<WorkCollect> list = workCollectService.collectWorkerByMonth(workCollect);
		return new Json(true, list, list.size()).toJson();
	}
	
	/**
	 * 
	 * 方法描述：查询人员出出勤率以及获取优数量<br/>
	 * 创建人：King   <br/>
	 * 创建时间：2017-6-10 上午11:13:31<br/>         
	 * @param <br/>   
	 * @return <br/>   
	 * @version   1.0<br/>
	 */
	@RequestMapping(value="collectCostByMonth")
	@ResponseBody
	public String collectCostByMonth(@ModelAttribute()WorkCollect workCollect){
		buildParam(workCollect);
		List<WorkCost> list = workCollectService.collectCostByMonth(workCollect);
		return new Json(true, list, list.size()).toJson();
	}


	
	
	
}
