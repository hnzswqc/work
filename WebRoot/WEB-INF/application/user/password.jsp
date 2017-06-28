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

		<title><%=Constant.config_title %>>>修改密码</title>
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
			width:50%!important;
			margin-left: auto;
			margin-right: auto;
			margin-top: 50px;
			
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
	
	<div class="panel panel-primary" >
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		修改密码
		      </h3>
		   </div>
		   <form class="form-horizontal" role="form" id="addForm">
				<div class="form-group" style="padding-top: 20px;">
					<label for="modelName" class="col-sm-2 control-label">原密码</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="password" name="password" placeholder="请输入原密码"/>
					</div>
				</div>
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="newPassword" name="newPassword" placeholder="请输入新密码"/>
					</div>
				</div>
			
				<div class="form-group">
					<label for="modelName" class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="repassword" name="repassword" placeholder="请输入确认密码"/>
					</div>
				</div>
				 <div class="modal-footer" style="height: 40px;">
			        <button type="button" class="btn btn-primary" id="save" >保存</button>
			        <button type="button" class="btn btn-default">重置</button>
			     </div>
			</form>
		   
		   
		</div>
		
		
   
	


	
	<script type="text/javascript">


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
		            	password: {/*键名username和input name值对应*/
		                    message: '请输入原密码',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '原密码不能为空'
		                        }		                        
		                    }
		                },
		                newPassword:{
		                	message: '请输入新密码',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '新密码不能为空'
		                        },
		                        stringLength: {
			                         min: 6,
			                         max: 30,
			                         message: '请输入6-30位密码'
			                     },
			                     different: {//不能和原密码相同
			                         field: 'password',//需要进行比较的input name值
			                         message: '不能和原密码相同'
			                     },
			                     regexp: {
			                         regexp: /^[a-zA-Z0-9]+$/,
			                         message: '密码只能是字母和数字'
			                     }
		                    }
		                   
			            },
			            repassword:{
		                	message: '请输入确认密码',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '原密码不能为空'
		                        },
		                        stringLength: {
			                         min: 6,
			                         max: 30,
			                         message: '请输入6-30位密码'
			                     },
			                     identical: {//相同
			                         field: 'newPassword', //需要进行比较的input name值
			                         message: '确认密码和新密码不一致'
			                     },
			                     regexp: {
			                         regexp: /^[a-zA-Z0-9]+$/,
			                         message: '密码只能是字母和数字'
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
						url:"<%=basePath %>user/updPassword.shtml",
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
							    	window.location.href='<%=basePath%>user/setPassword.shtml';
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

	</script>					    
	</body>
</html>
