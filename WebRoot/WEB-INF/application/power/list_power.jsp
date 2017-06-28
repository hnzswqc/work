<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("POWER_STATUS_DISABLE",Constant.POWER_STATUS_DISABLE);
request.setAttribute("POWER_STATUS_ENABLE",Constant.POWER_STATUS_ENABLE);
request.setAttribute("POWER_LOOP_ONCE",Constant.POWER_LOOP_ONCE);
request.setAttribute("POWER_LOOP_EVER",Constant.POWER_LOOP_EVER);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>功能模块管理</title>
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
		
		.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-handle-off, 
		.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-handle-on, 
		.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-label{
			clear: both;
			padding:5px 5px !important;
		    font-size: 12px!important;
		    line-height: 1.5!important;
		}
		
	</style>
		<%@ include file="/common/bootstrap.jsp"%>
	</head>

	<body>
		<form action="<%=basePath%>power/index.shtml" id="queryForm" name="queryForm" method="post">
			<input type="hidden" name="page" id="reqPage" value="${pageBean.page }">
			<input type="hidden" name="limit" id="limit" value="${pageBean.limit }">
			<input type="hidden" name="powerName" value="${power.powerName }">
			<input type="hidden" name="powerStatus" value="${power.powerStatus }">
			<input type="hidden" name="modelUuid" value="${power.modelUuid }">
		</form>
	<!-- header start -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- header end -->
	
	<div class="container-fluid" >
		<div class="panel panel-primary"  style="${(empty power.powerName&&empty power.powerStatus&&empty power.modelUuid)?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>power/index.shtml" method="post">
				  <div class="form-group">
				    <label for="id" style="display: inline;">功能标题：</label>
				    <input type="text"  class="form-control" id="powerName" name="powerName" value="${power.powerName }" placeholder="请输入要查询的功能标题">
				  </div>
				  
				   <div class="form-group">
				    <label for="name" style="display: inline;">所属模块：</label>
			  		<select class="form-control" name="modelUuid" id="modelUuid" onchange="javascript:change();">
			  			<option value="" selected>请选择</option>
					   <c:forEach items="${modelList}" var="model">
					   	 <option value="${model.uuid }" ${power.modelUuid eq model.uuid?'selected':'' }>${model.modelName }</option>
					   </c:forEach>
				    </select>
				  </div>
				  
				  <div class="form-group">
				    <label for="name" style="display: inline;">启用状态：</label>
			  		 <select class="form-control" name="powerStatus" id="powerStatus" onchange="javascript:change();">
					   <option value="">请选择</option>
				       <option value="${POWER_STATUS_ENABLE }" ${power.powerStatus eq POWER_STATUS_ENABLE?'selected':'' }>开启</option>
				       <option value="${POWER_STATUS_DISABLE }" ${power.powerStatus eq POWER_STATUS_DISABLE?'selected':'' }>关闭</option>
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
				<a href="javascript:updConfirmClick();" class="btn btn-primary" id="updBtn">修改</a>
				<a href="javascript:showSearchPanel();" class="btn btn-primary" id="searchLink">查询</a>
				<a href="javascript:openTimerClick();" class="btn btn-primary" id="openTimer" >开启</a>
				<%--
				<a href="javascript:resetTimerClick();" class="btn btn-danger" id="openTimer" >重启</a>
				 --%>
				<a href="javascript:modifyTimerClick(${POWER_STATUS_ENABLE });" class="btn btn-danger" id="openTimer" >全部开启</a>
				<a href="javascript:modifyTimerClick(${POWER_STATUS_DISABLE });" class="btn btn-danger" id="openTimer" >全部关闭</a>
				<a href="javascript:delConfirmClick();" class="btn btn-danger" id="delBtn">删除</a>
				<%--
				<a href="javascript:showSendMsg();" class="btn btn-warning">短信记录</a>
				 --%>
			</div>
		</div>
	<div class="panel panel-primary" >
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		功能模块管理
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
				      <th >功能标识</th>
				      <th >功能标题</th>
				      <th >所属模块</th>
				      <th >定时规则</th>
				      <th >执行类名</th>
				      <th >提醒规则</th>
				      <th >是否启用</th>
				      <th>预警内容</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="power" varStatus="i">
							<tr >
								<td style="text-align: center;">
									<input type="radio" name="uuid" value="${power.uuid }" onclick="javascript:converBtnType(${power.powerStatus});"/>
								</td>
								<td style="text-align: center;">
									${(pageBean.page-1)*pageBean.limit+i.index+1 }
								</td>
								<td title="${power.powerKey }">
									${power.powerKey }
								</td>
								<td title="${power.powerName }">
									${power.powerName }
								</td>
								<td title="${power.modelName }">
									${power.modelName }
								</td>
								<td title="${power.ruleTitle }">
									${power.ruleTitle }
								</td>
								<td title="${power.powerClass }">
									${power.powerClass }
								</td>
								<td>
									${power.powerLoop eq POWER_LOOP_ONCE?"<span style='color:red'>提醒一次</span>":'重复提醒' }
								</td>
								<td>
									${power.powerStatus eq POWER_STATUS_ENABLE?"<span style='color:blue'>开启</span>":"<span style='color:red'>关闭</span>" }
								</td>
								<td title="${power.powerDescription }">
									${power.powerDescription }
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
		<div>
			<em>注意：删除或修改前请先关闭该功能定时任务！否则不允许删除或修改！</em>
		</div>
		<c:if test="${!empty pageBean.list }">
			<jsp:include page="/common/page.jsp"></jsp:include>
		</c:if>
		
		
   
	
	
<!-- 修改设置 -->
<div class="modal fade" id="model_set" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">功能模块</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal" role="form" id="addForm">
        		<input type="hidden" id="uuid" name="uuid"/>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">功能标识</label>
					<div class="col-sm-10">
							<input type="text" class="form-control" id="powerKey" name="powerKey" placeholder="请输入功能标识，唯一且不能重复。一般为视图名称"  onblur="javascript:validateExists(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">功能标题</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="powerName" name="powerName" placeholder="请输入功能标题"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">所属模块</label>
					<div class="col-sm-10">
						<!-- 
						<input type="text" class="form-control" id="modelName" name="modelName" placeholder="请选择所属模块"/>
						 -->
						<select class="form-control" name="modelUuid" id="modelUuid">
						   <c:forEach items="${modelList}" var="model">
						   	<option value="${model.uuid }" ${power.modelUuid eq model.uuid?'selected':'' }>${model.modelName }</option>
						   </c:forEach>
					    </select>
				    </div>
				</div>
				<div class="form-group">
					 <label for="modelSequence" class="col-sm-2 control-label">定时规则</label>
					<div class="col-sm-10">
						<!--  
						<input type="text" class="form-control" id="powerCronExpression" name="powerCronExpression" placeholder="请选择表达式"/>
						-->
						<select class="form-control" name="powerCronExpression" id="powerCronExpression">
						   <c:forEach items="${ruleList}" var="rule">
						   	<option value="${rule.uuid }" ${power.powerCronExpression eq rule.uuid?'selected':'' }>${rule.ruleTitle }</option>
						   </c:forEach>
					    </select>
					    
					</div>
				</div>
				<div class="form-group">
					 <label for="modelSequence" class="col-sm-2 control-label">执行类名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="powerClass" name="powerClass" placeholder="com.hnzskj.quartz.util.DefaultJob" />
					</div>
				</div>
				<!-- 状态 -->
				<input type="hidden" name="powerStatus" id="setPowerStatus" value="${POWER_STATUS_ENABLE }"/>
				<%--
				<div class="form-group">
					 <label for="modelSequence" class="col-sm-2 control-label">启用状态</label>
					<div class="col-sm-10" style="height: 30px;">
						<input id="switch" type="checkbox" checked  data-handle-width="40" data-size="mini" />
						<input type="hidden" name="powerStatus" id="setPowerStatus" value="${POWER_STATUS_ENABLE }"/>
					</div>
				</div>
				 --%>
				<div class="form-group">
					 <label for="modelSequence" class="col-sm-2 control-label">提醒规则</label>
					<div class="col-sm-10">
						<select class="form-control" name="powerLoop" id="powerLoop">
						   	<option value="${POWER_LOOP_ONCE}" ${power.powerLoop eq POWER_LOOP_ONCE?'selected':'' }>提醒一次</option>
						   	<option value="${POWER_LOOP_EVER }" ${power.powerLoop eq POWER_LOOP_EVER?'selected':'' }>重复提醒</option>
					    </select>
					</div>
				</div>
				<div class="form-group">
					 <label for="modelSequence" class="col-sm-2 control-label">排列序号</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="powerSequence" name="powerSequence" placeholder="1" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="4"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="modelSequence" class="col-sm-2 control-label">预警内容</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="3" name="powerDescription" id="powerDescription" placeholder="例：您好！在审计成果跟踪子系统中，您有#count#条信息需要处理，请登录OA管理系统进行处理！"></textarea>
					</div>
				</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save">保存</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>


	
	<script type="text/javascript">
    
		function add(){
			$("#addForm").clear();
			$("#model_set").modal({backdrop: 'static',keyboard: false});
			$("#powerKey").removeAttr("readonly");
		}


		//页面加载要做的事情
		$(document).ready(function() {
			 $('#model_set').on('hidden.bs.modal', function() {
		        $("#addForm").data('bootstrapValidator').destroy();
		        $('#addForm').data('bootstrapValidator', null);
		        validateForm();
		    });
			 validateForm();
			 $('#model_set').on('shown.bs.modal', function() {
				 // validateForm();//写在这里，容易发生二次提交的问题，所以移到上边！
			  });
			
			$("#save").click(function(){
				//开启验证
				$("#addForm").submit();
			});

	    	showSearchPanel();
		});

		//验证表单
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
		            	powerKey: {/*键名username和input name值对应*/
	                    message: '请输入功能标识',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '功能标识不能为空'
	                        },
	                        regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
	                            regexp: /^[a-zA-Z0-9_]+$/,
	                            message: '功能标识只能是数字和字母和下划线(_)且唯一。'
	                        },
	                        stringLength: {/*长度提示*/
	                            min: 1,
	                            max: 30,
	                            message: '功能标识不能超过30个字'
	                        }/*最后一个没有逗号*/
	                    }
	                },
	                powerName: {/*键名username和input name值对应*/
	                    message: '请输入功能标题',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '功能标题不能为空'
	                        },
	                        stringLength: {/*长度提示*/
	                            min: 1,
	                            max: 50,
	                            message: '功能标识不能超过50个字'
	                        }/*最后一个没有逗号*/
	                    }
	                },
	                modelUuid: {/*键名username和input name值对应*/
	                    message: '请选择所属模块',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '所属模块不能为空'
	                        }
	                    }
	                },
	                powerCronExpression: {/*键名username和input name值对应*/
	                	 message: '请选择定时表达式',
	                     validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '所属模块不能为空'
	                        }
	                    }
	                },
	                powerClass:{
	                	 message: '请输入执行类名',
	                     validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '执行类名不能为空'
	                        }
	                    }
		            },
		            powerLoop:{
		            	message: '请选择提醒规则',
	                     validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '提醒规则不能为空'
	                        }
	                    }  
			        },
		            powerSequence:{
		            	 message: '请输入排序号',
	                     validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '排序号不能为空'
	                        }
	                    }
			        },
			        powerDescription:{
		            	 message: '请输入预警内容',
	                     validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '预警内容不能为空'
	                        }
	                    }
			        }
	            }
		        }).on('success.form.bv', function(e) {
		            // Prevent form submission
		            e.preventDefault();  e.preventDefault();
		            // Get the form instance
		            var $form = $(e.target);
		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');
		            $.ajax({
						url:"<%=basePath %>power/modify.shtml",
						type:'POST',
						data:$form.serialize(),
						dataType:'JSON',
						success:function(json){
							if(json.success){
								$('#model_set').modal('hide');
							    Ewin.alert({ message: "操作成功！" }).on(function (e) {
							    	$("#searchForm").submit();
					     		});
							}else{
								Ewin.alert({ message: json.msg==null?"操作失败！":"<em>"+json.msg+"</em>" });
							}
						},
						error:function(e){
							Ewin.alert({ message: "网络出现异常！" });
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
				url:"<%=basePath %>power/findByPrimaryKey.shtml",
				type:'POST',
				data:{"uuid":uuid},
				dataType:'JSON',
				success:function(json){
					if(json.success){
						$("#addForm").clear();
						$("#addForm").setForm(json.data);
						$("#model_set").modal({backdrop: 'static',keyboard: false});
						<%--
						if(json.data.powerStatus==${POWER_STATUS_ENABLE}){
					        $("#switch").bootstrapSwitch("state", ":checked"); 
						}else{
					        $("#switch").bootstrapSwitch("state", ""); 
						}
						--%>
						$("#powerKey").attr("readonly","readonly");
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
					url:'<%=basePath%>power/delete.shtml',
					type:'POST',
					data:{"uuid":uuid},
					dataType:'JSON',
					success:function(json){
							if(json.success){
								Ewin.alert({ message: "删除成功！" }).on(function (e) {
									$("#searchForm").submit();
					     	  });
							}else{
								Ewin.alert({ message: "删除失败" });
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
			window.location.href="<%=basePath %>power/index.shtml";
		}

		//更换按钮状态
		function converBtnType(powerStatus){
			if(powerStatus==${POWER_STATUS_ENABLE}){
				$("#openTimer").html("关闭");
				$("#openTimer").removeClass("btn-primary");
				$("#openTimer").addClass("btn-warning");
				$("#delBtn").addClass('disabled'); // Disables visually
				$("#delBtn").prop('disabled', true); // Disables visually + functionally
				$("#updBtn").addClass('disabled'); // Disables visually
				$("#updBtn").prop('disabled', true); // Disables visually + functionally
			}else{
				$("#openTimer").html("开启");
				$("#openTimer").removeClass("btn-warning");
				$("#openTimer").addClass("btn-primary");
				$("#delBtn").removeClass('disabled'); // Disables visually
				$("#delBtn").prop('disabled', false); // Disables visually + functionally
				$("#updBtn").removeClass('disabled'); // Disables visually
				$("#updBtn").prop('disabled', false); // Disables visually + functionally
			}
		}


		//全部关闭或开启
		function modifyTimerClick(status){
			var msg="";
			if(status == ${POWER_STATUS_DISABLE}){
				msg = "全部关闭";
			}else{
				msg = "全部开启";
			}
			Ewin.confirm({message:"确定要<em>"+msg+"</em>吗？"}).on(function(e){
				if(!e){
					return;
				}
				$.ajax({
					url:'<%=basePath%>power/updateAllStatus.shtml?status='+status,
					type:'POST',
					data:$("#searchForm").serialize(),
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: msg+"成功!" }).on(function (e) {
								$("#searchForm").submit();
				     	  });
						}else{
							Ewin.alert({ message:"操作失败，状态关闭!\n\r"+json.msg });
						}
					},
					error:function(e){
						Ewin.alert({ message: "操作出现异常！" });
					}
				});
				
				
			});
		}

		
		//开启，关闭
		function openTimerClick(){
			var uuid = $('input[name="uuid"]:checked').val();
			if(uuid==""||uuid==undefined){
				Ewin.alert({ message: "请先选择一条数据！" });
				return;
			}
			var status = ${POWER_STATUS_ENABLE};
			var msg = $("#openTimer").html();
			if(msg=="开启"){
				status = ${POWER_STATUS_ENABLE};
			}else{
				status = ${POWER_STATUS_DISABLE};
			}

			Ewin.confirm({message:"确定要<em>"+msg+"</em>吗？"}).on(function(e){
				if(!e){
					return;
				}
				$.ajax({
					url:'<%=basePath%>power/updateStatus.shtml',
					type:'POST',
					data:{"uuid":uuid,"powerStatus":status},
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: msg+"成功!" }).on(function (e) {
								$("#searchForm").submit();
				     	  });
						}else{
							Ewin.alert({ message:"操作失败，状态关闭!\n"+json.msg });
						}
					},
					error:function(e){
						Ewin.alert({ message: "操作出现异常！" });
					}
				});
			});
		}
		<%--
		//重启，先关闭在开启
		function resetTimerClick(){
			var uuid = $('input[name="uuid"]:checked').val();
			if(uuid==""||uuid==undefined){
				Ewin.alert({ message: "请先选择一条数据！" });
				return;
			}
			Ewin.confirm({message:"确定要<em>重启</em>吗？"}).on(function(e){
				if(!e){
					return;
				}
				$.ajax({
					url:'<%=basePath%>power/resetStatus.shtml',
					type:'POST',
					data:{"uuid":uuid,"powerStatus":${POWER_STATUS_ENABLE}},
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: "重启成功!" }).on(function (e) {
								$("#searchForm").submit();
				     	  });
						}else{
							Ewin.alert({ message:"操作失败，状态关闭!\n"+json.msg });
						}
					},
					error:function(e){
						Ewin.alert({ message: "操作出现异常！" });
					}
				});
			});
			
		}

		--%>
		//验证当前功能标志是否存在
		function validateExists(obj){
			if(obj.value==""){
				return;
			}
			var uuid = $("#uuid").val();
			if(uuid!=""){
				return;
			}
			$.ajax({
				url:'<%=basePath%>power/validateExists.shtml',
				type:'POST',
				data:{"powerKey":obj.value},
				dataType:'JSON',
				success:function(json){
					if(json.success){
						Ewin.alert({ message: "已经存在标识为[<em>"+obj.value+"</em>]的信息" }).on(function (e) {
					    	obj.value="";
			     	  });
					}
				},
				error:function(e){
					Ewin.alert({ message: "操作出现异常！" });
				}
			});
		}

		//查看短信记录
		function showSendMsg(){
			Ewin.dialog({
				message:"添加信息",
				width:1800,
				url:"<%=basePath%>power/index.shtml?header_hidden=true&result=login&LTPAToken=dGVzdCoxMTdjMTE3Yy0xMjQzMzEzZjI2Ny04ZWFiMWY0NWRkYzY2NDc1YjNiM2RmMDFkNTM1NjlmYioyNDYqRXhjZW50ZXJIQTAwMDEqNzZlMjc2ZTItMTI0MzJkZWQ5NTMtMGU1MGUxNDFkNDZkOWVkYzU1Y2YyYTQxMmI1ZTBjM2Y=&maxInerval=1800"
			});
		}
		
	</script>					    
	</body>
</html>
