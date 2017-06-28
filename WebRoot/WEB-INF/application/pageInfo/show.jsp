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

		<title><%=Constant.config_title %>>>${pageInfo.title }</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<%@ include file="/common/bootstrap.jsp"%>
		<style type="text/css">
		.panel-body-height{
			height: 390px!important;
		}
		</style>
		<script type="text/javascript">
		function reloadIframe(a) {
			document.getElementById("iframe_"+a).contentWindow.location.reload(true);
		}
		</script>
	</head>

	<body>
	<!-- header start -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- header end -->
	
	<!-- container start -->
    <div class="container" >
		<div class="row clearfix">
			
			<div class="col-md-12 column ">
				<c:if test="${pageInfo.num eq 1}">
					<h2 class="text-center text-info">
						${pageInfo.title }<c:if test="${!empty type}">—预览界面</c:if>
					</h2>
					<h3 class="text-center text-info">
						${pageInfo.subTitle }
					</h3>
				</c:if>
				<c:if test="${!empty type}">
					<h5 class="text-center text-info" style="color: red">
						界面访问链接：<%=basePath%>pageInfo/show.shtml?uuid=${pageInfo.uuid }
					</h5>
				</c:if>
			</div>
			<c:if test="${empty list}">
				<div class="col-md-12 column" id="model_">
					<div class="panel panel-primary" >
						<div class="panel-heading">
							<h3 class="panel-title">
								没有指定相应的功能
							</h3>
						</div>
						<div class="panel-body panel-body-height" style="overflow: auto">
						
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach items="${list}" var="pagePower" varStatus="i">
					<div class="col-md-${pagePower.layOutNum } column" id="model_${i.index }">
						<div class="panel panel-primary" >
							<div class="panel-heading">
								<h3 class="panel-title">
									${pagePower.title }
									<div class="close">
										<span class="glyphicon glyphicon-refresh" aria-hidden="true" title="刷新面板" onclick="javascript:reloadIframe(${i.index });"></span>
									</div>
									<c:if test="${!empty type}">
										<div class="close">
											<span class="glyphicon glyphicon-pencil" aria-hidden="true" title="点击进行修改" onclick="javascript:update('${pagePower.uuid }');"></span>
										</div>
									</c:if>
								</h3>
							</div>
							<div class="panel-body panel-body-height" style="overflow: auto;height: ${empty pagePower.height?400:pagePower.height }px!important">
								<c:if test="${!(empty pagePower.url||pagePower.url eq '#')}">
									<iframe src="${pagePower.url }" id="iframe_${i.index }" frameborder="no" width="100%" height="100%" scrolling="no"></iframe>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
		<!-- container end -->
<c:if test="${!empty type}">
<!-- 修改设置 -->
<div class="modal fade" id="model_set" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">功能管理</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal" role="form" id="addForm">
        		<input type="hidden" id="uuid" name="uuid"/>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="title" name="title" placeholder="请输入标题"/>
					</div>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">所属模块</label>
					<div class="col-sm-10">
						<select class="form-control" id="status" name="pageInfoUuid">
						  	 <option value="${pageInfo.uuid }" >${pageInfo.title }</option>
					    </select>
					</div>
				</div>
				<div class="form-group">
					<label for="subTitle" class="col-sm-2 control-label">
					 <a class="tooltip-test" data-toggle="tooltip" title="每行显示数量相加为12，超过12自动换行原则。例如：4-4-4" style="cursor: hand;">布局数量</a></label>
					<div class="col-sm-10">
						<select class="form-control"  name="layOutNum" id="layOutNum">
						   <option value="12">12</option>
						   <option value="8">8<ption>
					       <option value="6">6</option>
					       <option value="4">4</option>
						   <option value="2">2</option>
					    </select>
					</div>
				</div>
				<div class="form-group">
					<label for="subTitle" class="col-sm-2 control-label">高度</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="height" name="height" value="400" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					</div>
				</div>
				<div class="form-group">
					<label for="subTitle" class="col-sm-2 control-label">URL</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="url" name="url" placeholder="请输入链接地址，没有请用#代替"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="sequenceNo" class="col-sm-2 control-label">排列序号</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="sequenceNo" name="sequenceNo" placeholder="1" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="4"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="description" class="col-sm-2 control-label">说明信息</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="3" id="description" name="description"></textarea>
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
	$(document).ready(function() {
		validateForm();
		$('#model_set').on('hidden.bs.modal', function() {
	        $("#addForm").data('bootstrapValidator').destroy();
	        $('#addForm').data('bootstrapValidator', null);
	        validateForm();
	     });
		
		 $('#model_set').on('shown.bs.modal', function() {
			 // validateForm();
		 });
		
		$("#save").click(function(){
			$("#addForm").submit();
		});
	   
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
	                title: {/*键名username和input name值对应*/
	                    message: '请输入正确的标题',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '标题不能为空'
	                        },
	                        stringLength: {/*长度提示*/
	                            min: 1,
	                            max: 50,
	                            message: '标题不能超过50个字'
	                        }/*最后一个没有逗号*/
	                    }
	                },
	                pageInfoUuid: {
	                    message:'请输入选择所属模块',
	                    validators: {
	                		 notEmpty: {/*非空提示*/
	                            message: '所属模块不能为空'
	                        }
	                    }
	                },
	                url:{
	                	message:'请输入URL参数',
	                    validators: {
	                        notEmpty: {
	                            message: '请输入URL参数,为空以#代替'
	                        }
	                    }
		            },
		            sequenceNo:{
		            	message:'请输入排序号',
	                    validators: {
	                        notEmpty: {
	                            message: '排序号不能为空'
	                        }
	                    }
			        },
	                description: {
	                    message:'请简单输入点说明信息',
	                    validators: {
	                        stringLength: {/*长度提示*/
	                            min: 1,
	                            max: 400,
	                            message: '说明信息不能超过400个字'
	                        }/*最后一个没有逗号*/
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
					url:"<%=basePath %>pagePower/modify.shtml",
					type:'POST',
					data:$form.serialize(),
					dataType:'JSON',
					success:function(json){
						if(json.success){
							$('#model_set').modal('hide');
						    Ewin.alert({ message: "操作成功！" }).on(function (e) {
						    	post("<%=basePath %>pageInfo/show.shtml",{uuid:'${pageInfo.uuid}',type:'show'});
				     		});
						}else{
							Ewin.alert({ message: "操作失败！" });
						}
					},
					error:function(e){
						Ewin.alert({ message: "网络出现异常！" });
					}
				});
	        });
	}




	//修改一条信息
	function update(uuid){
		$.ajax({
			url:"<%=basePath %>pagePower/findByPrimaryKey.shtml",
			type:'POST',
			data:{"uuid":uuid},
			dataType:'JSON',
			success:function(json){
				if(json.success){
					$("#addForm").setForm(json.data);
					$("#model_set").modal({backdrop: 'static',keyboard: false});
					$("#status").attr("readonly","readonly");
				}else{
					Ewin.alert({ message: "获取信息失败！" });
				}
			},
			error:function(e){
				Ewin.alert({ message: "网络出现异常！" });
			}
		});
	}

	

    </script>
</c:if>					    
	</body>
</html>
