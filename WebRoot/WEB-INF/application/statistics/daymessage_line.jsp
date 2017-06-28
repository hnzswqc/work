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
	
	<body style="padding:0">  
	<div style="padding:10px;clear: both;">  
	    <div id="daymessageline" style="height:100%">
	    </div>  
	</div>  
	</body>  
	<script type="text/javascript" src="common/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">  
	    var myChart = echarts.init(document.getElementById('daymessageline'));
		// 显示标题，图例和空的坐标轴
		myChart.setOption({
		    title: {
		        text: ''
		    },
		    color: ['#d87a80'],
		    tooltip: {},
		    legend: {
		        data:['短信数量']
		    },
		    xAxis: {
		        data: [],
		        axisLabel : {  
                    show:true,  
                    interval: 0,
                    //x轴字体倾斜
                    rotate:'40'
                } 
		    },
		    yAxis: {},
		    series: [{
		        name: '短信数量',
		        type: 'line',
		        data: []
		    }]
		});
		
		
		$.getJSON('statistics/daymessage.shtml?LTPAToken=${LTPAToken}&result=login', function (data) {  
            if (data.success) { 
               // 填入数据
			    myChart.setOption({
			        xAxis: {
			            data: data.data.xValues
			        },
			        series: [{
			            // 根据名字对应到相应的系列
			            name: '短信数量',
			            data: data.data.yValues
			        }]
			    });
            } else {  
                alert('提示', data.msg);  
            }  
        });  
		
	</script> 
	
</html>
