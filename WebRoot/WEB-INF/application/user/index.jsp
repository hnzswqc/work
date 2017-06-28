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

		<title><%=Constant.config_title %>>>用户管理</title>
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
		<div class="panel panel-primary"  style="${!empty user.userName?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>${menu }/index.shtml" method="post">
				  <div class="form-group">
				    <label for="id" style="display: inline;">用户名称：</label>
				    <input type="text"  class="form-control"  name="userName" value="${user.userName }" placeholder="请输入要查询的用户姓名">
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
		 		 用户管理
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
				      <th>用户姓名</th>
				      <th>用户登录名</th>
				      <th>用户性别</th>
				      <th>手机号码</th>
				      <th>邮箱信息</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="user" varStatus="i">
							<tr >
								<td>
									<input type="radio" name="uuid" value="${user.uuid }"/>
								</td>
								<td>
									${(pageBean.page-1)*pageBean.limit+i.index+1 }
								</td>
								<td>
									${user.userName }
								</td>
								<td >
									${user.loginName }
								</td>
								<td >
									${user.gender eq 1 ?'男':'女' }
								</td>
								<td >
									${user.mobile }
								</td>
								<td>
									${user.mail }
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pageBean.list}">
						<tr>
							<td colspan="7" style="text-align: center;">
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
        <h4 class="modal-title" id="exampleModalLabel">用户管理</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal" role="form" id="addForm">
        		<input type="hidden" id="uuid" name="uuid"/>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">用户姓名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户姓名"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">登录名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="loginName" name="loginName" placeholder="请输入登录名"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<select class="form-control" id="gender" name = "gender">
							<option value="" selected>请选择</option>
							<option value=1>男</option>
							<option value=2>女</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">手机号码</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="mobile" name="mobile" placeholder="请输入手机号码"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="mail" name="mail" placeholder="请输入邮箱" />
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
		                userName: {/*键名username和input name值对应*/
		                    message: '请输入用户名称',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '用户名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            min: 1,
		                            max: 50,
		                            message: '用户名称不能超过50个字'
		                        }/*最后一个没有逗号*/
		                    }
		                },
		                loginName: {
		                    message:'请输入登录名',
		                    validators: {
		                        notEmpty: {
		                            message: '登录名不能为空'
		                        },
		                        regexp: {
			                         regexp: /[a-zA-Z0-9]/,
			                         message: '登录名只能为字母和数字'
			                     },
			                     stringLength: {
		                            /*长度提示*/
		                            min: 3,
		                            max: 30,
		                            message: '用户名长度必须在3到30之间'
		                        },
		                        threshold: 3,//只有4个字符以上才发送ajax请求
		                        remote:{
		                        	//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
		                            url:"${menu}/checkLoginName.shtml",
		                            delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                            type:'POST',
		                            data: function(validator) {
		                                return {
		                                    loginName:$('#loginName').val(),
		                                    uuid:$('#uuid').val()
		                                };
		                            },
		                            message:'该登录名已被使用，请使用其他登录名'
		                        }
		                    }
		                },
		                gender:{
		                	message:'请选择性别',
		                    validators: {
		                        notEmpty: {
		                            message: '性别不能为空'
		                        }
		                    }/*最后一个没有逗号*/
			            },
			            mail: {
			                 validators: {
			                     /*notEmpty: {
			                         message: '邮箱不能为空'
			                     },*/
			                     emailAddress: {
			                         message: '请输入正确的邮件地址如：123@qq.com'
			                     }
			                 }
			             },
			             mobile: {
			                 message: '手机号码不能为空',
			                 validators: {
			                     notEmpty: {
			                         message: '手机号码不能为空'
			                     },
			                     stringLength: {
			                         min: 11,
			                         max: 11,
			                         message: '请输入11位手机号码'
			                     },
			                     regexp: {
			                         regexp: /^1[3|5|8|7]{1}[0-9]{9}$/,
			                         message: '请输入正确的手机号码'
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
						$("#userName").attr("readonly","readonly");
						$("#loginName").attr("readonly","readonly");
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
	</script>					    
	</body>
</html>
