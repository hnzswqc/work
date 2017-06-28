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

		<title><%=Constant.config_title %>>>日常统计</title>
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
			<input type="hidden" name="startTime" value="${workCollect.startTime }">
			<input type="hidden" name="endTime" value="${workCollect.endTime }">
			
		</form>
	<div class="container-fluid" >
		<div class="panel panel-primary"  style="${!(empty workCollect.startTime&&empty workCollect.endTime)?"":"display: none"}" id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		      查询条件
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="searchForm" action="<%=basePath%>${menu }/index.shtml" method="post">
				  <div class="form-group">
				    <label for="name" style="display: inline;">开始时间：</label>
				    <input type="text"  class="form-control" style="width: 160px!important;background-color:#FFFFFF;" readonly="readonly"  name="startTime" value="${workCollect.startTime }" placeholder="请输入查询开始时间" onfocus="WdatePicker();">
				  </div>
				   <div class="form-group">
				    <label for="name" style="display: inline;">结束时间：</label>
				    <input type="text"  class="form-control"  style="width: 160px!important;background-color:#FFFFFF;"  readonly="readonly" name="endTime" value="${workCollect.endTime }" placeholder="请输入查询结束时间" onfocus="WdatePicker();">
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
				<a href="javascript:exportBtnClick();" class="btn btn-info" id="exportBtn">导出</a>
				<a href="javascript:delConfirmClick();" class="btn btn-danger">删除</a>
			</div>
		</div>
	<div class="panel panel-primary" >
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		考勤管理
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
				      <th width="100px">日期</th>
				      <th>人数</th>
				      <th>总支出</th>
				      <th>工资总支出</th>
				      <th>借款总支出</th>
				      <th>杂项总支出</th>
				      <%--
				      <th>记录人</th>
				       --%>
				      <th width="200px">记录时间</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty pageBean.list}">
						<c:forEach items="${pageBean.list}" var="workCollect" varStatus="i">
							<tr >
								<td>
									<input type="radio" name="uuid" value="${workCollect.uuid }"/>
								</td>
								<td>
									${(pageBean.page-1)*pageBean.limit+i.index+1 }
								</td>
								<td>
									<a href="javascript:show('${workCollect.uuid }');">${workCollect.date }</a>
								</td>
								<td>
									<a href="javascript:show('${workCollect.uuid }');">${workCollect.workerNum }</a>
								</td>
								<td>
									<a href="javascript:show('${workCollect.uuid }');"><fmt:formatNumber type="number" value="${workCollect.wages+workCollect.lendMoney+workCollect.other }" pattern="0.00" maxFractionDigits="2"/></a>
								</td>
								<td>
									<a href="javascript:show('${workCollect.uuid }');"><fmt:formatNumber type="number" value="${workCollect.wages}" pattern="0.00" maxFractionDigits="2"/></a>
								</td>
								<td >
									<a href="javascript:show('${workCollect.uuid }');"><fmt:formatNumber type="number" value="${workCollect.lendMoney}" pattern="0.00" maxFractionDigits="2"/></a>
								</td>
								<td>
									<a href="javascript:show('${workCollect.uuid }');"><fmt:formatNumber type="number" value="${workCollect.other}" pattern="0.00" maxFractionDigits="2"/></a>
								</td>
								<%--
								<td>
									<a href="javascript:show('${workCollect.uuid }');">${workCollect.userName }</a>
								</td>
								 --%>
								<td >
									<a href="javascript:show('${workCollect.uuid }');">${workCollect.createTime}</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pageBean.list}">
						<tr>
							<td colspan="9" style="text-align: center;">
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
		
	


	
	<script type="text/javascript">

		//进入添加界面
		function add(){
			window.location.href="<%=basePath %>${menu }/addPage.shtml";
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
			window.location.href="<%=basePath %>${menu }/updPage.shtml?uuid="+uuid+"&time="+new Date().getTime();
		}

		//显示详细信息
		function show(uuid){
			window.location.href="<%=basePath %>${menu }/show.shtml?uuid="+uuid+"&time="+new Date().getTime();
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
							Ewin.alert({ message: "<em>删除成功！</em>" }).on(function (e) {
								refreshIconClick();
				     	  });
						}else{
							Ewin.alert({ message: "<em>"+json.msg+"</em>" });
						}
					},
					error:function(e){
						Ewin.alert({ message: "<em>操作出现异常！</em>" });
					}
				});
			});
		}

		//刷新按钮
		function refreshIconClick(){
			window.location.href="<%=basePath %>${menu }/index.shtml";
		}

		//导出excel
		function exportBtnClick(){
			$("#queryForm").attr("action","<%=basePath %>${menu }/index_export.shtml");
			$("#queryForm").submit();
			$("#queryForm").attr("action","<%=basePath %>${menu }/index.shtml");
		}


		
	</script>					    
	</body>
</html>
