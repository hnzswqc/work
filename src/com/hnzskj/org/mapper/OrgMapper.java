/*
 * @项目名称: spms
 * @文件名称: OrgMapper.java
 * @日期: 2017-4-7 下午03:24:39  
 * @版权: 2017 河南中审科技有限公司
 * @开发公司或单位：河南中审科技有限公司研发部
 */
package com.hnzskj.org.mapper;

import org.springframework.stereotype.Repository;

import com.hnzskj.common.mapper.BaseMapper;
import com.hnzskj.org.model.Org;

/**    
 * 项目名称：spms   <br/>
 * 类名称：OrgMapper.java   <br/>
 * 类描述：机构mapper   <br/>
 * 创建人：King   <br/>
 * 创建时间：2017-4-7 下午03:24:39   <br/>
 * 修改人：开发部笔记本   <br/>
 * 修改时间：2017-4-7 下午03:24:39   <br/>
 * 修改备注：    <br/>
 * @version  1.0  
 */
@Repository
public interface OrgMapper extends BaseMapper<Org, OrgMapper> {

}
