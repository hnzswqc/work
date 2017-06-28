<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("STATUS_ENABLE",Constant.STATUS_ENABLE);
request.setAttribute("STATUS_DISABLE",Constant.STATUS_DISABLE);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>图形界面功能管理</title>
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
		
	</style>
		<%@ include file="/common/bootstrap.jsp"%>
	</head>

	<body>
		<form action="<%=basePath%>pagePower/index.shtml" id="queryForm" name="queryForm" method="post">
			<input type="hidden" name="page" id="reqPage" value="${pageBean.page }">
			<input type="hidden" name="limit" id="limit" value="${pageBean.limit }">
			<input type="hidden" name="title"  value="${pagePower.title }">
			<input type="hidden" name="pageInfoUuid"  value="${pagePower.pageInfoUuid }">
		</form>
	<!-- header start -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- header end -->
	<div class="container-fluid" >
		<div class="panel panel-primary"  style="${(!empty pagePower.title||!empty pagePower.pageInfoUuid)?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>pagePower/index.shtml" method="post">
				  <div class="form-group">
				    <label for="id" style="display: inline;">标题：</label>
				    <input type="text"  class="form-control"  id="title" name="title" value="${pagePower.title }" placeholder="请输入要查询的标题">
				  </div>
				  <div class="form-group">
				   <label for="name" style="display: inline;">所属模块：</label>
				   <select class="form-control" id="status" name="pageInfoUuid" onchange="javascript:change();">
					  <option value="">请选择</option>
					  <c:forEach items="${list}" var="pageInfo">
					  	 <option value="${pageInfo.uuid }" ${pageInfo.uuid eq pagePower.pageInfoUuid?'selected':'' }>${pageInfo.title }</option>
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
				<a href="javascript:show();" class="btn btn-info" id="show">预览</a>
				<a href="javascript:delConfirmClick();" class="btn btn-danger">删除</a>
			</div>
		</div>
	<div class="panel panel-primary" >
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		    图形界面管理
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
				      <th>标题</th>
				      <th>布局数量</th>
				      <th>高度（px）</th>
				      <th>URL</th>
				      <th>说明信息</th>
				      <th width="80px" style="text-align: center;">排序号</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="pagePower" varStatus="i">
							<tr >
								<td style="text-align: center;">
									<input type="radio" name="uuid" value="${pagePower.uuid }"/>
								</td>
								<td style="text-align: center;">
									<a href="javascript:update('${pagePower.uuid }');">${(pageBean.page-1)*pageBean.limit+i.index+1 }</a>
								</td>
								<td>
									<a href="javascript:update('${pagePower.uuid }');">${pagePower.title }</a>
								</td>
								<td>
									<a href="javascript:update('${pagePower.uuid }');">${pagePower.layOutNum }</a>
								</td>
								<td>
									<a href="javascript:update('${pagePower.uuid }');">${pagePower.height }</a>
								</td>
								<td>
									<a href="javascript:update('${pagePower.uuid }');">${pagePower.url }</a>
								</td>
								<td>
									<a href="javascript:update('${pagePower.uuid }');">${pagePower.description }</a>
								</td>
								<td style="text-align: center;">
									<a href="javascript:update('${pagePower.uuid }');">${pagePower.sequenceNo }</a>
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
						  <c:forEach items="${list}" var="pageInfo">
						  	 <option value="${pageInfo.uuid }" ${pageInfo.uuid eq pagePower.pageInfoUuid?'selected':'' }>${pageInfo.title }</option>
						  </c:forEach>
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
		function add(){
			$("#addForm").clear();
			$("#model_set").modal({backdrop: 'static',keyboard: false});
			$("#height").val(400);
		}
		
		$(function () { $("[data-toggle='tooltip']").tooltip(); });
		
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
							    	$("#searchForm").submit();
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
			update(uuid);
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
			
			Ewin.confirm({message:"<span style='color:red;font-weight:bold;'>确定要删除吗？</span>"}).on(function(e){
				if(!e){
					return;
				}
				$.ajax({
					url:'<%=basePath%>pagePower/delete.shtml',
					type:'POST',
					data:{"uuid":uuid},
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: "删除成功！" }).on(function (e) {
								$("#searchForm").submit();
				     	  });
						}else{
							Ewin.alert({ message: "删除失败<br/>"+json.msg });
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
			window.location.href="<%=basePath %>pagePower/index.shtml";
		}

		//显示图形界面信息
		function show(){
			var uuid = $('input[name="uuid"]:checked').val();
			if(uuid==""||uuid==undefined){
				Ewin.alert({ message: "请先选择一条数据！" });
				return;
			}
			post("<%=basePath %>pagePower/show.shtml",{uuid:uuid});
		}
	</script>					    
	</body>
</html>
