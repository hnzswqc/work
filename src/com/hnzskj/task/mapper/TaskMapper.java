/*
 * @项目名称: spms
 * @文件名称: TaskMapper.java
 * @日期: 2017-4-20 下午06:00:14  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.task.mapper;

import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.task.model.Task;

/**    
 * 项目名称：spms   <br/>
 * 类名称：TaskMapper.java   <br/>
 * 类描述：任务定时mapper类   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-20 下午06:00:14   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-20 下午06:00:14   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface TaskMapper extends BaseMapper<Task, TaskMapper> {

}
