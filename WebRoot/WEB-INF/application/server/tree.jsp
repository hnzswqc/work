<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("DEFAULT_ROOT_CODE",Constant.DEFAULT_ROOT_CODE);
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
		<%@ include file="/common/bootstrap.jsp"%>
	</head>
	<script type="text/javascript">
		function showUrl(orgUuid,orgName){
			self.parent.document.getElementById('mainFrame').src="<%=basePath%>server/index.shtml?orgUuid="+orgUuid+"&orgName="+encodeURI(encodeURI(orgName));
		}
	</script>
	<body>
		<script type="text/javascript">
			 a = new dTree('a');
			 a.config.useCookies=false;
			 a.config.folderLinks=true;
			 //a.config.target = "right";
			 var firstOrgUuid="";
			 var firstOrgName="";
			 a.add("${DEFAULT_ROOT_CODE}","-1","单位信息(点击查看全部信息)","javascript:showUrl('','全部');","","");		
			 <c:forEach items="${orgList}" var="org">
			   	a.add("${org.uuid}","${org.orgParentUuid}","${org.orgName}","javascript:showUrl('${org.uuid}','${org.orgName}');","","");
		     </c:forEach>
		     document.write(a);
		     a.openAll();
		     self.parent.document.getElementById('mainFrame').src="<%=basePath%>server/index.shtml?orgUuid=&orgName="+encodeURI(encodeURI('全部'));
		</script>
	</body>
</html>
