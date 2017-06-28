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
<script type="text/javascript">
	function showUrl(url){
		top.document.getElementById('mainFrame').src=url;
	}

	function loginOut(){
		self.parent.exit();
	}
</script>
  <body>
  <c:if test="${empty header_hidden}">
		    <!--导航-->
		  <div class="container container-fluid " style="margin-bottom: 60px;">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
						<div class="navbar-header">
							  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> 
							  <a class="navbar-brand" href="javascript:void(0);"><%=Constant.config_title %>&nbsp;<%=Constant.config_version %></a>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right">
							
								<li>
									 <a href="javascript:showUrl('<%=basePath%>content.shtml');">测试主界面 </a>
								</li>
								<li>
									 <a href="javascript:showUrl('<%=basePath%>index.shtml');">主界面 </a>
								</li>
								<li>
									  <a href="javascript:showUrl('<%=basePath%>workCollect/index.shtml');">
										考勤管理
									 </a>
								</li>
								<li>
									  <a href="javascript:showUrl('<%=basePath%>workCollect/analysePage.shtml');">
										统计分析
									 </a>
								</li>
								<%--
								<li>
									  <a href="javascript:showUrl('<%=basePath%>org/index.shtml');">
										单位管理 
									 </a>
								</li>
								<li>
									 <a href="javascript:showUrl('<%=basePath%>server/main.shtml');">
										服务器管理 
									 </a>
								</li>
								<li>
									 <a href="javascript:showUrl('<%=basePath%>app/main.shtml');">
										应用管理 
									 </a>
								</li>
								<li>
									 <a href="javascript:showUrl('<%=basePath%>timer/index.shtml');">
										任务信息
									 </a>
								</li>
								<li>
									 <a href="javascript:showUrl('<%=basePath%>task/index.shtml');">
										巡检结果
									 </a>
								</li>
								 --%>
								<li>
									  <a href="javascript:showUrl('<%=basePath%>worker/index.shtml');">
										工人管理
									 </a>
								</li>
								<li>
									  <a href="javascript:showUrl('<%=basePath%>workType/index.shtml?cateGory=WORKTYPE&cateGoryName=工种管理');">
										工种管理
									 </a>
								</li>
								<li>
									  <a href="javascript:showUrl('<%=basePath%>workType/index.shtml?cateGory=SPENDING&cateGoryName=开销类别');">
										开销类别
									 </a>
								</li>
								<li>
									 <a href="javascript:showUrl('<%=basePath%>user/index.shtml');">
										 用户管理 
									 </a>
								</li>
								<li>
									  <a href="javascript:showUrl('<%=basePath%>user/setPassword.shtml');">
										 修改密码
									 </a>
								</li>
								<li>
									  <a href="javascript:loginOut();">
										 退出
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
