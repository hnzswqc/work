<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("map",Constant.STATUSMAP);
request.setAttribute("map_value",Constant.STATUSMAP_VALUE);
request.setAttribute("TASK_TYPE_AUTO",Constant.TASK_TYPE_AUTO);
request.setAttribute("TASK_TYPE_HAND",Constant.TASK_TYPE_HAND);
request.setAttribute("TASK_FOREIGN_NAME_APP",Constant.TASK_FOREIGN_NAME_APP);
request.setAttribute("TASK_FOREIGN_NAME_SERVER",Constant.TASK_FOREIGN_NAME_SERVER);



%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>巡检结果</title>
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
			<input type="hidden" name="name"  value="${task.name }">
			<input type="hidden" name="status"  value="${task.status }">
			<input type="hidden" name="foreignName"  value="${task.foreignName }">
			<input type="hidden" name="type"  value="${task.type }">
			<input type="hidden" name="orgUuid"  value="${task.orgUuid }">
			<input type="hidden" name="timerUuid"  value="${task.timerUuid }">
			<input type="hidden" name="note"  value="${task.note }">
			
		</form>
	<div class="container-fluid" >
		<div class="panel panel-primary"  style="${!(empty task.name&&empty task.status&&empty task.type&&empty task.foreignName&&empty task.orgUuid)?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>${menu }/index.shtml" method="post">
			   	 <div class="form-group">
				    <label for="id" style="display: inline;">单位：</label>
				    <select class="form-control" id="foreignName" name = "orgUuid" onchange="javascript:change();">
				    	<option value="" selected>请选择</option>
				    	<c:forEach items="${list}" var="org">
				    		<option value="${org.uuid }" ${org.uuid eq task.orgUuid?'selected':'' }>${org.orgName }</option>
				    	</c:forEach>
						
					</select>
				  </div>
				  <div class="form-group">
				    <label for="id" style="display: inline;">名称：</label>
				    <input type="text"  class="form-control"  name="name" value="${task.name }" placeholder="请输入要查询的服务名称">
				  </div>
				   <div class="form-group">
				    <label for="id" style="display: inline;">类别：</label>
				  	 <select class="form-control" id="foreignName" name = "foreignName" onchange="javascript:change();">
						<option value="" selected>请选择</option>
							<option value='${TASK_FOREIGN_NAME_SERVER }' ${task.foreignName == TASK_FOREIGN_NAME_SERVER?'selected':'' }>服务器</option>
							<option value='${TASK_FOREIGN_NAME_APP }' ${task.foreignName == TASK_FOREIGN_NAME_APP?'selected':'' }>应用</option>
					</select>
				  </div>
				  <div class="form-group">
				    <label for="id" style="display: inline;">检测方式：</label>
				  	 <select class="form-control" id="type" name = "type" onchange="javascript:change();">
						<option value="" selected>请选择</option>
							<option value='${TASK_TYPE_AUTO }' ${task.type == TASK_TYPE_AUTO?'selected':'' }>自动</option>
							<option value='${TASK_TYPE_HAND }' ${task.type == TASK_TYPE_HAND?'selected':'' }>手动</option>
					</select>
				  </div>
				  <div class="form-group">
				    <label for="id" style="display: inline;">当前状态：</label>
				  	 <select class="form-control" id="status" name = "status" onchange="javascript:change();">
						<option value="" selected>请选择</option>
						<c:forEach items="${map_value}" var="item">
							<option value=${item.key } ${task.status == item.key?'selected':'' }>${item.value }</option>
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
			
				<a href="javascript:runTask();" class="btn btn-primary">开始巡检</a>
				<%--
				<a href="javascript:updConfirmClick();" class="btn btn-primary">修改</a>
				 --%> 
				<a href="javascript:showSearchPanel();" class="btn btn-primary" id="searchLink">查询</a>
				<a href="javascript:delConfirmClick();" class="btn btn-danger">删除</a>
				<c:if test="${!empty task.note}">
					<a href="javascript:post('<%=basePath %>timer/index.shtml',{'time':new Date().getTime()});" class="btn btn-danger">返回</a>
				</c:if>
			</div>
		</div>
	<div class="panel panel-primary" >
		   <div class="panel-heading">
		      <h3 class="panel-title">
		      	<c:if test="${!empty task.note}">${task.note }-</c:if>
		 		定时任务信息
 		    	<div class="close">
					<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新界面" onclick="javascript:refreshIconClick();"></span>
				</div>
		      </h3>
		   </div>
				<table class="table table-bordered table-hover">
				<thead>
				    <tr>
				      <th width="50px"><input type="checkbox" onclick="javascript:checkAll(this);" /></th>
				      <th width="50px">序号</th>
				      <th>单位</th>
				      <th>服务器IP</th>
				      <th width="100px">类别</th>
				      <th>名称</th>
				      <th width="100px">检测方式</th>
				      <th width="100px">状态</th>
				      <th width="100px">检测人员</th>
				      <th>检测时间</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="task" varStatus="i">
							<tr >
								<td>
									<input type="checkbox" name="uuid" value="${task.uuid }"/>
								</td>
								<td title="${(pageBean.page-1)*pageBean.limit+i.index+1 }">
									${(pageBean.page-1)*pageBean.limit+i.index+1 }
								</td>
								<td title="${task.orgName }">
									${task.orgName }
								</td>
								<td title="${task.serverIp }">
									${task.serverIp }
								</td>
								<c:if test="${task.foreignName eq TASK_FOREIGN_NAME_APP}">
									<td>
										<span style="color:#0824F0;font-weight: bold;">应用</span>
									</td>
									<td  title="${task.serverName }-${task.name }">
										${task.name }
									</td>
								</c:if>
								<c:if test="${!(task.foreignName eq TASK_FOREIGN_NAME_APP)}">
									<td>
										<span style="color:#059358;font-weight: bold;">服务器</span>
									</td>
									<td  title="${task.name }">
										${task.name }
									</td>
								</c:if>
								<td>
									${task.type eq TASK_TYPE_AUTO?'自动':'手动' }
								</td>
								<td>
									${map[task.status] }
								</td>
								<td>
									${empty task.userName?'————':task.userName }
								</td>
								<td title="${task.createTime }">
									${task.createTime }
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pageBean.list}">
						<tr>
							<td colspan="8" style="text-align: center;">
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
<div class="modal fade" id="model_set" tabindex="-2" z-index="10" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">单位管理</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal" role="form" id="addForm">
        		<input type="hidden" id="uuid" name="uuid"/>
        		<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">单位编码</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="orgCode" name="orgCode" placeholder="请输入单位编码"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">单位名称</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="orgName" name="orgName" placeholder="请输入单位姓名" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">地图名称</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="mapName" name="mapName" placeholder="请输入对应地图名称，一般为xx市" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">所属上级</label>
					<div class="col-sm-10">
						<div class="input-group">
							<input type="text" class="form-control" id="orgParentName" name="orgParentName" value="根节点" readonly="readonly"/>
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="javascript:choose();">
									选择
								</button>
							</span>
						</div>
					</div>
					<input type="hidden" class="form-control" id="orgParentUuid" name="orgParentUuid" value="<%=Constant.DEFAULT_ROOT_CODE %>"/>
				</div>
				
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">单位类别</label>
					<div class="col-sm-10">
						<select class="form-control" id="orgProp" name = "orgProp">
							<option value="" selected>请选择</option>
							<option value="X">处（科）室</option>
							<option value="H">单位</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">联系人</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="linkMan" name="linkMan" placeholder="请输入单位联系人" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">联系电话</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="linkMobile" name="linkMobile" placeholder="请输入联系人电话" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">排序号</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="sequenceNo" name="sequenceNo" placeholder="请输入排序号" />
					</div>
				</div>
				<!-- 
				<div class="form-group">
					 <label class="col-sm-12" style="color:red">表达式配置方法可以参考<a href="http://www.jeasyuicn.com/cron/" target="_blank">http://www.jeasyuicn.com/cron/</a></label>
				</div>
				 -->
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
			$("#model_set").modal({backdrop: 'static',keyboard: false});
			$("#orgCode").removeAttr("readonly");
			$("#orgParentName").attr("value","根目录");
			$("#orgParentUuid").attr("value","<%=Constant.DEFAULT_ROOT_CODE %>");
		}

		
		function choose(){
			$("#myModal").modal({backdrop: 'static',keyboard: false});
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
		                orgCode: {
		                    message:'请输入单位编码',
		                    validators: {
		                        notEmpty: {
		                            message: '单位编码不能为空'
		                        },
		                        regexp: {
			                         regexp: /[a-zA-Z0-9]/,
			                         message: '单位编码只能为字母和数字'
			                     },
			                     stringLength: {
		                            /*长度提示*/
		                            min: 3,
		                            max: 30,
		                            message: '单位编码长度必须在3到30之间'
		                        },
		                        threshold: 3,//只有4个字符以上才发送ajax请求
		                        remote:{
		                        	//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
		                            url:"${menu}/checkOrgCode.shtml",
		                            delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                            type:'POST',
		                            data: function(validator) {
		                                return {
		                                    orgCode:$('#orgCode').val(),
		                                    uuid:$('#uuid').val()
		                                };
		                            },
		                            message:'该单位编码已被使用，请修改!'
		                        }
		                    }
		                },
		                orgName: {/*键名username和input name值对应*/
		                    message: '请输入单位名称',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '单位名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '单位名称不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
		                },
		                mapName: {/*键名username和input name值对应*/
		                    message: '请输入地图名称',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '地图名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '地图名称不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
		                },
		                orgParentUuid: {/*键名username和input name值对应*/
		                    message: '请选择所属上级',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '所属上级不能为空'
		                        }
		                    }
		                },
		                orgProp: {/*键名username和input name值对应*/
		                    message: '请选择单位类别',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '单位类别不能为空'
		                        }
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
							    	$("#queryForm").submit();
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
			$("#searchForm").submit();
		}


		//修改一条信息
		function updConfirmClick(){
			var uuid = $('input[name="uuid"]:checked').val();
			if(uuid==""||uuid==undefined){
				Ewin.alert({ message: "请先选择一条数据！" });
				return;
			}
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
						$("#orgCode").attr("readonly","readonly");
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

			var uuid="";
			$("[name='uuid']:checked").each(function(){
				uuid+=$(this).val()+",";
			});
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
								$("#queryForm").submit();
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
			window.location.href="<%=basePath %>${menu }/index.shtml";
		}

		//
		function getDataC(id,name){
			if(id==$("#uuid").val()){
				Ewin.alert({ message: "不能选择当前节点作为父节点" });
				return;
			}
			$("#orgParentName").val(name);
			$("#orgParentUuid").val(id);
			$('#myModal').modal('hide');
		}

		//全选反选
		function checkAll(obj){
			$("input[name='uuid']").each(function(n){
				if(obj.checked){
					this.checked=true;
				}else{
					this.checked=false;
				}
			});
		}

		//手动巡检
		function runTask(){
			Ewin.confirm({message:"<em>确定要开始巡检吗？</em>"}).on(function(e){
				if(!e){
					return;
				}
				$.ajax({
					url:'<%=basePath%>${menu }/runTask.shtml',
					type:'POST',
					//data:{"uuid":uuid},
					dataType:'JSON',
					success:function(json){
						Ewin.alert({ message: "手动巡检任务已经开启<br/>请稍后在本界面查看巡检结果" }).on(function (e) {
							$("#queryForm").submit();
			     	  	});
					},
					error:function(e){
						Ewin.alert({ message: "操作出现异常！" });
					}
				});
			});
		}
	</script>					    
	</body>
</html>
