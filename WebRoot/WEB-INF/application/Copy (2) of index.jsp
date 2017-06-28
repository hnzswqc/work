<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("POWER_STATUS_DISABLE",Constant.POWER_STATUS_DISABLE);
request.setAttribute("POWER_STATUS_ENABLE",Constant.POWER_STATUS_ENABLE);
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
			table td{
				vertical-align:middle!important;
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
	</head>

	<body>
	<!-- header start -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- header end -->
	
	<c:if test="${empty pageBean.list}">
		<div class="container" style="margin-top: 70px;">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-primary" >
						<div class="panel-heading">
							<h3 class="panel-title">
								没有启用的模块
							</h3>
						</div>
						<div class="panel-body panel-body-height" >
							<span style="color:red">还没有启用的模块信息，请联系系统管理员进行配置！</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${!empty pageBean.list}">
			 <!-- content start -->
			<div class="container" >
				<div class="row clearfix">
					<c:forEach items="${pageBean.list}" var="model" varStatus="i">
						<c:set value="${fu:findPowerList(model.uuid)}" var="powerList"></c:set>
						<div class="col-md-4 column" id="model_">
							<div class="panel panel-primary" >
								<div class="panel-heading">
									<h3 class="panel-title">
										${model.modelName }
										<div class="close">
											<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入管理界面" onclick="javascript:post('<%=basePath %>power/index.shtml',{'modelUuid':'${model.uuid }'});"></span>
										</div>
										<c:if test="${!empty powerList}">
											<div class="close">
												<span class="glyphicon glyphicon-stop" aria-hidden="true" title="全部关闭" onclick="javascript:modifyTimerClick(${POWER_STATUS_DISABLE},'${model.uuid }','${model.modelName }');"></span>
											</div>
											<div class="close">
												<span class="glyphicon glyphicon-play" aria-hidden="true" title="全部开启" onclick="javascript:modifyTimerClick(${POWER_STATUS_ENABLE},'${model.uuid }','${model.modelName }');"></span>
											</div>
										</c:if>
									</h3>
								</div>
								<div class="panel-body panel-body-height" style="overflow: auto">
									<%--
									<c:if test="${empty powerList}">
										<span style="color:red">该模块还未配置相关功能，请联系系统管理员进行配置！</span>
									</c:if>
									 --%>
									<c:if test="${!empty powerList}">
										<table class="table table-hover" >
										<tbody>
											<c:forEach items="${powerList}" var="power">
											<tr>
												<td  title="${power.powerName }">
													 <a class="tooltip-test" data-toggle="tooltip" title="${power.powerName }" style="cursor: hand;">${power.powerName }</a>
												</td>
												<td>
												    <input id="switch_${power.uuid }" type="checkbox" <c:if test="${power.powerStatus == POWER_STATUS_ENABLE }">checked="checked"</c:if> name="myChecked"  data-handle-width="40" data-size="mini" onclick="JavaScript:switchClick(this);" value="${power.uuid }"/>
												    <input type="hidden" id="status_${power.uuid }" value="${power.powerStatus }"/>
												</td>
												<td >
													<button type="button" class="btn" onclick="javascript:showSendMsg('${power.powerKey}');">短信记录</button>
													<%--
												   <a href="javascript:void(0);"> <span class="badge am-badge-warning" title="当前发送短信量14条">14</span></a>
												    --%>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
									</c:if>
								</div>
							</div>
						</div>
					<!-- 三个panel进行换行 -->
					<!-- content end -->
					</c:forEach>
				</div>
			</div>
	</c:if>
   
	
	 
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("[name='myChecked']").bootstrapSwitch({onText:"开启",offText:"关闭",onColor:"primary",offColor:"danger"});
		});
		$(function () { $("[data-toggle='tooltip']").tooltip(); });
		var state=0;

		$("[name='myChecked'][id^=switch_]").on('switchChange.bootstrapSwitch', function (e, state) {
			var value = e.currentTarget.value;
			var msg ="开启";
            if(state){
	           $("#status_"+value).attr("value",${POWER_STATUS_ENABLE});
	        }else{
	        	$("#status_"+value).attr("value",${POWER_STATUS_DISABLE});
	        	msg="关闭";
		    }
			var status = $("#status_"+value).val();
            Ewin.confirm({message:"确定要<em>"+msg+"</em>吗？"}).on(function(e){
				if(!e){
					$("#switch_"+value).bootstrapSwitch('state', !state, true);
					return;
				}
				$.ajax({
					url:'<%=basePath%>power/updateStatus.shtml',
					type:'POST',
					data:{"uuid":value,"powerStatus":status},
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: "<em>"+msg+"成功！</em>" });
						}else{
							Ewin.alert({ message:"操作失败，状态关闭!<br/>"+json.msg });
							$("#switch_"+value).bootstrapSwitch('state', !state, true);
						}
					},
					error:function(e){
						Ewin.alert({ message: "操作出现异常！" });
					}
				});
			});		    
            $("div[id^=mdl]").find(".glyphicon-remove").remove();
	    });

		//全部关闭或开启
		function modifyTimerClick(status,modelUuid,modelName){
			var msg="";
			if(status == ${POWER_STATUS_DISABLE}){
				msg = "全部关闭["+modelName+"]模块信息";
			}else{
				msg = "全部开启["+modelName+"]模块信息";
			}
			Ewin.confirm({message:"确定要<em>"+msg+"</em>吗？"}).on(function(e){
				if(!e){
					return;
				}
				$.ajax({
					url:'<%=basePath%>power/updateAllStatus.shtml?status='+status,
					type:'POST',
					data:{"modelUuid":modelUuid},
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: "<em>"+msg+"成功!</em>" }).on(function (e) {
								window.location.reload(true);
				     	  });
						}else{
							Ewin.alert({ message:"操作失败，状态关闭!\n\r"+json.msg });
						}
					},
					error:function(e){
						Ewin.alert({ message: "操作出现异常！" });
					}
				});
				
			});
		}

		//查看短信记录
		function showSendMsg(viewName){
			post("<%=basePath%>sendMsg/index.shtml",{"viewName":viewName});			
		}
	    
	    
	    
    </script>
									    
	</body>
</html>
