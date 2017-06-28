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
	var size = ${fn:length(list)};
	var x=new Array(size); 
	var s1=new Array(size);
	var s2=new Array(size);
	
	<c:forEach items="${list}" var="c" varStatus="i">
		x[${i.index}]='${c.orgName}';
		s1[${i.index}]=${c.normal};
		s2[${i.index}]=${c.anomaly};
	</c:forEach>
	

	
	var option = {
		backgroundColor:'#fff',
		color: ['#3ECB00','#FF0005'],
		title:{
			//text:'',
			left:'center'
		},
		tooltip : {
			trigger: 'axis',
			axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			}
		},
	    
		legend: {
			top:'26px',
			borderColor:'#ccc',
			borderWidth:'1',
			data:['正常数量','异常数量']
		},
		grid: {
			left: '3%',
			right: '4%',
			bottom: '15%',
			containLabel: true,
			borderColor:'#FF0000'
		},
		xAxis : [
			{
				//name:'单位',
				nameLocation:'middle',
				type : 'category',
				data : x,
				bottom:10,
				splitLine:{
					interval:'0'
				},
				axisTick:{
					interval:'0'
				}
			}
		],
		yAxis : [
			{
				type : 'value',
				//name:'数量',
				nameLocation:'middle',
				splitArea: {show : true},
				nameGap:'30'
			}
		],
		series : [
			
			{
				name:'正常数量',
				type:'bar',
				stack: '天数',
				barWidth:'20',
				data:s1
			},
			{
				name:'异常数量',
				type:'bar',
				stack: '天数',
				barWidth:'20',
				data:s2
			},
			]
	};

	myChart.setOption(option);
	window.onresize = myChart.resize;


		
	</script> 
	
	
</html>
