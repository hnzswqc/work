<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@page import="com.hnzskj.common.util.date.DateUtil"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("currentYear",DateUtil.getCurrentYear());
request.setAttribute("currentMonth",DateUtil.getCurrentMonth());
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>日常统计</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.panel{
			margin-bottom:0px!important;
		}
		.panel-default{
			border:none!important;
		}
		table {
			text-align: center;
		}
		table th{
			text-align: center;
		}
		table tr td{
			text-align: center!important;
		}
		
		
	</style>
		<%@ include file="/common/bootstrap.jsp"%>
		<script type="text/javascript" src="common/echarts/echarts.min.js"></script>
		<script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
	</head>

	<body>
	<div class="container-fluid" >
	 <form class="form-inline" id="searchForm" action="<%=basePath%>${menu }/index.shtml" method="post">
  		    <div class="form-group">
		    <label for="id" style="display: inline;">年度：</label>
			<select name="" id="year"   class="form-control" style="width:100px;" onchange="javascript:changeData();">
	    		<c:forEach begin="0" end="<%=Constant.getNum() %>" var="s">
	    			<option value=${currentYear-s }>${currentYear-s }</option>
	    		</c:forEach>
	    	 </select>
  		  	</div>
  		  	 <div class="form-group">
		    <label for="id" style="display: inline;">月份：</label>
			<select name="" id="month"   class="form-control" style="width:100px;" onchange="javascript:changeData();">
	    		<c:forEach begin="0" end="12" var="s" varStatus="i">
	    			<option value=${i.index+1 } ${currentMonth ==i.index+1?'selected':''  }>${i.index+1 }月份</option>
	    		</c:forEach>
	    	 </select>
  		  	</div>
  		  	 <button type="button" class="btn btn-info" onclick="javascript:window.location.reload(true);">重置</button>
  		  	 <a href="javascript:exportBtnClick();" class="btn btn-info" id="exportBtn">导出</a>
  		  	 &nbsp;&nbsp;&nbsp;&nbsp;<em id="msg"></em>
  		  </form>
  		  
  		  <div>
  		  	<em>说明：出勤次数非天数，一天最多上午、下午、晚班三次出勤。</em>
  		  </div>
		<div class="row clearfix">
			<div class="col-md-6 column" id="model_">
			<div class="panel panel-primary" >
				<div class="panel-heading">
					<h3 class="panel-title" id="t3">
						工人出勤次数与评优次数统计
						<%--
						<div class="close">
							<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" onclick="javascript:loadAllClick();" ></span>
						</div>
					
						<div class="close">
							<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(3);"></span>
						</div>
							--%>
					</h3>
				</div>
				<div class="panel-body" style="height: 300px;">
					 <div id="div3" style="width: 100%;height: 300px;text-align: center;vertical-align: middle">
		   		  		<img alt="" src="images/01.gif" id="pic3">
		   		 	 </div>
		   		  <script type="text/javascript">
		   		var colors = ['#C23531', '#2F4554', '#61A0A8','#0D6AE3'];
		   		var myChart3 = echarts.init(document.getElementById('div3'));
		   		var option3 = option = {
		   			    color: colors,
		   				 tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c}"
					    },
		   			    legend: {
		   			        data:['出勤次数','评优次数']
		   			    },
		   			    xAxis: [
		   			        {
		   			            type: 'category',
		   			            axisTick: {
		   			                alignWithLabel: true
		   			            },
		   			            data: []
		   			        }
		   			    ],
		   			    yAxis: [
		   			        {
		   			            type: 'value',
		   			            name: '出勤次数',
		   			            min: 0,
		   			            position: 'left'
		   			        }
		   			    ],
		   			    series: [
		   			        {
		   			            name:'出勤次数',
		   			            type:'bar',
		   			            data:[]
		   			        },
		   			     	{
		   			            name:'评优次数',
		   			            type:'bar',
		   			         	stack: 'sum',
		   			            data:[]
		   			        }
		   			    ]
		   			};

		   		myChart3.setOption(option3);
		   		window.onresize = myChart3.resize;
	
		   		//获取数据
			   	function showData3(year,month){
			   		$.ajax({
						url:"<%=basePath %>workCollect/collectWorkerByMonth.shtml",
						type:'POST',
						data:{"year":year,"month":month},
						dataType:'JSON',
						beforeSend:function(data){
							$("#pic3").show();
						},
						success:function(json){
							$("#pic3").hide();
							if(json.success){
								var size = json.dataSize;
								if(size==0){
									$("#msg").html("没有数据!");
								}else{
									$("#msg").html("&nbsp;");
								}
						   		var x=new Array(size); 
						   		var s1=new Array(size);
						   		var s2=new Array(size);
						   		$.each(json.data,function(i,workCollect){
							   		x[i]=workCollect.workerName;
						   			s1[i]=workCollect.count;
						   			s2[i]=workCollect.score;
							   	});
						   		myChart3.setOption({
						   			dataZoom: [
					   			        {
					   			            show: true,
					   			            realtime: true,
						   			        start: 0,
						   			      	end: 20
					   			        },
					   			        {
					   			            type: 'slider',
					   			            realtime: true,
					   			         	start: 0,
						   			      	end: 20
					   			        }
					   			    ],
						   		 xAxis: [
						   			        {
						   			         	name: '姓名',
						   			            type: 'category',
						   			            axisTick: {
						   			                alignWithLabel: true
						   			            },
						   			            data: x,
						   			            axisLabel:{
							   			            show:true,
							   			            interval:0,
							   			            rotate:'40'
							   			        }
						   			            
						   			        }
						   			    ],
						   		  series: [
						   			        {
						   			            name:'出勤次数',
						   			            type:'bar',
						   			            data:s1
						   			        },
						   			        {
						   			            name:'评优次数',
						   			            type:'bar',
						   			            data:s2
						   			        }
						   			    ]
							   	});
							}
						},
						error:function(e){
							Ewin.alert({ message: "网络出现异常！" });
							$("#pic3").hide();
						}
					});
				}
	   		  </script>
					
				</div>
			</div>
		</div>
		<div class="col-md-6 column" id="model_">
			<div class="panel panel-primary" >
				<div class="panel-heading">
					<h3 class="panel-title" id="t4">
						杂项支出分类汇总统计
						<%--
						<div class="close">
							<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" onclick="javascript:loadAllClick();" ></span>
						</div>
						 
						<div class="close">
							<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(4);"></span>
						</div>--%>
					</h3>
				</div>
				<div class="panel-body" style="height: 300px;">
					 <div id="div4" style="width: 100%;height: 300px;text-align: center;vertical-align: middle">
		   		  		<img alt="" src="images/01.gif" id="pic4">
		   		 	 </div>
					<script type="text/javascript">
					 var myChart4 = echarts.init(document.getElementById('div4'));
						
						var option4 = {
								title: {
									//text:'${year}年总支出<fmt:formatNumber type="number" value="${workCollect.wages+workCollect.lendMoney+workCollect.other }" pattern="0.00" maxFractionDigits="2"/>元',
									x:'center'
								},
							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/>{b} : {c} ({d}%)"
							    },
							    legend:{
								    orient:'vertical',
								    left:'left',
								    data:[]
								},
							    series : [
							        {
							            type: 'pie',
							            radius : '55%',
							            center: ['50%', '50%'],
							            data:[],
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


						myChart4.setOption(option4);
						window.onresize = myChart4.resize;

						//获取数据
					   	function showData4(year,month){
					   		$.ajax({
								url:"<%=basePath %>workCollect/collectCostByMonth.shtml",
								type:'POST',
								data:{"year":year,"month":month},
								dataType:'JSON',
								beforeSend:function(data){
									$("#pic4").show();
								},
								success:function(json){
									$("#pic4").hide();
									
									if(json.success){
										var size = json.dataSize;
										if(size==0){
											$("#msg").html("没有数据!");
										}else{
											$("#msg").html("&nbsp;");
										}
										var x=new Array(size); 
										var data=new Array(size)
										
										$.each(json.data,function(i,workCost){
											x[i]=workCost.workTypeName;
											var wk = new Array(2);
											data[i]={value:workCost.cost,name:workCost.workTypeName};
									   	});
										myChart4.setOption({
											legend: {
									            data: x
									        },
									        series: [{
									            // 根据名字对应到相应的系列
									            name: '金额（元）',
									            data: data
									        }]
									    });
									}
								},
								error:function(e){
									Ewin.alert({ message: "网络出现异常！" });
									$("#pic4").hide();
								}
							});
						}
						
					</script>
				</div>
			</div>
		</div>
	</div>
	
	
		<div class="panel panel-primary"  id="searchPanel" style="margin-top: 10px;">
		   <div class="panel-heading">
		      <h3 class="panel-title" id="t1">
		 		     每天费用支出走势图
		      </h3>
		   </div>
		   <div class="panel-body">
		   		  <div id="div1" style="width: 100%;height: 300px;text-align: center;vertical-align: middle">
		   		  		<img alt="" src="images/01.gif" id="pic1">
		   		  </div>
		   		  <script type="text/javascript">
		   		var colors = ['#C23531', '#2F4554', '#61A0A8','#0D6AE3'];
		   		var myChart = echarts.init(document.getElementById('div1'));
		   		var option = option = {
		   			    color: colors,
		   			    tooltip: {
		   			        trigger: 'axis',
		   			        axisPointer: {
		   			            type: 'cross'
		   			        }
		   			    },
		   			    legend: {
		   			        data:['工资总支出','借款总支出','杂项总支出','总支出']
		   			    },
		   			    xAxis: [
		   			        {
		   			            type: 'category',
		   			            axisTick: {
		   			                alignWithLabel: true
		   			            },
		   			            data: []
		   			        }
		   			    ],
		   			    yAxis: [
		   			        {
		   			            type: 'value',
		   			            name: '金额（元）',
		   			            min: 0,
		   			            position: 'left'
		   			        }
		   			    ],
		   			    series: [
		   			        {
		   			            name:'工资总支出',
		   			            type:'bar',
		   			            stack: 'sum',
		   			            data:[]
		   			        },
		   			        {
		   			            name:'借款总支出',
		   			            type:'bar',
		   			            stack: 'sum',
		   			            data:[]
		   			        },
		   			     	{
		   			            name:'杂项总支出',
		   			            type:'bar',
		   			         	stack: 'sum',
		   			            data:[]
		   			        },
		   			        {
		   			            name:'总支出',
		   			            type:'line',
		   			            data:[]
		   			        }
		   			    ]
		   			};

		   		myChart.setOption(option);
		   		window.onresize = myChart.resize;
	
		   		//获取数据
			   	function showData1(year,month){
			   		$.ajax({
						url:"<%=basePath %>workCollect/collectMonthByDate.shtml",
						type:'POST',
						data:{"year":year,"month":month},
						dataType:'JSON',
						beforeSend:function(data){
							$("#pic1").show();
						},
						success:function(json){
							$("#pic1").hide();
							if(json.success){
								var size = json.dataSize;
								if(size==0){
									$("#msg").html("没有数据!");
								}else{
									$("#msg").html("&nbsp;");
								}
						   		var x=new Array(size); 
						   		var s1=new Array(size);
						   		var s2=new Array(size);
						   		var s3=new Array(size);
						   		var p=new Array(size);
						   		$.each(json.data,function(i,workCollect){
							   		x[i]=workCollect.date;
						   			s1[i]=workCollect.wages;
						   			s2[i]=workCollect.lendMoney;
						   			s3[i]=workCollect.other;
						   			p[i]=workCollect.wages+workCollect.lendMoney+workCollect.other;
							   	});
						   		myChart.setOption({
						   		 xAxis: [
						   			        {
						   			         	name: '日期',
						   			            type: 'category',
						   			            axisTick: {
						   			                alignWithLabel: true
						   			            },
						   			            data: x,
						   			            axisLabel:{
							   			            show:true,
							   			            interval:0,
							   			            rotate:'40'
							   			            
							   			        }
						   			            
						   			        }
						   			    ],
						   		  series: [
						   			        {
						   			            name:'工资总支出',
						   			            type:'bar',
						   			            stack: 'sum',
						   			            data:s1
						   			        },
						   			        {
						   			            name:'借款总支出',
						   			            type:'bar',
						   			            stack: 'sum',
						   			            data:s2
						   			        },
						   			     	{
						   			            name:'杂项总支出',
						   			            type:'bar',
						   			         	stack: 'sum',
						   			            data:s3
						   			        },
						   			        {
						   			            name:'总支出',
						   			            type:'line',
						   			            data:p
						   			        }
						   			    ]
							   	});
							}
						},
						error:function(e){
							Ewin.alert({ message: "网络出现异常！" });
							$("#pic1").hide();
						}
					});
				}
	   		  </script>
		   </div>
		</div>
		
		<div class="panel panel-primary"  id="searchPanel" style="margin-top: 10px;margin-bottom: 10px;">
		   <div class="panel-heading">
		      <h3 class="panel-title" id="t2">
		 		    每月费用支出走势图
		      </h3>
		   </div>
		   <div class="panel-body">
		   		  <div id="div2" style="width: 100%;height: 300px;text-align: center;vertical-align: middle">
		   		  		<img alt="" src="images/01.gif" id="pic2">
		   		  </div>
		   		  <script type="text/javascript">
		   		var colors = ['#C23531', '#2F4554', '#61A0A8','#0D6AE3'];

			   	var myChart2 = echarts.init(document.getElementById('div2'));
		   		var option2 = {
		   			    color: colors,
		   			    tooltip: {
		   			        trigger: 'axis',
		   			        axisPointer: {
		   			            type: 'cross'
		   			        }
		   			    },
		   			    legend: {
		   			        data:['工资总支出','借款总支出','杂项总支出','总支出']
		   			    },
		   			    xAxis: [
		   			        {
		   			            type: 'category',
		   			            axisTick: {
		   			                alignWithLabel: true
		   			            },
		   			            data: []
		   			        }
		   			    ],
		   			    yAxis: [
		   			        {
		   			            type: 'value',
		   			            name: '金额（元）',
		   			            min: 0,
		   			            position: 'left'
		   			        }
		   			    ],
		   			    series: [
		   			        {
		   			            name:'工资总支出',
		   			            type:'bar',
		   			            stack: 'sum',
		   			            data:[]
		   			        },
		   			        {
		   			            name:'借款总支出',
		   			            type:'bar',
		   			            stack: 'sum',
		   			            data:[]
		   			        },
		   			     	{
		   			            name:'杂项总支出',
		   			            type:'bar',
		   			         	stack: 'sum',
		   			            data:[]
		   			        },
		   			        {
		   			            name:'总支出',
		   			            type:'line',
		   			            data:[]
		   			        }
		   			    ]
		   			};

		   		myChart2.setOption(option2);
		   		window.onresize = myChart2.resize;
		   		
		        function showData2(year){
		        	$.ajax({
						url:"<%=basePath %>workCollect/collectYearByMonth.shtml",
						type:'POST',
						data:{"year":year},
						dataType:'JSON',
						beforeSend:function(data){
							$("#pic2").show();
						},
						success:function(json){
							$("#pic2").hide();
							if(json.success){
								var size = json.dataSize;
						   		var x=new Array(size); 
						   		var s1=new Array(size);
						   		var s2=new Array(size);
						   		var s3=new Array(size);
						   		var p=new Array(size);
						   		$.each(json.data,function(i,workCollect){
							   		x[i]=workCollect.month;
						   			s1[i]=workCollect.wages;
						   			s2[i]=workCollect.lendMoney;
						   			s3[i]=workCollect.other;
						   			p[i]=workCollect.wages+workCollect.lendMoney+workCollect.other;
							   	});
						   		myChart2.setOption({
						   		 xAxis: [
						   			        {
						   			         	name: '月份',
						   			            type: 'category',
						   			            axisTick: {
						   			                alignWithLabel: true
						   			            },
						   			            data: x,
						   			         	axisLabel : {
							   			        	formatter: function(value){
							   			        		return value+"月份";
							   			        	}
						   			        	 }
						   			        }
						   			    ],
						   		  series: [
						   			        {
						   			            name:'工资总支出',
						   			            type:'bar',
						   			            stack: 'sum',
						   			            data:s1
						   			        },
						   			        {
						   			            name:'借款总支出',
						   			            type:'bar',
						   			            stack: 'sum',
						   			            data:s2
						   			        },
						   			     	{
						   			            name:'杂项总支出',
						   			            type:'bar',
						   			         	stack: 'sum',
						   			            data:s3
						   			        },
						   			        {
						   			            name:'总支出',
						   			            type:'line',
						   			            data:p
						   			        }
						   			    ]
							   	});
							}
						},
						error:function(e){
							Ewin.alert({ message: "网络出现异常！" });
							$("#pic2").hide();
						}
					});
			    }

	   		  </script>
		   </div>
		</div>
		
		
		
	</div>
	<script type="text/javascript">

		$(function(){
				showData1(${currentYear},${currentMonth});
				showData2(${currentYear});
				showData3(${currentYear},${currentMonth});
				showData4(${currentYear},${currentMonth});
				changeTitle(${currentYear},${currentMonth});
	   	});

		//切换显示数据
	   	function changeData(){
	   		showData1($("#year").val(),$("#month").val());
	   		showData2($("#year").val());
	   		showData3($("#year").val(),$("#month").val());
	   		showData4($("#year").val(),$("#month").val());
	   		changeTitle($("#year").val(),$("#month").val());
		}

		function changeTitle(year,month){
			$("#t1").html(year+"年"+month+"月份每天费用支出走势图");
			$("#t2").html(year+"年每月费用支出走势图");
			$("#t3").html(year+"年"+month+"月份工人出勤次数与评优次数统计");
			$("#t4").html(year+"年"+month+"月份杂项支出分类汇总统计");
		}

		function exportBtnClick(){
			window.location.href="workCollect/analyse_export.shtml?year="+$("#year").val()+"&month="+$("#month").val()+"&time="+new Date().getTime();
		}
	</script>					    
	</body>
</html>
