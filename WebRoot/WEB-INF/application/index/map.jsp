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

    function showProvince() {
        var name ='henan';

        // myChart.showLoading();

        $.get('echarts/map/json/province/henan.json', function (geoJson) {
            // myChart.hideLoading();
            echarts.registerMap(name, geoJson);
			var option = {
                //backgroundColor: '#404a59',
                title: {
                    //text:'河南',
                    left: 'center',
                    textStyle: {
                        color: '#032E58'
                    }
                },
                layoutCenter: ['50%', '50%'],
               // 如果宽高比大于 1 则宽度为 100，如果小于 1 则高度为 100，保证了不超过 100x100 的区域
               layoutSize: 350,
                tooltip : {
			        trigger: 'item',
			        formatter: '{b}'
			    },
			    roam: true,//滚动
                series: [
                    {
                        type: 'map',
                        mapType: name,
                        label: {
                            emphasis: {
                                textStyle: {
                                    color: '#032E58'
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                        	 	borderColor: '#002443',
                             	areaColor: '#D3F7FD',
                                label:{show:true}
                            },
                            emphasis: {
                                areaColor: '#389BB7',
                                borderWidth: 0,
                                label:{show:true},
                                shadowColor: 'rgba(0, 0, 0, 0.5)',
                                shadowBlur: 10
                            }
                        },
                        data:[
							<c:forEach items="${list}" var="p" varStatus="i">
							 {
                                 name:'${p.mapName}', 
                             	  selected:true,
                             	  itemStyle: {
	                                  normal: {
	                                      borderColor: '#389BB7',
	                                      areaColor: '#fff',
	                                      label:{show:true}
	                                  },
	                                  emphasis: {
	                                      areaColor: '#ED050A',
	                                      borderWidth: 0,
	                                      label:{show:true},
	                                      shadowColor: 'rgba(0, 0, 0, 0.5)',
	                                      shadowBlur: 10
	                                  }
	                              }
							 <c:if test="${!i.last}">
							 	},
							</c:if>
							<c:if test="${i.last}">
								 }
							</c:if>
							</c:forEach>
                             
                          ],
                        animation: false
                        // animationDurationUpdate: 1000,
                        // animationEasingUpdate: 'quinticInOut'
                    }
                ]
            };

				
				myChart.on('click', function (params) {
				});


            myChart.setOption(option);
        });
    }


    showProvince();
    window.onresize = myChart.resize;

		
	</script> 
	
</html>
