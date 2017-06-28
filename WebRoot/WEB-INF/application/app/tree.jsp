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
		function showUrl(orgUuid,orgName,status){
			self.parent.document.getElementById('mainFrame').src="<%=basePath%>${menu}/index.shtml?status="+status+"&serverUuid="+orgUuid+"&serverName="+encodeURI(encodeURI(orgName));
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
			 var status = 0;
			 a.add("${DEFAULT_ROOT_CODE}","-1","<span style='font-weight:bold;'>单位服务器信息(点击查看全部信息)</span>","javascript:showUrl('','全部',1);","","");		
			 <c:forEach items="${orgList}" var="org">
			 	<c:if test="${org.status eq 1 }">	
				 	a.add("${org.uuid}","${org.orgParentUuid}","<span style='font-weight:bold;'>${org.orgName}</span>","javascript:showUrl('${org.uuid}','${org.orgName}','${org.status}');","","");
			 	</c:if>
			 	<c:if test="${!(org.status eq 1) }">	
			 	a.add("${org.uuid}","${org.orgParentUuid}","<span style='font-weight:bold;color:#337AB7' title='${org.orgName}-${org.note}-${org.type ==1?'linux':'window'}'>${org.orgName}-${org.note}-${org.type ==1?'linux':'window'}<span>","javascript:showUrl('${org.uuid}','${org.orgName}','${org.status}');","","");
		 	</c:if>
		     </c:forEach>
		     document.write(a);
		     a.openAll();
		     self.parent.document.getElementById('mainFrame').src="<%=basePath%>${menu}/index.shtml?status=1&serverUuid=&serverName="+encodeURI(encodeURI('全部'));
		</script>
	</body>
</html>
