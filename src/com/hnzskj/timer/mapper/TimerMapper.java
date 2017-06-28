/*
 * @项目名称: spms
 * @文件名称: TimerMapper.java
 * @日期: 2017-4-26 下午02:26:35  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.timer.mapper;

import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.timer.model.Timer;

/**    
 * 项目名称：spms   <br/>
 * 类名称：TimerMapper.java   <br/>
 * 类描述：   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-26 下午02:26:35   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-26 下午02:26:35   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface TimerMapper extends BaseMapper<Timer, TimerMapper> {

}
