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
	    <div id="typemessagepie" style="height:330px;">
	    </div>  
	</div>  
	</body>  
	<script type="text/javascript" src="common/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">  
	    var myChart = echarts.init(document.getElementById('typemessagepie'));
		// 显示标题，图例和空的坐标轴
		myChart.setOption({
	            tooltip : {
	                trigger: 'item',
	                formatter: "{a} <br/>{b} : {c} ({d}%)"
	            },
	            color: ['#5ab1ef','#b6a2de','#ffb980','#2ec7c9','#d87a80','#2e90c9','#b7d1d0','#02e0c9','#6474d5'],
	            legend: {
	                data:[]
	            },
	            toolbox: {
	                show : true,
	                feature : {
	                    mark : {show: true},
	                    magicType : {
	                        show: true, 
	                        type: ['pie', 'funnel'],
	                        option: {
	                            funnel: {
	                                x: '25%',
	                                width: '50%',
	                                funnelAlign: 'center',
	                                max: 1700
	                            }
	                        }
	                    }
	                }
	            },
	            series : [
	                {
	                    name:'短信数量',
	                    type:'pie',
	                    center: ['50%', '50%'],
	                    radius: '50%',
	                    data:[
	                    ]
	                }
	            ]
	        }
		);
		
		
		$.getJSON('statistics/typemessage.shtml?LTPAToken=${LTPAToken}&result=login', function (data) {  
            if (data.success) { 
               // 填入数据
			    myChart.setOption({
			        legend: {
	                	data:data.data.slabels
	          		},
			        series: [{
			            // 根据名字对应到相应的系列
			            data: data.data.svalues
			        }]
			    });
            } else {  
                alert('提示', data.msg);  
            }  
        });  
		
	</script> 
	
</html>
