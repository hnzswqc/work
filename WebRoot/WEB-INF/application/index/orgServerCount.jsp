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

		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
	</head>
	
	<body>  
	<div>  
	  
	    <div id="staffmessagebar" style="width: 100%;height: 100%">
	    	
	    </div>
	</div>  
	</body>  
	<script type="text/javascript" src="common/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">  
    var myChart = echarts.init(document.getElementById('staffmessagebar'));
	
	var option = {
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    series : [
		        {
		            name: '服务器数量',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
						<c:forEach items="${list}" var="c" varStatus="i">
						{value:${c.normal}, name:'${c.orgName}'}
						<c:if test="${!i.last}">
							,
						</c:if>
						</c:forEach>
		            ],
		            itemStyle: {
			        	normal:{ 
		                  label:{ 
		                    show: true, 
		                    formatter: '{b} : {c} ({d}%)' 
		                  }, 
		                  labelLine :{show:true} 
		                } ,
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};


	myChart.setOption(option);
	window.onresize = myChart.resize;


		
	</script> 
	
	
</html>
