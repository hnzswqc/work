<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hnzskj.common.util.constant.Constant"%>
<%@ page import="com.hnzskj.warn.controller.WarnController"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String oaPath = Constant.getNodeInfo("//system//AUDITGUIDE//OA");
String arPath = Constant.getNodeInfo("//system//AUDITGUIDE//AUDITRESULT");
String acPath = Constant.getNodeInfo("//system//AUDITGUIDE//AUDITCONTROL");
String tdmsPath = Constant.getNodeInfo("//system//AUDITGUIDE//TDMS");
String idssPath = Constant.getNodeInfo("//system//AUDITGUIDE//IDSS");

Integer PERSON_ADD=WarnController.PERSON_ADD;
Integer LEADER_PERSON_ADD=WarnController.LEADER_PERSON_ADD;
Integer PERSON_SUBMIT_LEADER=WarnController.PERSON_SUBMIT_LEADER;
Integer LAW_PERSON_CHECK=WarnController.LAW_PERSON_CHECK;
Integer LAW_LEADER_CHECK=WarnController.LAW_LEADER_CHECK;
Integer CHECK_PASS=WarnController.CHECK_PASS;
Integer AUDIT_RECTIFY_LEADER_CHECK=WarnController.AUDIT_RECTIFY_LEADER_CHECK;
Integer AUDIT_RECTIFY_SEND_BACK=WarnController.AUDIT_RECTIFY_SEND_BACK;
Integer AUDIT_RECTIFY_LAW_PERSON_CHECK=WarnController.AUDIT_RECTIFY_LAW_PERSON_CHECK;
Integer AUDIT_RECTIFY_LAW_LEADER_CHECK=WarnController.AUDIT_RECTIFY_LAW_LEADER_CHECK;
Integer RECTIFY_CHECK_PASS=WarnController.RECTIFY_CHECK_PASS;
Integer RECTIFY_CHECK_PASS_NOT_CHECK_ALL=WarnController.RECTIFY_CHECK_PASS_NOT_CHECK_ALL;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<%@ include file="/common/bootstrap.jsp"%>
		<style type="text/css">
			.panel-primary{
				height:270px!important;
			}
		</style>
		<script type="text/javascript">
			//启动加载
			//$(function(){ 
			//	reload_transfer_Tbody_Id();
			//}); 
			$(document).ready(function() {
				reload_transfer_Tbody_Id();
				reload_decision_Tbody_Id();
				reload_leave_Tbody_Id();
				reload_leave_Sick_Tbody_Id();
			});	
			function post(url,personUuid){
				if(null!=personUuid && ''!=personUuid && ''!=url){
					if('xj'==url){
						Ewin.alert({ message: "请到人教科进行销假！" });
					}else{
						window.location.href= "<%=oaPath %>/PMRS/application/sendurl.jsp?url="+url+"?time="+new Date().getTime();
					}
				}else{
					Ewin.alert({ message: "人员信息或链接未找到，请联系管理员！" });
				}
			}
			
		</script>
		<style>
		th{font-size:16px;}
		td{font-size:14px!important;}
		</style>
	</head>

	<body>
	<!-- header start -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- header end -->
	
	
	<!-- content start -->
	<div class="container" style="width:94%!important">
		<div class="row clearfix">
			<div class="col-md-6 column" id="model_" >
				<div class="panel panel-primary" >
					<div class="panel-heading" >
						<h3 class="panel-title">
							移送整改预警
							<div class="close">
								<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入移送待办界面" onclick="javascript:post('<%=arPath %>/collect/transferMatterMain.do','${personUuid}');"></span>
							</div>
							<div class="close">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reload_transfer_Tbody_Id();"></span>
							</div>
						</h3>
					</div>
					  	<table class="table table-bordered table-hover">
							<thead>
							    <tr>
							      <th >整改类别</th>
							      <th >文书名称</th>
							      <th >文书文号</th>
							      <th >状态信息</th>
							    </tr>
							</thead>
								<div  id='transfer_Tbody_Id_wait'  align="center" style="position:absolute;top:40%;left:35%"><img src="images/01.gif" height="50px"/></div >
								<div  id='transfer_Tbody_Id_fail'   align="center" style="padding:18px;margin:18px;position:absolute;top:40%;left:35%;color:#FF0000;font-weight:bold;">加载失败！</div>
							  <tbody id="transfer_Tbody_Id" style="position:relative">
								<!-- 异步加载移送数据 -->
								<script type="text/javascript">
								   function reload_transfer_Tbody_Id(){
									   $("#transfer_Tbody_Id").empty();
									   var url="<%=basePath %>warn/transfer/findTransferList.shtml";
								  	   var LTPAToken = '${LTPAToken}';
								   	   var personUuid = '${personUuid}';
									   $.ajax({url:url,
										    type:"post",
											data:{
												"LTPAToken":LTPAToken,
												"personUuid":personUuid,
												"result":"login",
												"maxInerval":1800
											},
											beforeSend: function(){
												$("#transfer_Tbody_Id_wait").show();
												$("#transfer_Tbody_Id_fail").hide();
											},
											success:function(data){
												$("#transfer_Tbody_Id_wait").hide();
												//判断是否是错误页面
												if("{"==data.substring(0,1)){
													data = eval('(' + data + ')');
													var tr='';
													var docType='其他';
													if(data.success){
														if(data.data.list.length<5){
															$(data.data.list).each(function(i,val) {
																if(""!=val.docCode || null!=val.docCode ){
																	if(val.docCode.indexOf('决')>-1) {
																		docType='决定整改';
																	}else if(val.docCode.indexOf('移')>-1){
																		docType='移送整改';
																	}else if(val.docCode.indexOf('报')>-1){
																		docType='报告整改';
																	}else{
																		docType='其他';
																	}
																	
																}
																var state = '项目执行单位信息录入中';
																if  (<%=PERSON_SUBMIT_LEADER%>==val.state){
																	state='项目执行单位信息录入中（负责人）';
																}else if(<%=LAW_PERSON_CHECK%>==val.state){
																	state='信息审核中'
																}else if(<%=LAW_LEADER_CHECK%>==val.state){
																	state='信息被退回'
																}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																	state='整改中'
																}else if(<%=CHECK_PASS%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LEADER_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=RECTIFY_CHECK_PASS%>==val.state){
																	state='审核通过'
																}else if(<%=RECTIFY_CHECK_PASS_NOT_CHECK_ALL%>==val.state){
																	state='审核结束，但尚有问题未全部整改'
																}else {
																	state='项目执行单位决定信息录入中'
																}



																
																tr =tr+'<tr>'+
																'<td >'+docType+'</td>'+
																'<td title="'+val.title+'">'+val.title+'</td>'+
																'<td title="'+val.docCode+'">'+val.docCode+'</td>'+
																'<td title="'+state+'">'+state+'</td>'+
																'</tr>';
															})
															//不足5行用空数据补齐
															for(var p=data.data.list.length;p<5;p++){
																tr  = tr + '<tr > <td>&nbsp;</td><td></td> <td></td><td></td></tr>';
															}
															
														}else if(data.data.list.length>4){
															$(data.data.list).each(function(i,val) {
																if(""!=val.docCode || null!=val.docCode ){
																	if(val.docCode.indexOf('决')>-1) {
																		docType='决定整改';
																	}else if(val.docCode.indexOf('移')>-1){
																		docType='移送整改';
																	}else if(val.docCode.indexOf('报')>-1){
																		docType='报告整改';
																	}else{
																		docType='其他';
																	}
																	
																}
																var state = '项目执行单位信息录入中';
																if  (<%=PERSON_SUBMIT_LEADER%>==val.state){
																	state='项目执行单位信息录入中（负责人）';
																}else if(<%=LAW_PERSON_CHECK%>==val.state){
																	state='信息审核中'
																}else if(<%=LAW_LEADER_CHECK%>==val.state){
																	state='信息被退回'
																}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																	state='整改中'
																}else if(<%=CHECK_PASS%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LEADER_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																	state='整改中'
																}else if(<%=RECTIFY_CHECK_PASS%>==val.state){
																	state='审核通过'
																}else if(<%=RECTIFY_CHECK_PASS_NOT_CHECK_ALL%>==val.state){
																	state='审核结束，但尚有问题未全部整改'
																}else {
																	state='项目执行单位决定信息录入中'
																}
																tr =tr+'<tr>'+
																'<td >'+docType+'</td>'+
																'<td title="'+val.title+'">'+val.title+'</td>'+
																'<td title="'+val.docCode+'">'+val.docCode+'</td>'+
																'<td title="'+state+'">'+state+'</td>'+
																'</tr>';
															})
														}
													$("#transfer_Tbody_Id").append(tr);
													}else{
														$("#transfer_Tbody_Id_fail").show();
													}
												}else{
													$("#transfer_Tbody_Id_fail").show();
												}
												
											},
											error:function(){
												$("#transfer_Tbody_Id_fail").show();
											}
									});
								   }
								</script>
								
							  </tbody>
						</table>
				</div>
			</div>
			<div class="col-md-6 column" id="model_" >
				<div class="panel panel-primary" >
					<div class="panel-heading" >
						<h3 class="panel-title">
							决定报告预警
							<div class="close">
								<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入决定报告管理界面" onclick="javascript:post('<%=arPath %>/collect/auditDecisionMain.do','${personUuid }');"></span>
							</div>
							<div class="close">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reload_decision_Tbody_Id();"></span>
							</div>
						</h3>
					</div>
					  	<table class="table table-bordered table-hover">
							<thead>
							    <tr>
							      <th >整改类别</th>
							      <th >文书名称</th>
							      <th >文书文号</th>
							      <th >状态信息</th>
							    </tr>
							</thead>
							  	<div  id='decision_Tbody_Id_wait'  align="center" style="position:absolute;top:40%;left:35%"><img src="images/01.gif"  height="50px"/></div >
								<div  id='decision_Tbody_Id__fail'   align="center" style="padding:18px;margin:18px;position:absolute;top:40%;left:35%;color:#FF0000;font-weight:bold;">加载失败！</div>
							  <tbody id="decision_Tbody_Id" style="position:relative">
								<!-- 异步加载移送数据 -->
								<script type="text/javascript">
								   function reload_decision_Tbody_Id(){
									   $("#decision_Tbody_Id").empty();
									   var url="<%=basePath %>warn/decision/findDecisionList.shtml";
									   var LTPAToken = '${LTPAToken}';
									   var personUuid = '${personUuid}';
										$.ajax({url:url,
											    type:"post",
												data:{
													"LTPAToken":LTPAToken,
													"personUuid":personUuid,
													"result":"login",
													"maxInerval":1800
												},
												beforeSend: function(){
													$("#decision_Tbody_Id_wait").show();
													$("#decision_Tbody_Id__fail").hide();
												},
												success:function(data){
													$("#decision_Tbody_Id_wait").hide();
													//判断是否是错误页面
													if("{"==data.substring(0,1)){
														data = eval('(' + data + ')');
														var tr='';
														var docType='其他';
														if(data.success){
															if(data.data.list.length<5){
																$(data.data.list).each(function(i,val) {
																	if(""!=val.docCode || null!=val.docCode ){
																		if(val.docCode.indexOf('决')>-1) {
																			docType='决定整改';
																		}else if(val.docCode.indexOf('移')>-1){
																			docType='移送整改';
																		}else if(val.docCode.indexOf('报')>-1){
																			docType='报告整改';
																		}else{
																			docType='其他';
																		}
																		
																	}
																	var state = '项目执行单位信息录入中';
																	if  (<%=PERSON_SUBMIT_LEADER%>==val.state){
																		state='项目执行单位信息录入中（负责人）';
																	}else if(<%=LAW_PERSON_CHECK%>==val.state){
																		state='信息审核中'
																	}else if(<%=LAW_LEADER_CHECK%>==val.state){
																		state='信息被退回'
																	}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																		state='整改中'
																	}else if(<%=CHECK_PASS%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LEADER_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=RECTIFY_CHECK_PASS%>==val.state){
																		state='审核通过'
																	}else if(<%=RECTIFY_CHECK_PASS_NOT_CHECK_ALL%>==val.state){
																		state='审核结束，但尚有问题未全部整改'
																	}else {
																		state='项目执行单位决定信息录入中'
																	}
																	tr =tr+'<tr>'+
																	'<td title="'+docType+'">'+docType+'</td>'+
																	'<td title="'+val.title+'">'+val.title+'</td>'+
																	'<td title="'+val.docCode+'">'+val.docCode+'</td>'+
																	'<td title="'+state+'">'+state+'</td>'+
																	'</tr>';
																})
																//不足5行用空数据补齐
																for(var p=data.data.list.length;p<5;p++){
																	tr  = tr + '<tr > <td>&nbsp;</td><td></td> <td></td><td></td></tr>';
																}
																
															}else if(data.data.list.length>4){
																$(data.data.list).each(function(i,val) {
																	if(""!=val.docCode || null!=val.docCode ){
																		if(val.docCode.indexOf('决')>-1) {
																			docType='决定整改';
																		}else if(val.docCode.indexOf('移')>-1){
																			docType='移送整改';
																		}else if(val.docCode.indexOf('报')>-1){
																			docType='报告整改';
																		}else{
																			docType='其他';
																		}
																		
																	}
																	var state = '项目执行单位信息录入中';
																	if  (<%=PERSON_SUBMIT_LEADER%>==val.state){
																		state='项目执行单位信息录入中（负责人）';
																	}else if(<%=LAW_PERSON_CHECK%>==val.state){
																		state='信息审核中'
																	}else if(<%=LAW_LEADER_CHECK%>==val.state){
																		state='信息被退回'
																	}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																		state='整改中'
																	}else if(<%=CHECK_PASS%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LEADER_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_SEND_BACK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_PERSON_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=AUDIT_RECTIFY_LAW_LEADER_CHECK%>==val.state){
																		state='整改中'
																	}else if(<%=RECTIFY_CHECK_PASS%>==val.state){
																		state='审核通过'
																	}else if(<%=RECTIFY_CHECK_PASS_NOT_CHECK_ALL%>==val.state){
																		state='审核结束，但尚有问题未全部整改'
																	}else {
																		state='项目执行单位决定信息录入中'
																	}
																	tr =tr+'<tr>'+
																	'<td >'+docType+'</td>'+
																	'<td title="'+val.title+'">'+val.title+'</td>'+
																	'<td title="'+val.docCode+'">'+val.docCode+'</td>'+
																	'<td >'+state+'</td>'+
																	'</tr>';
																})
															}
														$("#decision_Tbody_Id").append(tr);
													}else{
														$("#decision_Tbody_Id__fail").show();
													}
													
													}else{
														$("#decision_Tbody_Id__fail").show();
													}
												},
												error:function(){
													$("#decision_Tbody_Id__fail").show();
												}
										});
								   }
								</script>
							  </tbody>
						</table>
				</div>
			</div>
			<div class="col-md-6 column" id="model_" >
				<div class="panel panel-primary" >
					<div class="panel-heading" >
						<h3 class="panel-title">
							请假待办事项
							<div class="close">
								<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入请假管理界面" onclick="javascript:post('<%=acPath %>/leave/main.do','${personUuid }');"></span>
							</div>
							<div class="close">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reload_leave_Tbody_Id();"></span>
							</div>
						</h3>
					</div>
					  	<table class="table table-bordered table-hover">
							<thead>
							    <tr>
							      <th >申请人</th>
							      <th >部门</th>
							      <th >天数</th>
							      <th >原因</th>
							      <th >时间</th>
							    </tr>
							</thead>
								<div  id='leave_Tbody_Id_wait'  align="center" style="position:absolute;top:40%;left:35%"><img src="images/01.gif"  height="50px"/></div >
								<div  id='leave_Tbody_Id__fail'   align="center" style="padding:18px;margin:18px;position:absolute;top:40%;left:35%;color:#FF0000;font-weight:bold;">加载失败！</div>
							  <tbody id="leave_Tbody_Id" style="position:relative">
								<!-- 异步加载移送数据 -->
								<script type="text/javascript">
								   function reload_leave_Tbody_Id(){
									   $("#leave_Tbody_Id").empty();
									   var url="<%=basePath %>warn/leave/findLeaveList.shtml";
									   var LTPAToken = '${LTPAToken}';
									   var personUuid = '${personUuid}';
										$.ajax({url:url,
											    type:"post",
												data:{
													"LTPAToken":LTPAToken,
													"personUuid":personUuid,
													"result":"login",
													"maxInerval":1800
												},
												beforeSend: function(){
													$("#leave_Tbody_Id_wait").show();
													$("#leave_Tbody_Id__fail").hide();
												},
												success:function(data){
													$("#leave_Tbody_Id_wait").hide();
													//判断是否是错误页面
													if("{"==data.substring(0,1)){
														data = eval('(' + data + ')');
														var tr='';
														var docType='其他';
														if(data.success){
															if(data.data.list.length<5){
																$(data.data.list).each(function(i,val) {
																	
																	tr =tr+'<tr>'+
																	'<td >'+val.userName+'</td>'+
																	'<td >'+val.orgName+'</td>'+
																	'<td >'+val.day+'</td>'+
																	'<td >'+val.leaveType+'</td>'+
																	'<td >'+val.startDate+'</td>'+
																	'</tr>';
																})
																//不足5行用空数据补齐
																for(var p=data.data.list.length;p<5;p++){
																	tr  = tr + '<tr > <td>&nbsp;</td><td></td> <td></td><td></td><td></td></tr>';
																}
																
															}else if(data.data.list.length>4){
																$(data.data.list).each(function(i,val) {
																	tr =tr+'<tr>'+
																	'<td >'+val.userName+'</td>'+
																	'<td >'+val.orgName+'</td>'+
																	'<td >'+val.day+'</td>'+
																	'<td >'+val.leaveType+'</td>'+
																	'<td >'+val.startDate+'</td>'+
																	'</tr>';
																})
															}
														$("#leave_Tbody_Id").append(tr);
													}else{
														$("#leave_Tbody_Id__fail").show();
													}
													
													}else{
														$("#leave_Tbody_Id__fail").show();
													}
												},
												error:function(){
													$("#leave_Tbody_Id__fail").show();
												}
										});
								   }
								</script>
								
							  </tbody>
						</table>
				</div>
			</div>
			<div class="col-md-6 column" id="model_" >
				<div class="panel panel-primary" >
					<div class="panel-heading" >
						<h3 class="panel-title">
							未按期销假预警
							<div class="close">
								<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="提醒销假" onclick="javascript:post('xj','${personUuid}');"></span>
							</div>
							<div class="close">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reload_leave_Sick_Tbody_Id();"></span>
							</div>
						</h3>
					</div>
					  	<table class="table table-bordered table-hover">
							<thead>
							    <tr>
							      <th >当前人</th>
							      <th >部门</th>
							      <th >天数</th>
							      <th >原因</th>
							      <th >时间</th>
							    </tr>
							</thead>
								<div  id='leave_Sick_Tbody_Id_wait'  align="center" style="position:absolute;top:40%;left:35%"><img src="images/01.gif"  height="50px"/></div >
								<div  id='leave_Sick_Tbody_Id_fail'   align="center" style="padding:18px;margin:18px;position:absolute;top:40%;left:35%;color:#FF0000;font-weight:bold;">加载失败！</div>
							  <tbody id="leave_Sick_Tbody_Id" style="position:relative">
								<!-- 异步加载移送数据 -->
								<script type="text/javascript">
									function reload_leave_Sick_Tbody_Id(){
									   $("#leave_Sick_Tbody_Id").empty();
									   var url="<%=basePath %>warn/leave/findLeaveSickList.shtml";
									   var LTPAToken = '${LTPAToken}';
									   var personUuid = '${personUuid}';
									     $.ajax({url:url,
											    type:"post",
												data:{
													"LTPAToken":LTPAToken,
													"personUuid":personUuid,
													"result":"login",
													"maxInerval":1800
												},
												beforeSend: function(){
													$("#leave_Sick_Tbody_Id_wait").show();
													$("#leave_Sick_Tbody_Id_fail").hide();
												},
												success:function(data){
													$("#leave_Sick_Tbody_Id_wait").hide();
													//判断是否是错误页面
													if("{"==data.substring(0,1)){
														data = eval('(' + data + ')');
														var tr='';
														var docType='其他';
														if(data.success){
															if(data.data.list.length<5){
																$(data.data.list).each(function(i,val) {
																	
																	tr =tr+'<tr>'+
																	'<td >'+val.userName+'</td>'+
																	'<td >'+val.orgName+'</td>'+
																	'<td >'+val.day+'</td>'+
																	'<td >'+val.leaveType+'</td>'+
																	'<td >'+val.startDate+'</td>'+
																	'</tr>';
																})
																//不足5行用空数据补齐
																for(var p=data.data.list.length;p<5;p++){
																	tr  = tr + '<tr > <td>&nbsp;</td><td></td> <td></td><td></td><td></td></tr>';
																}
																
															}else if(data.data.list.length>4){
																$(data.data.list).each(function(i,val) {
																	tr =tr+'<tr>'+
																	'<td >'+val.userName+'</td>'+
																	'<td >'+val.orgName+'</td>'+
																	'<td >'+val.day+'</td>'+
																	'<td >'+val.leaveType+'</td>'+
																	'<td >'+val.startDate+'</td>'+
																	'</tr>';
																})
															}
														$("#leave_Sick_Tbody_Id").append(tr);
													}else{
														$("#leave_Sick_Tbody_Id_fail").show();
													}
													
													}else{
														$("#leave_Sick_Tbody_Id_fail").show();
													}
												},
												error:function(){
													$("#leave_Sick_Tbody_Id_fail").show();
												}
										});
									}
								   
								</script>
								
							  </tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
	<!-- content end -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("[name='myChecked']").bootstrapSwitch({onText:"开启",offText:"关闭",onColor:"primary",offColor:"danger"});	
		});

    </script>
									    
	</body>
</html>
