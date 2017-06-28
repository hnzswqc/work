<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>服务器管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	</head>
	<frameset cols="15%,85%">
		<frame src='${menu }/tree.shtml' name="leftFrame" id="leftFrame" scrolling="auto" frameborder="0" >
		<frame src="" name="mainFrame" id="mainFrame" scrolling="auto"  frameborder="0">
	</frameset>
	<noframes>
		<body>
		<h1>您的浏览器不支持框架</h1>
		</body>
	</noframes>
</html>
