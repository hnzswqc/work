/*
 * @项目名称: work
 * @文件名称: WorkTypeMapper.java
 * @日期: 2017-6-4 上午08:34:33  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.worktype.mapper;

import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.worktype.model.WorkType;

/**    
 * 项目名称：work   <br/>
 * 类名称：WorkTypeMapper.java   <br/>
 * 类描述：类别mapper   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-6-4 上午08:34:33   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-6-4 上午08:34:33   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface WorkTypeMapper extends BaseMapper<WorkType, WorkTypeMapper> {

}
