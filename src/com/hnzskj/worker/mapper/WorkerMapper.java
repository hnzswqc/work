/*
 * @项目名称: work
 * @文件名称: WorkerMapper.java
 * @日期: 2017-6-4 下午03:36:23  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.worker.mapper;

import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.worker.model.Worker;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkerMapper.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-4 下午03:36:23   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-4 下午03:36:23   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface WorkerMapper extends BaseMapper<Worker, WorkerMapper> {

}
