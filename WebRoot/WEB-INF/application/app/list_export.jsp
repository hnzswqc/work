<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@page import="com.hnzskj.common.util.date.DateUtil"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("map",Constant.STATUSMAP);
request.setAttribute("map_value",Constant.STATUSMAP_VALUE);
String fileName = "总览表"+DateUtil.getCurrentTimeStamp();
response.setContentType("application/x-download;chartset=utf-8");
response.setHeader("Content-Disposition", "attachment;filename="
		+ java.net.URLEncoder.encode(fileName + ".xls", "utf-8"));

%>

<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <!--[if gte mso 9]>
   <xml>
    <o:DocumentProperties>
     <o:Created>2017-04-25T15:25:49</o:Created>
     <o:LastSaved>2017-04-25T15:27:49</o:LastSaved>
    </o:DocumentProperties>
    <o:CustomDocumentProperties>
     <o:KSOProductBuildVer dt:dt="string">2052-10.1.0.6393</o:KSOProductBuildVer>
    </o:CustomDocumentProperties>
   </xml>
  <![endif]-->
  <style>
 
<!-- @page
	{margin:0.98in 0.75in 0.98in 0.75in;
	mso-header-margin:0.51in;
	mso-footer-margin:0.51in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
	 
.style0
	{mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:#000000;
	font-size:16.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"常规";
	mso-style-id:0;}
.xl65
	{mso-style-parent:style0;
	mso-font-charset:160;
	border:.5pt solid windowtext;}


	.caption{
			font-weight: bold;
			font-size: 20px;
			text-align: center;
			font-family: 宋体;
			border-bottom: 0 solid #000000;
			height: 1000px;
		}
		thead td {
			font-weight: bold;
			font-size: 20px;
			text-align: center;
			font-family: 宋体;
			border-bottom: 0 solid #000000;
			height: 30px;
		}
		
		td {
			font-size: 16px;
			text-align: center;
			font-family: 宋体;
			border-bottom: 0 solid #000000;
			height: 30px;
		}
 -->  </style>
  
   </head>
 <body link="blue" vlink="purple" class="xl65">
	<table width="100%" align="center" cellpadding="0" cellspacing="0" border="1">
	<thead>
	    <tr>
	      <th width="50px">序号</th>
	      <th>所属单位</th>
	      <th>服务器</th>
	      <th>IP</th>
	      <th>操作系统</th>
	      <th>用户名</th>
	      <th>密码</th>
	      <th>应用名称</th>
	      <th>项目名称</th>
	      <th>端口号</th>
	      <th>部署路径</th>
	      <th>启动命令</th>
	      <th>关闭命令</th>
	      <th>部署版本</th>
	      <th>部署时间</th>
	      <th>运行状态</th>
	    </tr>
	  </thead>
		<tbody>
		<c:if test="${!empty orgList}">
			<c:forEach items="${orgList}" var="orgMap" varStatus="i">
				<c:set value="${orgMap.value}" var="org"></c:set>
				<tr>
					<td rowspan="${org.count}" style="vertical-align: middle;">
						${i.index+1 }
					</td>
					<td rowspan="${org.count}" style="vertical-align: middle;">
						${org.orgName }
					</td>
				
					<c:forEach items="${serverList[org.orgUuid]}" var="serverMap" varStatus="s">
					
							<c:set value="${serverMap.value}" var="server"></c:set>
								<c:set value="${fn:length(appList[server.serverUuid])}" var="serverCount"></c:set>
							
							<td rowspan="${serverCount}" style="vertical-align: middle;">
								${server.serverName }
							</td>
							<td rowspan="${serverCount}" style="vertical-align: middle;">
								${server.serverIp }
							</td>
							<td rowspan="${serverCount}" style="vertical-align: middle;">
								${server.osName }
							</td>
							<td rowspan="${serverCount}" style="vertical-align: middle;">
								${server.loginName }
							</td>
							<td rowspan="${serverCount}" style="vertical-align: middle;">
								${server.password }
							</td>
							
								<c:forEach items="${appList[server.serverUuid]}" var="appMap" varStatus="a">
									<c:set value="${appMap.value}" var="app"></c:set>
									<td>
										${app.name }
									</td>
									<td>
										${app.projectName }
									</td>
									<td>
										${app.port }
									</td>
									<td>
										${app.path }
									</td>
									<td>
										${app.start }
									</td>
									<td>
										${app.stop }
									</td>
									<td>
										${app.version }
									</td>
									<td>
										${app.createTime }&nbsp;
									</td>
									<td >
										${map[app.runStatus] }
									</td>
									<c:if test="${!a.last}">
										</tr><tr>
									</c:if>
									<c:if test="${a.last}">
										</tr>
									</c:if>
								</c:forEach>
					</c:forEach>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
  </table>
 </body>
</html>