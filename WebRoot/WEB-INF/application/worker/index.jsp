<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>工人管理</title>
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
			<input type="hidden" name="ruleTitle" value="${rule.ruleTitle }">
		</form>
	<div class="container-fluid" >
		<div class="panel panel-primary"  style="${!(empty worker.name&&empty worker.gender&&empty worker.status)?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>${menu }/index.shtml" method="post">
				  <div class="form-group">
				    <label for="name" style="display: inline;">姓名：</label>
				    <input type="text"  class="form-control"  name="name" value="${worker.name }" placeholder="请输入要查询的单位名称">
				  </div>
				  <div class="form-group">
						<label for="gender" style="display: inline;">性别：</label>
						<select class="form-control" id="gender" name = "gender" onchange="javascript:change();">
							<option value="" selected>请选择</option>
							<option value=1 ${worker.gender == 1 ?'selected':'' }>男</option>
							<option value=2 ${worker.gender == 2 ?'selected':'' }>女</option>
						</select>
				</div>
				<div class="form-group">
					<label for="gender" style="display: inline;">状态：</label>
					<select class="form-control" id="status" name = "status" onchange="javascript:change();">
						<option value="" selected>请选择</option>
						<option value=1 ${worker.status == 1 ?'selected':'' }>使用中</option>
						<option value=2 ${worker.status == 2 ?'selected':'' }>已停用</option>
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
		 		工人管理
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
				      <th>姓名</th>
				      <th>性别</th>
				      <th>出生日期</th>
				      <th>年龄</th>
				      <th>联系电话</th>
				      <th>联系地址</th>
				      <th>所属工种</th>
				      <th>工人状态</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="worker" varStatus="i">
							<tr >
								<td>
									<input type="radio" name="uuid" value="${worker.uuid }"/>
								</td>
								<td>
									${(pageBean.page-1)*pageBean.limit+i.index+1 }
								</td>
								<td>
									<a href="javascript:show('${worker.uuid }');">${worker.name }</a>
								</td>
								<td>
									${worker.gender ==1?'男':'女'}
								</td>
								<td >
									${worker.birthday }
								</td>
								<td>
									${worker.age }
								</td>
								<td>
									${worker.mobile }
								</td>
								<td>
									${worker.addRess }
								</td>
								<td >
									${worker.workTypeName}
								</td>
								<td >
									${worker.status == 1 ?'使用中':'<span style=\'color:red\'>已停用</span>'}
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pageBean.list}">
						<tr>
							<td colspan="10" style="text-align: center;">
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
        <h4 class="modal-title" id="exampleModalLabel">工人管理</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal" role="form" id="addForm">
        		<input type="hidden" id="uuid" name="uuid"/>
        		<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<select class="form-control" id="gender" name = "gender">
							<option value="" selected>请选择</option>
							<option value=1 >男</option>
							<option value=2 >女</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">所属工种</label>
					<div class="col-sm-10">
						<select class="form-control" id="workType" name = "workType">
							<option value="" selected>请选择</option>
							<c:forEach items="${list}" var="wt">
								<option value="${wt.code }">${wt.text }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">工资</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="wages" name="wages" placeholder="按天计算工资" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">工人状态</label>
					<div class="col-sm-10">
						<select class="form-control" id="status" name = "status">
							<option value=1 selected>使用中</option>
							<option value=2 >已停用</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">出生日期</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="birthday" name="birthday" placeholder="请输入出生日期" onfocus="WdatePicker()"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">联系电话</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="mobile" name="mobile" placeholder="请输入联系人电话" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">联系地址</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="addRess" name="addRess" placeholder="请输入联系人地址" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">排序号</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="sequenceNo" name="sequenceNo" placeholder="请输入排序号" />
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">备注说明</label>
					<div class="col-sm-10">
						<textarea rows="3" cols="50" class="form-control" id="note" name="note"></textarea>
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
		                name: {
		                    message:'请输入姓名',
		                    validators: {
		                        notEmpty: {
		                            message: '姓名不能为空'
		                        },
			                     stringLength: {
		                            /*长度提示*/
		                            min: 2,
		                            max: 10,
		                            message: '姓名长度必须在2到10之间'
		                        }
		                        
		                    }
		                },
		                gender: {/*键名username和input name值对应*/
		                    message: '请选择性别',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '性别不能为空'
		                        }
		                    }
		                },
		                workType: {/*键名username和input name值对应*/
		                    message: '请选择工种',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '工种不能为空'
		                        }
		                    }
		                },
		                wages: {/*键名username和input name值对应*/
		                    message: '请输入工人工资',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '工资不能为空'
		                        }
		                    }
		                },
		                status: {/*键名username和input name值对应*/
		                    message: '请输入工人状态',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '工人状态不能为空'
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
			$("#searchForm").submit();
		}


		//修改一条信息
		function updConfirmClick(){
			var uuid = $('input[name="uuid"]:checked').val();
			if(uuid==""||uuid==undefined){
				Ewin.alert({ message: "请先选择一条数据！" });
				return;
			}
			show(uuid);
		}

		//显示详细信息
		function show(uuid){
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
	</script>					    
	</body>
</html>
