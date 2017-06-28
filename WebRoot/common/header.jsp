<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("URL",request.getRequestURI());
%>

<!DOCTYPE HTML>
<%@ include file="/common/bootstrap.jsp"%>
<html>
  <body>
  <c:if test="${empty header_hidden}">
		    <!--导航-->
		  <div class="container" style="margin-bottom: 60px;">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
						<div class="navbar-header">
							  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> 
							  <a class="navbar-brand" href="<%=basePath%>"><%=Constant.config_title %>&nbsp;<%=Constant.config_version %></a>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right">
								<li>
									 <a href="javascript:window.location.href='<%=basePath%>index.shtml'"  ${menu eq 'index'?"class='navbar-activate'":"" } target="mainFrame">主界面 </a>
								</li>
								<li>
									 <a href="javascript:window.location.href='<%=basePath%>user/index.shtml'"  ${menu eq 'user'?"class='navbar-activate'":"" } target="mainFrame">
										 用户管理 
									 </a>
								</li>
								<li>
									 <a href="javascript:window.location.href='<%=basePath%>org/index.shtml'"  ${menu eq 'user'?"class='navbar-activate'":"" } target="mainFrame">
										单位管理 
									 </a>
								</li>
								<li>
									 <a href="javascript:window.location.href='<%=basePath%>server/main.shtml'"  ${menu eq 'user'?"class='navbar-activate'":"" } target="mainFrame">
										服务器管理 
									 </a>
								</li>
								<li>
									 <a href="javascript:window.location.href='<%=basePath%>user/updPassword.shtml'"  ${menu eq 'updPassword'?"class='navbar-activate'":"" } target="mainFrame">
										 修改密码
									 </a>
								</li>
								<%--
								<li ${fn:contains('model,power,rule,sendMsg',menu)?"class='dropdown navbar-activate'":"class='dropdown'" }>
					                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
					                 	   短信预警管理
					                    <b class="caret"></b>
					                </a>
					                <ul class="dropdown-menu header">
					                    <li>
											 <a href="javascript:window.location.href='<%=basePath%>model/index.shtml'" ${menu eq 'model'?"class='navbar-activate'":"" }>模块管理</a>
										</li>
										<li>
											 <a href="javascript:window.location.href='<%=basePath%>power/index.shtml'" ${menu eq 'power'?"class='navbar-activate'":"" }>功能管理</a>
										</li>
										<li>
											 <a href="javascript:window.location.href='<%=basePath%>rule/index.shtml'" ${menu eq 'rule'?"class='navbar-activate'":"" }>定时规则管理</a>
										</li>
										<li>
											 <a href="javascript:window.location.href='<%=basePath%>sendMsg/index.shtml'" ${menu eq 'sendMsg'?"class='navbar-activate'":"" }>短信发送记录</a>
										</li>
										<!-- 
					                    <li class="divider"></li>
					                     -->
					                </ul>
					            </li>
					            <li ${fn:contains('warn',menu)?"class='dropdown navbar-activate'":"class='dropdown'" }>
					                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
					                 	   待办预警模块管理
					                    <b class="caret"></b>
					                </a>
					                <ul class="dropdown-menu header">
					                   <li>
										 <a href="javascript:window.location.href='<%=basePath%>warn/index.shtml'" ${menu eq 'warn'?"class='navbar-activate'":"" }>待办预警</a>
									</li>
										<!-- 
					                    <li class="divider"></li>
					                     -->
					                </ul>
					            </li>
					             <li ${fn:contains('statistics,pageInfo,pagePower',menu)?"class='dropdown navbar-activate'":"class='dropdown'" }>
					                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
					                 	  统计分析模块管理
					                    <b class="caret"></b>
					                </a>
					                <ul class="dropdown-menu header">
					                 	<li>
											<a href="javascript:window.location.href='<%=basePath%>pageInfo/index.shtml'"  ${menu eq 'pageInfo'?"class='navbar-activate'":"" }>图形界面管理</a>
									   </li>
									   <li>
											<a href="javascript:window.location.href='<%=basePath%>pagePower/index.shtml'"  ${menu eq 'pagePower'?"class='navbar-activate'":"" }>功能管理</a>
									   </li>
					                   <li>
											<a href="javascript:window.location.href='<%=basePath%>statistics/index.shtml'"  ${menu eq 'statistics'?"class='navbar-activate'":"" }>统计分析 </a>
									   </li>
										<!-- 
					                    <li class="divider"></li>
					                     -->
					                </ul>
					            </li>
					             --%>
							</ul>
						</div>
						
					</nav>
				</div>
			</div>
		</div>
	</c:if>
  </body>
</html>
