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
	    <div id="staffmessagebar" style="height:100%">
	    </div>  
	</div>  
	</body>  
	<script type="text/javascript" src="common/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">  
	    var myChart = echarts.init(document.getElementById('staffmessagebar'));
		// 显示标题，图例和空的坐标轴
		myChart.setOption({
			//柱子颜色
		    color: ['#5ab1ef'],
		    //柱子宽度
		    barCategoryGap:'39%',
		    tooltip : {
	                trigger: 'item'
	            },
		    label:{ 
				normal:{ 
					show: true, 
					position: 'outside'
				} 
			},
		    legend: {
		        data:['短信数量']
		    },
		    xAxis: {
		        data: [],
		        axisLabel : {  
                    show:true,  
                    interval: 0,
                    rotate:'40'
                }   
		    },
		    yAxis: {},
		    series: [{
		        name: '短信数量',
		        type: 'bar',
		        itemStyle: {
	                normal: {
	                    color: function(params) {
	                        
	                        var colorList = [
	                          '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0',
	                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
	                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD'
	                           
	                        ];
	                        return colorList[params.dataIndex]
	                    }
	                }
	            },
		        data: []
		    }]
		});
		
		
		$.getJSON('statistics/staffmessage.shtml?LTPAToken=${LTPAToken}&result=login', function (data) {  
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
