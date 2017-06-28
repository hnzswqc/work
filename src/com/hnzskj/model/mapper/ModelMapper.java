/*
 * @项目名称: ewsm
 * @文件名称: ModelMapper.java
 * @日期: 2016-10-9 上午09:27:20  
 * @版权: 2016 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.model.mapper;

import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.model.model.Model;

/**    
 * 项目名称：ewsm   <br/>
 * 类名称：ModelMapper.java   <br/>
 * 类描述：  模块管理到层接口 <br/>
 * 创建人：King   <br/>
 * 创建时间：2016-10-9 上午09:27:20   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2016-10-9 上午09:27:20   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface ModelMapper extends BaseMapper<Model, ModelMapper> {


}
