<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@page import="com.hnzskj.common.util.date.DateUtil"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setAttribute("quarter",DateUtil.getCurrentQuarterName());

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<%@ include file="/common/bootstrap.jsp"%>
		<style type="text/css">
		.panel-body-height{
			height: 400px!important;
		}
		.column{
			margin-top: 10px!important;
			margin-bottom: 10px!important;
		}
		</style>
		<script type="text/javascript">
			function reloadIframe(a){
				document.getElementById("iframe"+a).contentWindow.location.reload(true);
			}

			//刷新按钮
			function loadAllClick(){
				window.location.href="<%=basePath %>app/findAllApp.shtml?time="+new Date().getTime();
			}
			
		</script>
	</head>
	
	<body style="padding:0">  
		<!-- container start -->
		    <div class="container" >
				<div class="row clearfix">
					<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									最近一天总费用占比分析
									<%--
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" onclick="javascript:loadAllClick();"></span>
									</div>
									 --%>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(1);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="<%=basePath%>workCollect/collectDate.shtml" id="iframe1" frameborder="no" width="100%" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
					<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									<%=DateUtil.getCurrentYear() %>年<%=DateUtil.numberText[DateUtil.getCurrentMonth()-1] %>月份总费用占比分析
									<%--
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" onclick="javascript:loadAllClick();" ></span>
									</div>
									--%>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(2);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="<%=basePath%>workCollect/collectMonth.shtml"  id="iframe2" width="100%" frameborder="no" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
						<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									<%=DateUtil.getCurrentYear() %>年第${quarter }季度总费用占比分析
									<%--
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" onclick="javascript:loadAllClick();" ></span>
									</div>
									--%>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(3);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="<%=basePath%>workCollect/collectQuarter.shtml" id="iframe3" frameborder="no" width="100%" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
					<div class="col-md-6 column" id="model_">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									<%=DateUtil.getCurrentYear() %>年总费用占比分析
									<%--
									<div class="close">
										<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" onclick="javascript:loadAllClick();" ></span>
									</div>
									 --%>
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(4);"></span>
									</div>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto">
								<iframe src="<%=basePath%>workCollect/collectYear.shtml" id="iframe4" frameborder="no"  width="100%" height="100%" scrolling="no"></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- container end -->
	</body>  
	
</html>
