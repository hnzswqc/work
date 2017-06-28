<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("map",Constant.STATUSMAP);
request.setAttribute("map_value",Constant.STATUSMAP_VALUE);

%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>应用管理</title>
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
			vertical-align: middle;
		}
		table th{
			text-align: center;
			vertical-align: middle;
		}
		table tr td{
			text-align: center!important;
			vertical-align: middle;
		}
		
		
	</style>
		<%@ include file="/common/bootstrap.jsp"%>
	</head>

	<body>
		<form action="<%=basePath%>${menu }/index.shtml" id="queryForm" name="queryForm" method="post">
			<input type="hidden" name="page" id="reqPage" value="${pageBean.page }">
			<input type="hidden" name="limit" id="limit" value="${pageBean.limit }">
			<input type="hidden" name="serverUuid" value="${app.serverUuid }">
		   	<input type="hidden" name="serverName" value="${app.serverName }">
		    <input type="hidden" name="status"  value="${app.status }">
		    <input type="hidden" name="name" value="${app.name }" >
		    <input type="hidden" name="projectName" value="${app.projectName }" />
		    <input type="hidden" name="runStatus" value="${app.runStatus }" />
		    
		</form>

	<div class="container-fluid" >
		<div class="panel panel-primary"  style="${!(empty app.name&&empty app.projectName&&empty app.runStatus)?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>${menu }/index.shtml" method="post">
			   	  <input type="hidden" name="serverUuid" id="search_serverUuid"  value="${app.serverUuid }">
			   	  <input type="hidden" name="serverName" id="search_serverName" value="${app.serverName }">
			   	  <input type="hidden" name="status" id="search_status" value="${app.status }">
				  <div class="form-group">
				    <label for="id" style="display: inline;">应用名称：</label>
				    <input type="text"  class="form-control"  name="name" value="${app.name }" placeholder="请输入要查询的应用姓名">
				  </div>
				   <div class="form-group">
				    <label for="id" style="display: inline;">项目名称：</label>
				    <input type="text"  class="form-control"  name="projectName" value="${app.projectName }" placeholder="请输入要查询的项目名称">
				  </div>
				  <div class="form-group">
				    <label for="id" style="display: inline;">当前状态：</label>
				  	 <select class="form-control" id="runStatus" name = "runStatus" onchange="javascript:change();">
						<option value="" selected>请选择</option>
						<c:forEach items="${map_value}" var="item">
							<option value=${item.key } ${app.runStatus == item.key?'selected':'' }>${item.value }</option>
						</c:forEach>
					</select>
				  </div>
				  <button type="submit" class="btn btn-default">查询</button>
  				  <button type="button" class="btn btn-info" onclick="javascript:resetForm();">重置</button>
				</form>
		   </div>
		</div>
		
		<div class="panel panel-default" >
			<div class="panel-body" style="padding-left:0px!important;">
				<a href="javascript:exportAll();" class="btn btn-primary">导出</a>
				<a href="javascript:history.go(-1);" class="btn btn-danger">返回</a>
			</div>
		</div>
	<div class="panel panel-primary" >
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		<span style="color:red;font-weight:bold">应用管理
 		    	<div class="close">
					<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新界面" onclick="javascript:refreshIconClick();"></span>
				</div>
		      </h3>
		   </div>
				<table class="table table-bordered table-hover">
				<thead>
				    <tr>
				      <th width="50px">序号</th>
				      <th>所属单位</th>
				      <th>服务器</th>
				      <th>IP</th>
				      <th>操作系统</th>
				      <th>用户名</th>
				      <%--
				      <th>密码</th>
				       --%>
				      <th>应用名称</th>
				      <th>项目名称</th>
				      <th>端口号</th>
				       <%--
				      <th>部署路径</th>
				      <th>启动命令</th>
				      <th>关闭命令</th>
				       --%>
				      <th>部署版本</th>
				      <th>运行状态</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty orgList}">
						<c:forEach items="${orgList}" var="orgMap" varStatus="i">
							<c:set value="${orgMap.value}" var="org"></c:set>
							<tr>
								<td rowspan="${org.count}" style="vertical-align: middle;">
									${i.index+1 }
								</td>
								<td rowspan="${org.count}" style="vertical-align: middle;">
									${org.orgName }
								</td>
							
								<c:forEach items="${serverList[org.orgUuid]}" var="serverMap" varStatus="s">
								
										<c:set value="${serverMap.value}" var="server"></c:set>
											<c:set value="${fn:length(appList[server.serverUuid])}" var="serverCount"></c:set>
										
										<td rowspan="${serverCount}" style="vertical-align: middle;">
											${server.serverName }
										</td>
										<td rowspan="${serverCount}" style="vertical-align: middle;">
											${server.serverIp }
										</td>
										<td rowspan="${serverCount}" style="vertical-align: middle;">
											${server.osName }
										</td>
										<td rowspan="${serverCount}" style="vertical-align: middle;">
											${server.loginName }
										</td>
										<%--
										<td rowspan="${serverCount}" style="vertical-align: middle;">
											${server.password }
										</td>
										 --%>
											<c:forEach items="${appList[server.serverUuid]}" var="appMap" varStatus="a">
												<c:set value="${appMap.value}" var="app"></c:set>
												<td>
													<a href="javascript:updClick('${app.uuid }');">${app.name }</a>
												</td>
												<td>
													${app.projectName }
												</td>
												<td>
													${app.port }
												</td>
													<%--
												<td>
													${app.path }
												</td>
											
												<td >
													${app.start }
												</td>
												<td>
													${app.stop }
												</td>
												 --%>
												 <td>
													${app.version }
												</td>
												<td >
													${map[app.runStatus] }
												</td>
												<c:if test="${!a.last}">
													</tr><tr>
												</c:if>
												<c:if test="${a.last}">
													</tr>
												</c:if>
											</c:forEach>
									
												
								</c:forEach>
						</c:forEach>
					</c:if>
					<c:if test="${empty orgList}">
						<tr>
							<td colspan="14" style="text-align: center;">
								对不起，没有您要查找的数据
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
		</div>
		
   

<br/>
<br/><br/>
<br/><br/>
<br/>


	
	
<!-- 修改设置 -->
<div class="modal fade" id="model_set" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">应用信息</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal" role="form" id="addForm">
        		<input type="hidden" id="uuid" name="uuid"/>
        		<input type="hidden" name="status" id="status" value="${app.status }">
        		<input type="hidden" name="serverUuid" id="serverUuid" value="${app.serverUuid }">
        		<input type="hidden" name="serverName" id="serverName" value="${app.serverName}">
        		<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">所属单位</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="orgName" name="orgName" readonly="readonly"/>
					</div>
				</div>     
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">服务器</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="serverName" name="serverName" readonly="readonly"/>
					</div>
				</div>   
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">服务器IP</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="serverIp" name="serverIp" readonly="readonly"/>
					</div>
				</div>   
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">操作系统</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="osName" name="osName" readonly="readonly"/>
					</div>
				</div>   
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="loginName" name="loginName" readonly="readonly"/>
					</div>
				</div>   
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="password" name="password" readonly="readonly"/>
					</div>
				</div>      		
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">应用名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" name="name" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">项目名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="projectName" name="projectName" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">端口</label>
					<div class="col-sm-9">
						<input type="number" class="form-control" id="port" name="port" readonly="readonly"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">部署路径</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="path" name="path" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">启动命令</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="start" name="start" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">停止命令</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="stop" name="stop" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">部署版本</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="version" name="version" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">部署时间</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="deployTime" name="deployTime" readonly="readonly" />
					</div>
				</div>
				
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>


	
	<script type="text/javascript">

		function add(){
			$("#addForm").clear();
		
			
			var status = "${app.status}";
			if(status==1){
				Ewin.alert({ message: "<span style='color:red;font-weight:bold;'>请选择单位下的服务器信息后再进行添加操作！</span>" });
				return;
			}else{
				$("#status").val("${app.status}");
				$("#serverUuid").val("${app.serverUuid}");
				$("#serverName").val("${app.serverName}");
			}
			$("#model_set").modal({backdrop: 'static',keyboard: false});
		}


		$(document).ready(function() {
			 $('#model_set').on('hidden.bs.modal', function() {
		        $("#addForm").data('bootstrapValidator').destroy();
		        $('#addForm').data('bootstrapValidator', null);
		        validateForm();
		     });
			 validateForm();
			 $('#model_set').on('shown.bs.modal', function() {
				  //validateForm();
			 });

			 $("#save").click(function(){
				$("#addForm").submit();
			 });

		    
		});

		//表单验证
		function validateForm(){
			/**
		     * 下面是进行插件初始化
		     * 你只需传入相应的键值对
		     * */
		    $('#addForm').bootstrapValidator({
		            message: '未通过验证',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	name: {/*键名username和input name值对应*/
		                    message: '请输入应用名称',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '应用名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '应用名称不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
		                },
		                projectName:{/*键名username和input name值对应*/
		                    message: '请输入项目名称',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '项目名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '项目名称不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
		                },
		                port: {
			                 message: '端口号不能为空',
			                 validators: {
			                     notEmpty: {
			                         message: '端口号不能为空'
			                     },
			                     stringLength: {
			                         min: 1,
			                         max: 5,
			                         message: '请输入1-5位端口号'
			                     },
			                     regexp: {
			                         regexp: /[0-9]/,
			                         message: '请输入正确的端口号'
			                     }
			                 }
			             },
			            type: {/*键名username和input name值对应*/
		                    message: '请选择检测方式',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '检测方式不能为空'
		                        }
		                    }
		                },
		                path:{
		                	 message: '部署路径不能为空',
		                	 validators: {
	                	 		notEmpty: {/*非空提示*/
		                            message: '部署路径不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 200,
		                            message: '部署路径不能超过200个字符'
		                        }/*最后一个没有逗号*/
		                    }
			            },
			            start:{
		                	 message: '服务启动命令不能我空',
		                	 validators: {
	                	 		notEmpty: {/*非空提示*/
		                            message: '服务启动命令不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 200,
		                            message: '服务启动命令不能超过200个字符'
		                        }/*最后一个没有逗号*/
		                    }
			            },
			            stop:{
		                	 message: '服务停止命令不能我空',
		                	 validators: {
	                	 		notEmpty: {/*非空提示*/
		                            message: '服务停止命令不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 200,
		                            message: '服务停止命令不能超过200个字符'
		                        }/*最后一个没有逗号*/
		                    }
			            },
	           			 sequenceNo: {
			                 message: '排序号不能为空',
			                 validators: {
			                     notEmpty: {
			                         message: '排序号不能为空'
			                     },
			                     stringLength: {
			                         min: 1,
			                         max: 5,
			                         message: '请输入1-5位排序号'
			                     },
			                     regexp: {
			                         regexp: /[0-9]/,
			                         message: '请输入正确的排序号'
			                     }
			                 }
			             }
		            }
		        }).on('success.form.bv', function(e) {
		            // Prevent form submission
		            e.preventDefault();
		            // Get the form instance
		            var $form = $(e.target);
		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');
					
		            $.ajax({
						url:"<%=basePath %>${menu }/modify.shtml",
						type:'POST',
						data:$form.serialize(),
						dataType:'JSON',
						beforeSend:function(data){
							$("#save").attr("disabled","disabled");
						},
						success:function(json){
							if(json.success){
								$('#model_set').modal('hide');
							    Ewin.alert({ message: "操作成功！" }).on(function (e) {
							    	$("#searchForm").submit();
					     		});
							}else{
								Ewin.alert({ message: json.msg==null?"操作失败！":"<em>"+json.msg+"</em>" });
							}
							$("#save").removeAttr("disabled");
						},
						error:function(e){
							Ewin.alert({ message: "网络出现异常！" });
							$("#save").removeAttr("disabled");
						}
					});
		        });
			
		}

		//显示隐藏查询条件
		function showSearchPanel(){
			if($("#searchPanel").is(":hidden")){
				$("#searchPanel").show();
				$("#searchLink").text("隐藏");
			}else{
				$("#searchPanel").hide();
				$("#searchLink").text("查询");
			}
		}
		//下拉框检索
		function change(){
			$("#searchForm").submit();
		}

		//重置
		function resetForm(){
			$("#searchForm").clear();
			$("#search_status").attr("value","${app.status}");
			$("#search_serverUuid").attr("value","${app.serverUuid}");
			$("#search_serverName").attr("value","${app.serverName}");
			$("#searchForm").submit();
		}


		//点击应以名称修改
		function updClick(uuid){
			$.ajax({
				url:"<%=basePath %>${menu }/findByUuid.shtml",
				type:'POST',
				data:{"uuid":uuid},
				dataType:'JSON',
				success:function(json){
					if(json.success){
						$("#addForm").clear();
						$("#addForm").setForm(json.data);
						$("#model_set").modal({backdrop: 'static',keyboard: false});
					}else{
						Ewin.alert({ message: "获取信息失败！" });
					}
				},
				error:function(e){
					Ewin.alert({ message: "网络出现异常！" });
				}
			});
		}

		//修改一条信息
		function updConfirmClick(){
			var uuid = $('input[name="uuid"]:checked').val();
			if(uuid==""||uuid==undefined){
				Ewin.alert({ message: "请先选择一条数据！" });
				return;
			}
			updClick(uuid);
			
		}

		//删除一条记录
		function delConfirmClick(){
			var uuid = $('input[name="uuid"]:checked').val();
			if(uuid==""||uuid==undefined){
				Ewin.alert({ message: "请先选择一条数据！" });
				return;
			}
			
			Ewin.confirm({message:"<em>确定要删除吗？</em>"}).on(function(e){
				if(!e){
					return;
				}
				$.ajax({
					url:'<%=basePath%>${menu }/delete.shtml',
					type:'POST',
					data:{"uuid":uuid},
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: "删除成功！" }).on(function (e) {
								$("#searchForm").submit();
				     	  });
						}else{
							Ewin.alert({ message: "<em>"+json.msg+"</em>" });
						}
					},
					error:function(e){
						Ewin.alert({ message: "操作出现异常！" });
					}
				});
			});
		}

		//刷新按钮
		function refreshIconClick(){
			window.location.href="<%=basePath %>${menu }/findAllApp.shtml?time="+new Date().getTime();
		}

		//修改一条信息
		function testConnection(uuid,name){
			$.ajax({
				url:"<%=basePath %>${menu }/testConnection.shtml",
				type:'POST',
				data:{"uuid":uuid},
				dataType:'JSON',
				beforeSend:function(data){
					$("#load").modal({backdrop: 'static',keyboard: false});
				},
				success:function(json){
					$('#load').modal('hide');
					if(json.success){
						 Ewin.alert({ message: "<span style='color:green;font-weight:bold;'>【"+name+"】服务正常</span>" }).on(function (e) {
						   refreshIconClick();
			     		 });
				     		
					}else{
						Ewin.alert({ message: "<span style='color:red;font-weight:bold;'>【"+name+"】服务异常</span>" }).on(function (e) {
						   refreshIconClick();
			     		});
					}
				},
				error:function(e){
					$('#load').modal('hide');
					Ewin.alert({ message: "<span style='color:red;font-weight:bold;'>网络出现异常！</span>" });
				}
			});
		}

		//修改一条信息
		function serverCommon(uuid,type){
			var msg = "启动";
			if(type!=1){
				msg = "停止";
			}
			$.ajax({
				url:"<%=basePath %>${menu }/serverCommon.shtml",
				type:'POST',
				data:{"uuid":uuid,"type":type},
				dataType:'JSON',
				beforeSend:function(data){
					$("#load").modal({backdrop: 'static',keyboard: false});
				},
				success:function(json){
					$('#load').modal('hide');
					if(json.success){
						  Ewin.alert({ message: "<span style='color:green;font-weight:bold;'>已向后台服务发出"+msg+"请求！<br/>请刷新查看当前状态</span>" }).on(function (e) {
							  refreshIconClick();
				     		});
					}else{
						Ewin.alert({ message: "<span style='color:red;font-weight:bold;'>向后台服务发出"+msg+"请求异常</span>" });
					}
				},
				error:function(e){
					$('#load').modal('hide');
					Ewin.alert({ message: "<span style='color:red;font-weight:bold;'>网络出现异常！</span>" });
				}
			});
		}

		//导出
		function exportAll(){
			window.location.href="<%=basePath %>${menu }/findAllApp.shtml?export=export&time="+new Date().getTime();
		}
		
	</script>					    
	</body>
</html>
