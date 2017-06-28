<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<%@ include file="/common/bootstrap.jsp"%>
<style>
.funcabar{
    height: 30px;
    background: #F9F9F7;
    border-bottom: 1px solid #DDD;
    position: relative;
    margin-left: 0px;
}

.topmenu_switcher{
    background-image: url("images/close_1.png");
    position: absolute;
    width: 16px;
    height: 31px;
    left: 76px;
    top: 0px;
    cursor: pointer;
    margin-left: 10px;
}

.top_active{
    background-image: url("images/open_1.png");
}

.topTitle span{
    font-weight: bold;
	margin-left: 10px;
	padding-left: 10px;
    line-height: 30px;
    color: black;
}
.topTitle span:HOVER{
	cursor: pointer;
}



.funcmenu_switcher{
    background-image: url("images/close.png");
    position: absolute;
    width: 31px;
    height: 16px;
    left: 165px;
    top: 8px;
    padding-left: 30px;
    cursor: pointer;
    margin-left: 10px;
}

.active{
    background-image: url("images/open.png");
}

.title span{
	font-weight: bold;
    left: 110px;
    top: 1px;
    position: absolute;
    line-height: 30px;
    color: black;
}
.title span:HOVER{
	cursor: pointer;
}

.user{
	float: right;
    line-height: 30px;
}
.user span{
	
    left: 220px;
    top: 0px;
    position: absolute;
    line-height: 30px;
    color: black;
}
.user span:HOVER{
	cursor: pointer;
}



</style>
<html>
<script type="text/javascript">

</script>
  <body>
  	<div class="funcabar">
  		
  		<div class="topTitle" >
  			<span>顶部导航</span>&nbsp;&nbsp;&nbsp;
  		</div>
  		<div class="topmenu_switcher top_active" title="隐藏左侧导航" id="topmenu_switcher" onclick="javascript:changeTop();"></div>
  		<input type="hidden" id="top" value="open"/>
  		
  		<div class="title" >
  			<span>左侧导航</span>&nbsp;&nbsp;&nbsp;
  		</div>
  		<div class="funcmenu_switcher active" title="隐藏左侧导航" id="funcmenu_switcher" onclick="javascript:change();"></div>
  		<input type="hidden" id="left" value="open"/>
  		
  		<div class="user" >
  			<span  aria-hidden="true" title="刷新面板" id="user" >
  				&nbsp;&nbsp;
  			</span>
  			
  		</div>
  		
  		
  	</div>
  </body>
  
  <script type="text/javascript">
  	function showLeft(){
  		$("#funcmenu_switcher").addClass("active"); 
  		$("#funcmenu_switcher").attr("title","显示左侧导航");
  		$("#left").attr("value","open");
  		self.parent.mainFrame.colsFrame.cols="230px,*"
  		
  	}

  	function hideLeft(){
  		$("#funcmenu_switcher").removeClass("active"); 
  		$("#funcmenu_switcher").attr("title","隐藏左侧导航");
  		$("#left").attr("value","close");
  		self.parent.mainFrame.colsFrame.cols="0px,*"
  	}

  	function change(){
  	  	var s = $("#left").val();
  	  	if(s=="close"){
  	  		showLeft();
  	  	}else{
  	  		hideLeft();
  	  	}
  	}

	function showTop(){
  		$("#topmenu_switcher").addClass("top_active"); 
  		$("#topmenu_switcher").attr("title","显示顶部导航");
  		$("#top").attr("value","open");
  		self.parent.frameset.rows="50px,30px,*";
  	}

  	function hideTop(){
  		$("#topmenu_switcher").removeClass("top_active"); 
  		$("#topmenu_switcher").attr("title","隐藏头部导航");
  		$("#top").attr("value","close");
  		self.parent.frameset.rows="0px,30px,*";
  	}

  	function changeTop(){
  	  	var s = $("#top").val();
  	  	if(s=="close"){
  	  		showTop();
  	  	}else{
  	  		hideTop();
  	  	}
  	}

  	$(document).ready(function() {
  		function time() {
  			var date = new Date();
  			var n = date.getFullYear();
  			var y = date.getMonth()+1;
  			var t = date.getDate();
  			var h = date.getHours();
  			var m = date.getMinutes();
  			var s = date.getSeconds();

  			var style=n+"年"+y+"月"+t+"日&nbsp;"+h+"时"+m+"分"+s+"秒";
  			$("#user").html("欢迎您：${SESSION_USER_KEY.userName }&nbsp;&nbsp;当前时间："+style);
  			
  		}
  		time();
  		setInterval(time, 1000);
  	});
  	
  </script>
</html>
