<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("SERVER_STATUS_VALUE",Constant.SERVER_STATUS_VALUE);
request.setAttribute("SERVER_STATUS_TEXT",Constant.SERVER_STATUS_TEXT);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>服务器管理</title>
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
	</head>

	<body>
		<form action="<%=basePath%>${menu }/index.shtml" id="queryForm" name="queryForm" method="post">
			<input type="hidden" name="page" id="reqPage" value="${pageBean.page }">
			<input type="hidden" name="limit" id="limit" value="${pageBean.limit }">
			<input type="hidden" name="serverName" value="${server.serverName }">
			<input type="hidden" name="serverIp" value="${server.serverIp }">
			<input type="hidden" name="orgUuid" value="${server.orgUuid }">
			<input type="hidden" name="orgName"   value="${server.orgName }">
		</form>

	<div class="container-fluid" >
		<div class="panel panel-primary"  style="${!(empty server.serverName&&empty server.serverIp&&empty server.status)?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>${menu }/index.shtml" method="post">
			   	  <input type="hidden" name="orgUuid" id="search_orgUuid"  value="${server.orgUuid }">
			   	  <input type="hidden" name="orgName" id="search_orgName" value="${server.orgName }">
				  <div class="form-group">
				    <label for="id" style="display: inline;">服务器名称：</label>
				    <input type="text"  class="form-control"  name="serverName" value="${server.serverName }" placeholder="请输入要查询的服务器名称">
				  </div>
				   <div class="form-group">
				    <label for="id" style="display: inline;">服务器IP：</label>
				    <input type="text"  class="form-control"  name="serverIp" value="${server.serverIp }" placeholder="请输入要查询的服务器Ip">
				  </div>
			    <div class="form-group">
				    <label for="id" style="display: inline;">当前状态：</label>
				  	 <select class="form-control" id="status" name = "status" onchange="javascript:change();">
						<option value="" selected>请选择</option>
						<c:forEach items="${SERVER_STATUS_VALUE}" var="item">
							<option value=${item.key } ${server.status == item.key?'selected':'' }>${item.value }</option>
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
				<a href="javascript:add();" class="btn btn-primary">添加</a>
				<a href="javascript:updConfirmClick();" class="btn btn-primary">修改</a>
				<a href="javascript:showSearchPanel();" class="btn btn-primary" id="searchLink">查询</a>
				<a href="javascript:delConfirmClick();" class="btn btn-danger">删除</a>
			</div>
		</div>
	<div class="panel panel-primary" >
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		<span style="color:red;font-weight:bold">${server.orgName }</span> 服务器管理
 		    	<div class="close">
					<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新界面" onclick="javascript:refreshIconClick();"></span>
				</div>
		      </h3>
		   </div>
				<table class="table table-bordered table-hover">
				<thead>
				    <tr  onclick="javascript:clickBtn();">
				      <th width="50px">选择</th>
				      <th width="50px">序号</th>
				      <th>所属单位</th>
				      <th>名称</th>
				      <th>品牌</th>
				      <th>使用年限</th>
				      <th>操作系统</th>
				      <th>系统版本</th>
				      <th>服务器IP</th>
				      <th>当前状态</th>
				      <th width="100px">测试连接</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="server" varStatus="i">
							<tr >
								<td>
									<input type="radio" name="uuid" value="${server.uuid }"/>
								</td>
								<td>
									${(pageBean.page-1)*pageBean.limit+i.index+1 }
								</td>
								<td>
									<a href="javascript:updClick('${server.uuid }');">${server.orgName }</a>
								</td>
								<td >
									${server.serverName }
								</td>
								<td >
									${server.serverBrand }
								</td>
								<td >
									${server.useTime }
								</td>
								<td>
									${server.osName eq 1?'LINUX':'WINDOW' }
								</td>
								<td>
									${server.osVersion }
								</td>
								<td>
									${server.serverIp }
								</td>
								<td>
									${SERVER_STATUS_TEXT[server.status]}
								</td>
								<td>
								   <a href="javascript:testConnection('${server.uuid }','${server.serverName }','${server.serverIp }');">
							          <span class="glyphicon glyphicon-refresh"></span>
							        </a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pageBean.list}">
						<tr>
							<td colspan="11" style="text-align: center;">
								对不起，没有您要查找的数据
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
		</div>
		<br/>
		<c:if test="${!empty pageBean.list }">
			<jsp:include page="/common/page.jsp"></jsp:include>
		</c:if>
		
   




	
	
<!-- 修改设置 -->
<div class="modal fade" id="model_set" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">服务器管理</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal" role="form" id="addForm">
        		<input type="hidden" id="uuid" name="uuid"/>
        		<input type="hidden" name="orgUuid" id="orgUuid" value="${server.orgUuid }">
        		<input type="hidden" name="orgName" id="orgName" value="${server.orgName }">
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="serverName" name="serverName" placeholder="请输入服务器名称"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">品牌</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="serverBrand" name="serverBrand" placeholder="请输入服务器品牌"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">使用年限</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="useTime" name="useTime" placeholder="请输入使用年限"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">操作系统</label>
					<div class="col-sm-9">
						<select class="form-control" id="osName" name = "osName">
							<option value="" selected>请选择</option>
							<option value=1>LINUX</option>
							<option value=2>WINDOW</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">系统版本</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="osVersion" name="osVersion" placeholder="请输入操作系统版本"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">IP地址</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="serverIp" name="serverIp" placeholder="请输入服务器IP地址"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">登录名</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="loginName" name="loginName" placeholder="请输入系统登录名" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">登录密码</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="password" name="password" placeholder="请输入系统登录密码" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">排序号</label>
					<div class="col-sm-9">
						<input type="number" class="form-control" id="sequenceNo" name="sequenceNo" placeholder="请输入排序号" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">备注说明</label>
					<div class="col-sm-10">
						<textarea rows="3" cols="10" class="form-control" name="note" id="note" style="width:418px!important"></textarea>
					</div>
				</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save" >保存</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>


	
	<script type="text/javascript">

		function add(){
			$("#addForm").clear();
			var orgName = "${server.orgName}";
			if(orgName=="全部"){
				Ewin.alert({ message: "<span style='color:red;font-weight:bold;'>请先选择左侧单位信息后再进行添加操作</span>" });
				return;
			}else{
				$("#orgUuid").val("${server.orgUuid}");
				$("#orgName").val("${server.orgName}");
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
		            	serverName: {/*键名username和input name值对应*/
		                    message: '请输入服务器名称',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '服务器名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '服务器名称不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
		                },
		                serverBrand:{
		                	 message: '服务器品牌不能超过50个字',
		                	 validators: {
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '服务器品牌不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
			            },
			            useTime:{
		                	 message: '使用年限不能超过50个字',
		                	 validators: {
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '使用年限不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
			            },
			            osName: {/*键名username和input name值对应*/
		                    message: '请输入操作系统',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '操作系统不能为空'
		                        }
		                    }
		                },
		                osVersion:{
		                	 message: '系统版本不能超过50个字',
		                	 validators: {
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '系统版本不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
			            },
			            serverIp: {
		                    message:'请输入服务器IP地址',
		                    validators: {
		                        notEmpty: {
		                            message: '服务器IP地址不能为空'
		                        },
		                        threshold: 5,//只有4个字符以上才发送ajax请求
		                        remote:{
		                        	//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
		                            url:"${menu}/checkServerIp.shtml",
		                            delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                            type:'POST',
		                            data: function(validator) {
		                                return {
		                                    serverIp:$('#serverIp').val(),
		                                    orgUuid:$('#orgUuid').val(),
		                                    uuid:$('#uuid').val()
		                                };
		                            },
		                            message:'该服务器Ip地址以及存在！'
		                        }
		                    }
		                },
		                loginName: {
		                    message:'请输入服务器登录名',
		                    validators: {
		                        notEmpty: {
		                            message: '服务器登录名不能为空'
		                        }
		                    }
		                },
		                password:{
		                	message:'请输入服务器登录密码',
		                    validators: {
		                        notEmpty: {
		                            message: '服务器登录密码不能为空'
		                        }
		                    }/*最后一个没有逗号*/
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
			$("#search_orgUuid").attr("value","${server.orgUuid}");
			$("#search_orgName").attr("value","${server.orgName}");
			$("#searchForm").submit();
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
		//修改一条信息
		function updClick(uuid){
			$.ajax({
				url:"<%=basePath %>${menu }/findByPrimaryKey.shtml",
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
			window.location.href="<%=basePath %>${menu }/index.shtml?orgUuid=${server.orgUuid}&orgName=${server.orgName}";
		}

		//修改一条信息
		function testConnection(uuid,serverName,ip){
			
			$.ajax({
				url:"<%=basePath %>${menu }/testConnection.shtml",
				type:'POST',
				data:{"uuid":uuid,"serverIp":ip},
				dataType:'JSON',
				beforeSend:function(data){
					$("#load").modal({backdrop: 'static',keyboard: false});
				},
				success:function(json){
					$('#load').modal('hide');
					if(json.success){
						Ewin.alert({ message: "<span style='color:green;font-weight:bold;'>【"+serverName+"】连接正常</span>" }).on(function (e) {
						  refreshIconClick();
			     		});
					}else{	
						Ewin.alert({ message: "<span style='color:red;font-weight:bold;'>【"+serverName+"】连接失败,IP不通</span>" }).on(function (e) {
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
	</script>					    
	</body>
</html>
