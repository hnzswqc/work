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
			title: {
				text:'${year}年总支出<fmt:formatNumber type="number" value="${workCollect.wages+workCollect.lendMoney+workCollect.other }" pattern="0.00" maxFractionDigits="2"/>元',
				x:'center'
			},
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend:{
			    orient:'vertical',
			    left:'left',
			    data:['工资总支出','借款总支出','杂项总支出']
			},
		    series : [
		        {
		            name: '${year}年总支出<fmt:formatNumber type="number" value="${workCollect.wages+workCollect.lendMoney+workCollect.other }" pattern="0.00" maxFractionDigits="2"/>元',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '50%'],
		            data:[
						 {value:${workCollect.wages}, name:'工资总支出'},
						 {value:${workCollect.lendMoney}, name:'借款总支出'},
						 {value:${workCollect.other}, name:'杂项总支出'}
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
