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
	

	<frameset rows="80px,*,20px" border="0" frameborder="0" framespacing="0" marginwidth="0" marginheight="0">
		<frame name="header" src="common/header.jsp" scrolling="no">
		<frameset cols="15%,*" border="0" frameborder="0" framespacing="0">
			<frame src='server/tree.shtml' name="leftFrame" id="leftFrame" scrolling="auto" frameborder="0" >
		<frame src="server/index.shtml" name="mainFrame" id="mainFrame" scrolling="auto"  frameborder="0">
	</frameset>
		<%--
		<frame name="footer" src="footer.htm" scrolling="no">
		 --%>
	</frameset>
	
	<noframes>
		<body>
		</body>
	</noframes>



	<noframes>
		<body>
		<h1>您的浏览器不支持框架</h1>
		</body>
	</noframes>
</html>
