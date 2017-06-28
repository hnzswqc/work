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
	
<style type="text/css">
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 400px;
	position: absolute;
	top: 50%;

	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 300px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px !important;
}
.form-control,
.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
.form-control{
	height: 40px!important;
}
</style>

</head>

<body>
<%@ include file="/common/bootstrap.jsp"%>
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small><%=Constant.config_title %></small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form action="adminLogin.shtml" method="post" id="">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="loginName" name="loginName" class="form-control" placeholder="登录名称">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions ">
					<div class="col-xs-12" style="text-align: center;">
						<button type="submit" class="btn btn-sm btn-info" style="width: 470px;" onclick="javascript:return login()"><span class="glyphicon glyphicon-off" style="font-weight: bo"></span> &nbsp;&nbsp;登&nbsp;&nbsp;录</button>
						<%--
						<button type="button" class="btn btn-sm btn-info" onclick="javascript:window.location.href='<%=basePath %>'"><span class="glyphicon glyphicon-off"></span> 首页</button>
						 --%> 
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12" style="text-align: center;">
						<p class="text-center remove-margin;" style="color: red;font-weight: bold;padding-top: 10px;"><small id="msg">
						<c:if test="${loginMsg eq 'loginError' }">用户名或密码错误！</c:if>
						<c:if test="${loginMsg eq 'loginOut' }">退出登录！</c:if>
						<c:if test="${loginMsg eq 'autoCodeError' }">您的试用期已到，请您联系电话<%=Constant.getPhone() %>进行授权</c:if>
						</small> 
						</p>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function login(){
		var loginName=$.trim($("#loginName").val());
		if(loginName==""){
			$("#msg").html("登录名称不能为空");
			$("#loginName").focus();
			return false;
		}
		var password=$.trim($("#password").val());
		if(password==""){
			$("#msg").html("密码不能为空");
			$("#password").focus();
			return false;
		}
		return true;
	}

	window.onload=function(){
		var url= top.location.href;
		if(url.indexOf('loginOut')<=0){
			window.top.location.href= "loginOut.shtml?loginMsg=${loginMsg}";
		}
	}
</script>
</body>

</html>