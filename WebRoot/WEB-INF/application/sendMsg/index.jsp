<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("SENDMSG_UNOPEN",Constant.SENDMSG_UNOPEN);
request.setAttribute("SENDMSG_FAIL",Constant.SENDMSG_FAIL);
request.setAttribute("SENDMSG_SUCCESS",Constant.SENDMSG_SUCCESS);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>短信记录查询</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.panel{
			margin-bottom:0px!important;
		}
		.panel-default{
			border:none!important;
		}
		
		.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-handle-off, 
		.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-handle-on, 
		.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-label{
			clear: both;
			padding:5px 5px !important;
		    font-size: 12px!important;
		    line-height: 1.5!important;
		}
		
	</style>
		<%@ include file="/common/bootstrap.jsp"%>
	</head>

	<body>
		<form action="<%=basePath%>sendMsg/index.shtml" id="queryForm" name="queryForm" method="post">
			<input type="hidden" name="page" id="reqPage" value="${pageBean.page }">
			<input type="hidden" name="limit" id="limit" value="${pageBean.limit }">
			<input type="hidden" name="viewName" value="${sendMsg.viewName }">
			<input type="hidden" name="type" value="${sendMsg.type }">
			<input type="hidden" name="startTime" value="${sendMsg.startTime }">
			<input type="hidden" name="endTime" value="${sendMsg.endTime }">
			<input type="hidden" name="cnname" value="${sendMsg.cnname }">
			<input type="hidden" name="state" value="${sendMsg.state }">
		</form>
	<!-- header start -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- header end -->
	
	<div class="container-fluid" >
		<div class="panel panel-primary" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>sendMsg/index.shtml" method="post">
				  <div class="form-group">
				    <label for="id" style="display: inline;">人员姓名</label>
				    <input type="text"  class="form-control" id="cnname" name="cnname" style="width: 150px!important;" value="${sendMsg.cnname }" placeholder="请输入要查询的人员姓名">
				  </div>
				  
				   <div class="form-group">
				    <label for="name" style="display: inline;">短信类别</label>
			  		<select class="form-control" name="viewName" id="viewName" onchange="javascript:change();">
			  			<option value="">请选择</option>
					   <c:forEach items="${typeList}" var="type">
					   	 <option value="${type.viewName }" ${type.viewName eq sendMsg.viewName?'selected':'' }>${type.name }</option>
					   </c:forEach>
				    </select>
				  </div>
				   <div class="form-group">
	                 <label for="startTime" style="display: inline;">开始时间</label>
	                <div class="input-group date form_date " data-date="" data-date-format="yyyy-mm-dd" data-link-field="startTime" data-link-format="yyyy-mm-dd">
	                    <input class="form-control"  type="text" value="${sendMsg.startTime }" style="width: 100px!important;" onfocus="WdatePicker({el:'startTime',maxDate:$('#endTime').val()});" readonly name="startTime" id="startTime">
	                    <%--
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
	                     --%>
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                </div>
	             </div>
	             <div class="form-group">
	                 <label for="endTime" style="display: inline;">结束时间</label>
	                <div class="input-group date form_date" data-date="yyyy-mm-dd" data-date-format="yyyy-mm-dd" data-link-field="endTime" data-link-format="yyyy-mm-dd">
	                    <input class="form-control"  type="text" value="${sendMsg.endTime }" style="width: 100px!important;" onfocus="WdatePicker({el:'endTime',minDate:$('#startTime').val()});" readonly name="endTime" id="endTime">
	                     <%--
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
	                     --%>
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                </div>
	             </div>
				  <div class="form-group">
				    <label for="name" style="display: inline;">短信状态</label>
			  		 <select class="form-control" name="state" id="state" onchange="javascript:change();">
					   <option value="">请选择</option>
				       <option value="${SENDMSG_UNOPEN }" ${sendMsg.state eq SENDMSG_UNOPEN?'selected':'' }>未开启</option>
				       <option value="${SENDMSG_SUCCESS }" ${sendMsg.state eq SENDMSG_SUCCESS?'selected':'' }>成功</option>
				       <option value="${SENDMSG_FAIL }" ${sendMsg.state eq SENDMSG_FAIL?'selected':'' }>失败</option>
				    </select>
				  </div>
				  <button type="submit" class="btn btn-default">查询</button>
  				  <button type="button" class="btn btn-info" onclick="javascript:resetForm();">重置</button>
				</form>
		   </div>
		</div>
		
	<%--
	<div class="panel panel-default" >
		<div class="panel-body" style="padding-left:0px!important;">
			<a href="javascript:showSearchPanel();" class="btn btn-primary" id="searchLink">查询</a>
		</div>
	</div>
	 --%>
	<div class="panel panel-primary" style="margin-top: 10px!important;">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		短信发送记录
 		    	<div class="close">
					<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新界面" onclick="javascript:refreshIconClick();"></span>
				</div>
		      </h3>
		   </div>
				<table class="table table-bordered table-hover">
				<thead>
				    <tr  onclick="javascript:clickBtn();">
				    <%--
				      <th width="50px">选择</th>
				     --%>
				      <th width="50px">序号</th>
				      <th style="text-align: center!important;width: 100px;">人员姓名</th>
				      <th style="min-width: 200px;">发送内容</th>
				      <th style="min-width: 100px;">备注信息</th>
				      <th style="text-align: center!important;width: 120px;">短信类别</th>
				      <th style="text-align: center!important;width: 100px;">发送状态</th>
				      <th style="text-align: center!important;width: 150px;">发送时间</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="sendMsg" varStatus="i">
							<tr >
							<%--
								<td style="text-align: center;">
									<input type="radio" name="uuid" value="${sendMsg.uuid }"/>
								</td>
							 --%>
								<td style="text-align: center;">
									${(pageBean.page-1)*pageBean.limit+i.index+1 }
								</td>
								<td style="text-align: center!important;">
									${sendMsg.cnname }
								</td>
								<td title="${sendMsg.content }">
									${sendMsg.content }
								</td>
								<td title="${sendMsg.note }">
									${sendMsg.note }
								</td>
								<td style="text-align: center!important;">
									${sendMsg.typeName }
								</td>
								<td style="text-align: center!important;">
									<c:choose>
										<c:when test="${sendMsg.state eq SENDMSG_UNOPEN}">
											<span style="color: blue;font-weight: bold;">未开启</span>
										</c:when>
										<c:when test="${sendMsg.state eq SENDMSG_SUCCESS}">
											<span style="color: green;font-weight: bold;">成功</span>
										</c:when>
										<c:when test="${sendMsg.state eq SENDMSG_FAIL}">
											<span style="color: red;font-weight: bold;">失败</span>
										</c:when>
										<c:otherwise>
											<span>未知</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td style="text-align: center!important;width: 150px;" title="${sendMsg.createTime }">
									${fn:substring(sendMsg.createTime,0,10) }
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pageBean.list}">
						<tr>
							<td colspan="7" style="text-align: center;">
								对不起，没有您要查找的数据
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		<br/>
		<c:if test="${!empty pageBean.list }">
			<jsp:include page="/common/page.jsp"></jsp:include>
		</c:if>
		
		
   
	



	
	<script type="text/javascript">

		//页面加载要做的事情
		$(document).ready(function() {
		});

		//下拉框检索
		function change(){
			$("#searchForm").submit();
		}

		//重置
		function resetForm(){
			$("#searchForm").clear();
			$("#searchForm").submit();
		}


		//刷新按钮
		function refreshIconClick(){
			window.location.href="<%=basePath %>sendMsg/index.shtml";
		}

		
	</script>					    
	</body>
</html>
