<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		.panel-body-height{
			height: 390px!important;
		}
		</style>
		<script type="text/javascript">  
			function reloadIframe(a) {
				document.getElementById("iframe"+a).contentWindow.location.reload(true);
			}
		</script>
		
		
	</head>

	<body>
	<!-- header start -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- header end -->
	
			<!-- container start -->
		    <div class="container" >
				<div class="row clearfix">
					<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									收到短信最多的十位员工
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入管理界面" ></span>
									</div>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(1);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="statistics/staffmessagebar.shtml?LTPAToken=${LTPAToken}&result=login" id="iframe1" frameborder="no" width="100%" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
					<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									短信类别统计图
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入管理界面" ></span>
									</div>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(2);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="statistics/typemessagepie.shtml?LTPAToken=${LTPAToken}&result=login"  id="iframe2" width="100%" frameborder="no" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
						<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									近十天短信趋势图
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入管理界面" ></span>
									</div>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(3);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="statistics/daymessageline.shtml?LTPAToken=${LTPAToken}&result=login" id="iframe3" frameborder="no" width="100%" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
					<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									收到短信最多的十个机构
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" title="进入管理界面" ></span>
									</div>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(4);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="statistics/organizemessagebar.shtml?LTPAToken=${LTPAToken}&result=login" id="iframe4" frameborder="no"  width="100%" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		<!-- container end -->
	 
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("[name='myChecked']").bootstrapSwitch({onText:"开启",offText:"关闭",onColor:"primary",offColor:"danger"});	
		});

    </script>
									    
	</body>
</html>
