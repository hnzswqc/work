<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("SCORE_MAP",Constant.SCORE_MAP);
request.setAttribute("CHECK_WORK_STATUS_CQ",Constant.CHECK_WORK_STATUS_CQ);
request.setAttribute("CHECK_WORK_STATUS_QQ",Constant.CHECK_WORK_STATUS_QQ);
request.setAttribute("CHECK_WORK_TIME_MORNING",Constant.CHECK_WORK_TIME_MORNING);
request.setAttribute("CHECK_WORK_TIME_AFTERNOON",Constant.CHECK_WORK_TIME_AFTERNOON);
request.setAttribute("CHECK_WORK_TIME_NIGHT",Constant.CHECK_WORK_TIME_NIGHT);

%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title><%=Constant.config_title %>>>考勤管理</title>
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
			vertical-align: middle!important;
		}
		table th{
			text-align: center;
			vertical-align: middle!important;
		}
		table tr td{
			text-align: center!important;
			vertical-align: middle!important;
		}
		.form-inline .form-group .form-control{
			width:120px!important;
		}
		.input-num{
			border-color: red!important;
		}
	</style>
		<%@ include file="/common/bootstrap.jsp"%>
	</head>

	<body>
	<div class="container-fluid" >
		<div class="panel panel-default" >
			<div class="panel-body" style="padding-left:0px!important;">
				<a href="javascript:save();" class="btn btn-primary" >保存</a>
				<a href="javascript:delConfirmClick();" id="delBtn" style="display: none;" class="btn btn-danger" >删除重置</a>
				<a href="javascript:back();" class="btn btn-info">返回</a>
			</div>
		</div>
		<div class="panel panel-primary"   id="searchPanel">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		     汇总信息(单位：元)
		      </h3>
		   </div>
		   <div class="panel-body">
			   <form class="form-inline" id="workCollectForm" action="<%=basePath%>${menu }/index.shtml" method="post">
				  <div class="form-group">
				    <label for="name" style="display: inline;">考勤时间：</label>
				    <input type="text"  class="form-control" id="date"  name="date" id="date" value="${date }" onfocus="WdatePicker();" onchange="javascript:updDate();" onblur="javascript:validateNumField(this);" readonly="readonly" style="background-color:#FFFFFF ">
				  </div>
			     <div class="form-group">
				    <label for="name" style="display: inline;">考勤人数：</label>
				    <input type="text"  class="form-control" id="workerNum" name="workerNum" value="${fn:length(list)}"  readonly="readonly">
				  </div>
				   <div class="form-group">
				    <label for="name" style="display: inline;">总支出：</label>
				    <input type="text"  class="form-control" id="total" value="<fmt:formatNumber type="number" value="${workColler.wages+workColler.lendMoney+workColler.other }" pattern="0.00" maxFractionDigits="2"/> " readonly="readonly">
				  </div>
				   <div class="form-group">
				    <label for="name" style="display: inline;">工资总支出：</label>
				    <input type="number"  class="form-control"  name="wages" id="total_wages" value="<fmt:formatNumber type="number" value="${empty workColler.wages?0:workColler.wages }" pattern="0.00" maxFractionDigits="2"/>" readonly="readonly">
				  </div>
				   <div class="form-group">
				    <label for="name" style="display: inline;">借款总支出：</label>
				    <input type="number"  class="form-control"  name="lendMoney" id="total_lendMoney" value="<fmt:formatNumber type="number" value="${empty workColler.lendMoney?0:workColler.lendMoney  }" pattern="0.00" maxFractionDigits="2"/>" readonly="readonly">
				  </div>
				  <div class="form-group">
				    <label for="name" style="display: inline;">杂项总支出：</label>
				    <input type="number"  class="form-control"  name="other" id="total_other" value="<fmt:formatNumber type="number" value="${empty workColler.other?0:workColler.other }" pattern="0.00" maxFractionDigits="2"/>" readonly="readonly">
				  </div>
				</form>
		   </div>
		</div>
		<div style="padding-top: 10px;color: red">
			注：考勤时间不能为空。工资（元）和借款（元）只能输入数字，且保留两位小数！绿色对勾代表正常出勤，灰色对勾代表未出勤。
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
		   	<form action="" id="addForm" method="post" style="display: inline;">
				<table class="table table-bordered table-hover">
				<thead>
				    <tr>
				      <th width="100px">序号</th>
				      <th width="100px">姓名</th>
				      <th width="100px">工种</th>
				      <th width="100px">时间</th>
				      <th width="100px">考勤</th>
				      <th width="100px">评分</th>
				      <th width="150px">工资（元）</th>
				      <th width="150px">借款（元）</th>
				      <th>备注</th>
				    </tr>
				  </thead>
					<tbody>
					<c:if test="${!empty list}">
						<c:set var="total_wages" value="0"></c:set>
						<c:set var="total_lendMoney" value="0"></c:set>
						<c:forEach items="${list}" var="worker" varStatus="i">
							<c:set var="total_wages" value="${total_wages+worker.wages}"></c:set>
							 <tr>
								<td rowspan="3">
									${i.index+1}
								</td>
								<td rowspan="3">
									${worker.name}
								</td>
								<td rowspan="3">
									${worker.workTypeName}
								</td>
								<c:set value="${fu:findCheckWorkList(date,worker)}" var="checkWorkList"></c:set>
								<c:if test="${!empty checkWorkList}">
									<c:forEach items="${checkWorkList}" var = "cw" varStatus="j">
										<c:set value="${j.index}" var="l"></c:set>
										<td>
											<c:choose>
												<c:when test="${cw.time == CHECK_WORK_TIME_MORNING}">上午</c:when>
												<c:when test="${cw.time == CHECK_WORK_TIME_AFTERNOON}">下午</c:when>
												<c:when test="${cw.time == CHECK_WORK_TIME_NIGHT}">晚班</c:when>
												<c:otherwise>未知</c:otherwise>
											</c:choose>
											<input type="hidden" name="list[${i.index*3+l }].workerUuid" id="workerUuid_${i.index*3+l}" value="${worker.uuid }"/>
								    		<input type="hidden" name="list[${i.index*3+l }].workerName" id="workerName_${i.index*3+l}" value="${worker.name }"/>
								    		<input type="hidden" name="list[${i.index*3+l }].workType" id="workType_${i.index*3+l}" value="${worker.workType }"/>
								    		<input type="hidden" name="list[${i.index*3+l }].sequenceNo" id="sequenceNo_${i.index*3+l}" value="${worker.sequenceNo }"/>
								    		<input type="hidden" name="list[${i.index*3+l }].status" id="status_${i.index*3+l}" value="${cw.status }"/>
								    		<input type="hidden" name="list[${i.index*3+l }].time" id="time_${i.index*3+l}" value="${cw.time }"/>
										</td>
										<td>
											<a href="javascript:checkWork(${i.index*3+l });">
						    					<img id="statusImg_${i.index*3+l }" alt="" src="images/success_${cw.status }.png" width="30px;" height="30px;">
						    				</a>
										</td>
										<td>
											<select name="list[${i.index*3+l }].score" id="score_${i.index*3+l }" ${cw.status eq CHECK_WORK_STATUS_QQ?'disabled':'' }  class="form-control">
									    		<c:forEach items="${SCORE_MAP}" var="s">
									    			<option value="${s.key }" ${s.key eq cw.score?'selected':''}>${s.value }</option>
									    		</c:forEach>
									    	</select>
										</td>
										 <td ><input type="number"  class="form-control"  name="list[${i.index*3+l }].wages" ${cw.status eq CHECK_WORK_STATUS_QQ?'disabled':'' } id="wages_${i.index*3+l }" value="<fmt:formatNumber type="number" value="${cw.wages }" pattern="0.00" maxFractionDigits="2"/>" onblur="javascript:validateNumField(this);"></td>
									    <td ><input type="number"  class="form-control"  name="list[${i.index*3+l }].lendMoney" id="lendMoney_${i.index*3+l }" ${cw.status eq CHECK_WORK_STATUS_QQ?'disabled':'' } value="<fmt:formatNumber type="number" value="${cw.lendMoney }" pattern="0.00" maxFractionDigits="2"/>" onblur="javascript:validateNumField(this);"></td>
										<td>
											<textarea rows="1" cols="20" class="form-control" id="note_${i.index*3+l }" name="list[${i.index*3+l }].note" ${cw.status eq CHECK_WORK_STATUS_QQ?'disabled':'' }>${cw.note}</textarea>
										</td>
										<c:if test="${!j.last}">
										 	</tr>
								 		 	<tr>
										</c:if>
										<c:if test="${j.last}">
										 	</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${empty checkWorkList}">
										<td>上午
											<input type="hidden" name="list[${i.index*3 }].workerUuid" id="workerUuid_${i.index*3}" value="${worker.uuid }"/>
								    		<input type="hidden" name="list[${i.index*3 }].workerName" id="workerName_${i.index*3}" value="${worker.name }"/>
								    		<input type="hidden" name="list[${i.index*3 }].workType" id="workType_${i.index*3}" value="${worker.workType }"/>
								    		<input type="hidden" name="list[${i.index*3 }].sequenceNo" id="sequenceNo_${i.index*3}" value="${worker.sequenceNo }"/>
								    		<input type="hidden" name="list[${i.index*3 }].status" id="status_${i.index*3}" value="${CHECK_WORK_STATUS_CQ }"/>
								    		<input type="hidden" name="list[${i.index*3 }].time" id="time_${i.index*3}" value="${CHECK_WORK_TIME_MORNING }"/>
										</td>
									    <td>
									    	<a href="javascript:checkWork(${i.index*3 });">
									    		<img id="statusImg_${i.index*3 }" alt="" src="images/success_1.png" width="30px;" height="30px;">
						    				</a>
									    </td>
									    <td>
									    	<select name="list[${i.index*3 }].score" id="score_${i.index*3 }" class="form-control" ${empty workCollect.uuid?'':'disabled' }>
									    		<c:forEach items="${SCORE_MAP}" var="s">
									    			<option value="${s.key }">${s.value }</option>
									    		</c:forEach>
									    	</select>
									    </td>
									    <td ><input type="number"  class="form-control"  name="list[${i.index*3 }].wages" id="wages_${i.index*3 }" ${empty workCollect.uuid?'':'disabled' } value="<fmt:formatNumber type="number" value="${worker.wages/2 }" pattern="0.00" maxFractionDigits="2"/>" onblur="javascript:validateNumField(this);"></td>
									    <td ><input type="number"  class="form-control"  name="list[${i.index*3 }].lendMoney" id="lendMoney_${i.index*3 }" ${empty workCollect.uuid?'':'disabled' } value="" onblur="javascript:validateNumField(this);"></td>
										<td>
											<textarea rows="1" cols="20" class="form-control" id="note_${i.index*3 }" name="list[${i.index*3 }].note" ${empty workCollect.uuid?'':'disabled' }></textarea>
										</td>
									  </tr>
									  <tr>
									  
									    <td>下午
								    		<input type="hidden" name="list[${i.index*3+1 }].workerUuid" id="workerUuid_${i.index*3+1}" value="${worker.uuid }"/>
								    		<input type="hidden" name="list[${i.index*3+1 }].workerName" id="workerName_${i.index*3+1 }" value="${worker.name }"/>
								    		<input type="hidden" name="list[${i.index*3+1 }].workType" id="workType_${i.index*3+l}" value="${worker.workType }"/>
								    		<input type="hidden" name="list[${i.index*3+1 }].sequenceNo" id="sequenceNo_${i.index*3+1 }" value="${worker.sequenceNo }"/>
								    		<input type="hidden" name="list[${i.index*3+1 }].status" id="status_${i.index*3+1 }" value="${CHECK_WORK_STATUS_CQ }"/>
								    		<input type="hidden" name="list[${i.index*3+1 }].time" id="time_${i.index*3+1 }" value="${CHECK_WORK_TIME_AFTERNOON }"/>
									    </td>
									    <td>
									    	<a href="javascript:checkWork(${i.index*3+1 });">
								    			<img id="statusImg_${i.index*3+1 }" alt="" src="images/success_1.png" width="30px;" height="30px;">
						    				</a>
								    	 </td>
									    <td >
									    	<select name="list[${i.index*3+1 }].score" id="score_${i.index*3+1 }" class="form-control" ${empty workCollect.uuid?'':'disabled' }>
									    		<c:forEach items="${SCORE_MAP}" var="s">
									    			<option value="${s.key }">${s.value }</option>
									    		</c:forEach>
									    	</select>
									    </td>
									   <td ><input type="number"  class="form-control"  name="list[${i.index*3+1 }].wages" id="wages_${i.index*3+1 }" ${empty workCollect.uuid?'':'disabled' } value="<fmt:formatNumber type="number" value="${worker.wages/2 }" pattern="0.00" maxFractionDigits="2"/>" onblur="javascript:validateNumField(this);"></td>
									   <td ><input type="number"  class="form-control"  name="list[${i.index*3+1 }].lendMoney" id="lendMoney_${i.index*3+1 }" ${empty workCollect.uuid?'':'disabled' }  value="" onblur="javascript:validateNumField(this);"></td>
										<td>
											<textarea rows="1" cols="20" class="form-control" id="note_${i.index*3+1}" name="list[${i.index*3+1}].note" ${empty workCollect.uuid?'':'disabled' }></textarea>
										</td>
									  </tr>
									  <tr>
									    <td>晚班
								    		<input type="hidden" name="list[${i.index*3+2 }].workerUuid" id="workerUuid_${i.index*3+2 }" value="${worker.uuid }"/>
								    		<input type="hidden" name="list[${i.index*3+2 }].workerName" id="workerName_${i.index*3+2 }" value="${worker.name }"/>
								    		<input type="hidden" name="list[${i.index*3+2 }].workType" id="workType_${i.index*3+2}" value="${worker.workType }"/>
								    		<input type="hidden" name="list[${i.index*3+2 }].sequenceNo" id="sequenceNo_${i.index*3+2 }" value="${worker.sequenceNo }"/>
								    		<input type="hidden" name="list[${i.index*3+2 }].status" id="status_${i.index*3+2 }" value="${CHECK_WORK_STATUS_QQ }"/>
								    		<input type="hidden" name="list[${i.index*3+2 }].time" value="${CHECK_WORK_TIME_NIGHT }"/>
									    </td>
								      	<td>
								      		<a href="javascript:checkWork(${i.index*3+2 });">
							    				<img id="statusImg_${i.index*3+2  }" alt="" src="images/success_2.png" width="30px;" height="30px;">
								    		</a>
								    	  </td>
									    <td >
									    	<select name="list[${i.index*3+2 }].score" id="score_${i.index*3+2 }" class="form-control" disabled="disabled">
									    		<c:forEach items="${SCORE_MAP}" var="s">
									    			<option value="${s.key }">${s.value }</option>
									    		</c:forEach>
									    	</select>
									    </td>
									    <td ><input type="number"  class="form-control"  name="list[${i.index*3+2 }].wages" disabled id="wages_${i.index*3+2 }" value="" onblur="javascript:validateNumField(this);" disabled="disabled"></td>
									    <td ><input type="number"  class="form-control"  name="list[${i.index*3+2 }].lendMoney" disabled  id="lendMoney_${i.index*3+2 }" value="" onblur="javascript:validateNumField(this);" disabled="disabled"></td>
										<td>
											<textarea rows="1" cols="20" class="form-control" id="note_${i.index*3+2 }" disabled name="list[${i.index*3+2 }].note" disabled="disabled"></textarea>
										</td>
									  </tr>
								</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="9" style="text-align: center;">
								对不起，没有您要查找的数据
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
				</form>
		</div>
		
	<div class="panel panel-primary" style="margin-top: 10px;">
		   <div class="panel-heading">
		      <h3 class="panel-title">
		 		杂项支出
			    	<div class="close">
				</div>
		      </h3>
		   </div>
		   	<form action="" id="costForm" method="post" style="display: inline;">
				<table class="table table-bordered table-hover">
				<thead>
				    <tr>
				      <th width="100px">序号</th>
				      <th >支出类别</th>
				      <th width="200px">金额（元）</th>
				      <th>备注</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				  <c:if test="${empty workCostList}">
					  <c:if test="${empty workTypeList}">
					  	<tr>
					  		<td colspan="4">
					  			未设置开销类别，请联系管理员！
					  		</td>
					  	</tr>
					  </c:if>
					   <c:if test="${!empty workTypeList}">
					   		<c:forEach items="${workTypeList}" var="workType" varStatus="i">
					   				<tr>
								  		<td>
										  ${i.index+1 }
								  		</td>
								  		<td>
								  			${workType.text }
								  			<input type="hidden" name="workCostList[${i.index }].workType" value="${workType.code }"/>
								  			<input type="hidden" name="workCostList[${i.index }].sequenceNo" value="${workType.sequenceNo }"/>
								  		</td>
								  		<td>
								  			<input type="number"  class="form-control"  name="workCostList[${i.index }].money" id="money_${i.index }" value="" onblur="javascript:validateNumField(this);" >
								  		</td>
								  		<td>
								  			<textarea rows="1" cols="20" class="form-control" id="memo_${i.index}" name="workCostList[${i.index }].note"></textarea>
								  		</td>
								  	</tr>
					   		</c:forEach>
					   </c:if>
				   </c:if>
				   
				   <c:if test="${!empty workCostList}">
		   			 <c:if test="${empty workCostList}">
					  	<tr>
					  		<td colspan="4">
					  			未设置开销类别，请联系管理员！
					  		</td>
					  	</tr>
					  </c:if>
					   <c:if test="${!empty workCostList}">
					   		<c:forEach items="${workCostList}" var="workCost" varStatus="i">
					   				<tr>
								  		<td>
										  ${i.index+1 }
								  		</td>
								  		<td>
								  			${workCost.workTypeName }
								  			<input type="hidden" name="workCostList[${i.index }].workType" value="${workCost.workType }"/>
								  			<input type="hidden" name="workCostList[${i.index }].sequenceNo" value="${workCost.sequenceNo }"/>
								  		</td>
								  		<td>
								  			<input type="number"  class="form-control"  name="workCostList[${i.index }].money" id="money_${i.index }" value="<fmt:formatNumber type="number" value="${workCost.money }" pattern="0.00" maxFractionDigits="2"/>" onblur="javascript:validateNumField(this);" >
								  		</td>
								  		<td>
								  			<textarea rows="1" cols="20" class="form-control" id="memo_${i.index}" name="workCostList[${i.index }].note">${workCost.note }</textarea>
								  		</td>
								  	</tr>
					   		</c:forEach>
					   </c:if>
				   </c:if>
				   
			  </tbody>
		  </table>
	  </form>
	 </div>
			<div class="panel panel-default" >
				<div class="panel-body" style="padding-left:0px!important;">
					<a href="javascript:save();" class="btn btn-primary" >保存</a>
					<a href="javascript:delConfirmClick();" id="delBtn1" style="display: none;" class="btn btn-danger" >删除重置</a>
					<a href="javascript:back();" class="btn btn-info">返回</a>
				</div>
			</div>  
   </div>
   
 
   

	
	<script type="text/javascript">

		//验证数字
		function validateNumField(obj){
			var value=obj.value;
			var id = obj.id;
			if(isNaN(value)){
				$("#"+id).addClass("input-num");
			}else{
				$("#"+id).removeClass("input-num");
				collectTotal();
			}
		}

		
		
		//汇总工资
		function collectWages(){
			var total_wages=0;
			$("input[id^=wages_]").each(function(i,n){
				
				if(!n.disabled&&n.value!=""){
					total_wages=Number(n.value)+total_wages;
				}
			});
			$("#total_wages").val(total_wages.toFixed(2));
		}
		//汇总借款
		function collectLendMoney(){
			var total_lendMoney=0;
			$("input[id^=lendMoney_]").each(function(i,n){
				if(!n.disabled&&n.value!=""){
					total_lendMoney=Number(n.value)+total_lendMoney;
				}
			});
			$("#total_lendMoney").val(total_lendMoney.toFixed(2));
		}

		//杂项支出
		function collectOther(){
			var total_other=0;
			$("input[id^=money_]").each(function(i,n){
				if(!n.disabled&&n.value!=""){
					total_other=Number(n.value)+total_other;
				}
			});
			$("#total_other").val(total_other.toFixed(2));
		}

		//汇总
		function collectTotal(){
			collectWages();
			collectLendMoney();
			collectOther();
			
			var total_wages =Number($("#total_wages").val());
			var total_lendMoney =Number($("#total_lendMoney").val());
			var total_other =Number($("#total_other").val());
			var total = total_wages+total_lendMoney+total_other;
			$("#total").val(total.toFixed(2));
		}

		//删除样式
		function removeClass(id){
			$("#"+id).removeClass("input-num");
		}
		
		//加载一些数据
		$(function(){
			$("#total_wages").val(${total_wages});
			$("#total").val(${total_wages});
		});

		//验证并保存
		function save(){
			var i = validate();
			if(i>0){
				Ewin.alert({ message: "请填写正确的内容格式！" });
				return;
			}


			$.ajax({
				url:'<%=basePath%>workCollect/checkDate.shtml',
				type:'POST',
				data:{date:$("#date").val()},
				dataType:'JSON',
				success:function(json){
					if(json.success){//存在，就先提醒。
						Ewin.confirm({message:"<em>已经存在["+$("#date").val()+"]的考勤信息，确定要删除重新添加 吗？</em>"}).on(function(e){
							if(!e){
								return;
							}
							add();
			     	  });	
					}else{
						//不存在，直接添加
						add();
					}
				},
				error:function(e){
					Ewin.alert({ message: "操作出现异常！" });
				}
			});

			
		}

		//保存
		function add(){
			
			var workCollect =$("#workCollectForm").serialize();
			var checkWork =$("#addForm").serialize();
			var costForm =$("#costForm").serialize();
			var param=workCollect+"&"+checkWork+"&"+costForm;
			Ewin.confirm({message:"<em>确定要保存吗？</em>"}).on(function(e){
				if(!e){
					return;
				}

				$.ajax({
					url:'<%=basePath%>workCollect/modify.shtml',
					type:'POST',
					data:param,
					dataType:'JSON',
					success:function(json){
						if(json.success){
							Ewin.alert({ message: "<em>操作成功！</em>" }).on(function (e) {
								window.location.href="<%=basePath%>workCollect/index.shtml";
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
		
		//验证全部
		function validate(){
			var i=0;
			var date =$("#date").val();
			if(date==""){
				$("#date").addClass("input-num");
				i++;
			}

			//工资
			$("input[id^=wages_]").each(function(i,n){
				var value=obj.value;
				var id = obj.id;
				if(!n.disabled&&n.value!=""){
					if(isNaN(value)){
						$("#"+id).addClass("input-num");
						i++;
					}else{
						$("#"+id).removeClass("input-num");
					}
				}
			});
			//借款
			$("input[id^=lendMoney_]").each(function(i,n){
				var value=obj.value;
				var id = obj.id;
				if(!n.disabled&&n.value!=""){
					if(isNaN(value)){
						$("#"+id).addClass("input-num");
						i++;
					}else{
						$("#"+id).removeClass("input-num");
					}
				}
			});

			//其他开销
			$("input[id^=money_]").each(function(i,n){
				var value=obj.value;
				var id = obj.id;
				if(!n.disabled&&n.value!=""){
					if(isNaN(value)){
						$("#"+id).addClass("input-num");
						i++;
					}else{
						$("#"+id).removeClass("input-num");
					}
				}
			});

			return i;
		}

		//刷新按钮
		function refreshIconClick(){
			window.location.href="<%=basePath %>${menu }/index.shtml";
		}

		//判断是否进行考勤
		function checkWork(i){
			var status = $("#status_"+i).val();
			var src=document.getElementById("statusImg_"+i).src;
			if(src.indexOf("success_2")>0){
				$("#status_"+i).attr("value",${CHECK_WORK_STATUS_CQ});
				document.getElementById("statusImg_"+i).src="images/success_1.png";
				
				$("#workerUuid_"+i).removeAttr("disabled");
				$("#workerName_"+i).removeAttr("disabled");
				$("#sequenceNo_"+i).removeAttr("disabled");
				$("#status_"+i).removeAttr("disabled");
				$("#time_"+i).removeAttr("disabled");
				$("#score_"+i).removeAttr("disabled");
				$("#wages_"+i).removeAttr("disabled");
				$("#lendMoney_"+i).removeAttr("disabled");
				$("#note_"+i).removeAttr("disabled");

			}else{
				$("#status_"+i).attr("value",${CHECK_WORK_STATUS_QQ});
				document.getElementById("statusImg_"+i).src="images/success_2.png";
				
				$("#workerUuid_"+i).attr("disabled","disabled");
				$("#workerName_"+i).attr("disabled","disabled");
				$("#sequenceNo_"+i).attr("disabled","disabled");
				//$("#status_"+i).attr("disabled","disabled");
				$("#time_"+i).attr("disabled","disabled");
				$("#score_"+i).attr("disabled","disabled");
				$("#wages_"+i).attr("disabled","disabled");
				$("#lendMoney_"+i).attr("disabled","disabled");
				$("#note_"+i).attr("disabled","disabled");
				
			}

			collectTotal();
		}
	<c:if test="${empty workCollect.uuid}">
		$(function(){
			collectTotal();
		});
	</c:if>
	  <c:if test="${!empty workCollect.uuid}">
   			$(function(){
   	   			$("#date").val("${workCollect.date}");
   	   			$("#workerNum").val(${workCollect.workerNum});
   	   			$("#total").val("<fmt:formatNumber type="number" value="${workCollect.wages+workCollect.lendMoney+workCollect.other}" pattern="0.00" maxFractionDigits="2"/>");
   	   			$("#total_wages").val("<fmt:formatNumber type="number" value="${workCollect.wages}" pattern="0.00" maxFractionDigits="2"/>");
   	   			$("#total_lendMoney").val("<fmt:formatNumber type="number" value="${workCollect.lendMoney}" pattern="0.00" maxFractionDigits="2"/>");
   	 			$("#total_other").val("<fmt:formatNumber type="number" value="${workCollect.other}" pattern="0.00" maxFractionDigits="2"/>");
   	 			$("#delBtn").show();
   	 			$("#delBtn1").show();
   	   		});


   			//删除一条记录
   			function delConfirmClick(){
   				Ewin.confirm({message:"<em>确定要删除吗？</em>"}).on(function(e){
   					if(!e){
   						return;
   					}
   					$.ajax({
   						url:'<%=basePath%>workCollect/delete.shtml',
   						type:'POST',
   						data:{"uuid":"${workCollect.uuid}"},
   						dataType:'JSON',
   						success:function(json){
   							if(json.success){
   								Ewin.alert({ message: "<em>删除成功！</em>" }).on(function (e) {
   									window.location.href="<%=basePath %>workCollect/index.shtml";
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
   			
	   </c:if>

	   //切换日期
	   function updDate(){
		   var date = $("#date").val();
		   if($.trim(date)!=""){
			   window.location.href="<%=basePath %>workCollect/addPage.shtml?date="+date+"&time="+new Date().getTime();
		   }
	   }

	   //返回
	   function back(){
			window.location.href="<%=basePath %>workCollect/index.shtml?time="+new Date().getTime();
	   }
		   

	</script>					    
	</body>
</html>
