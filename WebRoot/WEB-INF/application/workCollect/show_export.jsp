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

String date = (String)request.getAttribute("date");

String fileName = date+"考勤信息";
response.setContentType("application/x-download;chartset=utf-8");
response.setHeader("Content-Disposition", "attachment;filename="
		+ java.net.URLEncoder.encode(fileName + ".xls", "utf-8"));


%>

<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
 <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <!--[if gte mso 9]>
   <xml>
    <o:DocumentProperties>
     <o:Author>hnzswqc</o:Author>
     <o:Created>2017-06-08T10:41:26</o:Created>
     <o:LastSaved>2017-06-08T10:56:42</o:LastSaved>
    </o:DocumentProperties>
    <o:CustomDocumentProperties>
     <o:KSOProductBuildVer dt:dt="string">2052-10.1.0.6490</o:KSOProductBuildVer>
    </o:CustomDocumentProperties>
   </xml>
  <![endif]-->
  <style>
<!-- @page
	{margin:0.98in 0.75in 0.98in 0.75in;
	mso-header-margin:0.51in;
	mso-footer-margin:0.51in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.font0
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font1
	{color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font2
	{color:windowtext;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font3
	{color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font4
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font5
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font6
	{color:#3F3F3F;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font7
	{color:#44546A;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font8
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font9
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font10
	{color:#9C0006;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font11
	{color:#9C6500;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font12
	{color:#44546A;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font13
	{color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font14
	{color:#44546A;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font15
	{color:#44546A;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font16
	{color:#0000FF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font17
	{color:#000000;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font18
	{color:#3F3F76;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font19
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font20
	{color:#7F7F7F;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font21
	{color:#800080;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font22
	{color:#006100;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.style0
	{mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"常规";
	mso-style-id:0;}
.style16
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0_ \;_ \0022\00A5\0022* \\-\#\,\#\#0_ \;_ \0022\00A5\0022* \0022-\0022_ \;_ \@_ ";
	mso-style-name:"货币[0]";
	mso-style-id:7;}
.style17
	{mso-pattern:auto none;
	background:#EDEDED;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 3";}
.style18
	{mso-pattern:auto none;
	background:#FFCC99;
	color:#3F3F76;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:.5pt solid #7F7F7F;
	mso-style-name:"输入";}
.style19
	{mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0\.00_ \;_ \0022\00A5\0022* \\-\#\,\#\#0\.00_ \;_ \0022\00A5\0022* \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"货币";
	mso-style-id:4;}
.style20
	{mso-number-format:"_ * \#\,\#\#0_ \;_ * \\-\#\,\#\#0_ \;_ * \0022-\0022_ \;_ \@_ ";
	mso-style-name:"千位分隔[0]";
	mso-style-id:6;}
.style21
	{mso-pattern:auto none;
	background:#DBDBDB;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 3";}
.style22
	{mso-pattern:auto none;
	background:#FFC7CE;
	color:#9C0006;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"差";}
.style23
	{mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
	mso-style-name:"千位分隔";
	mso-style-id:3;}
.style24
	{mso-pattern:auto none;
	background:#C9C9C9;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 3";}
.style25
	{color:#0000FF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"超链接";
	mso-style-id:8;}
.style26
	{mso-number-format:"0%";
	mso-style-name:"百分比";
	mso-style-id:5;}
.style27
	{color:#800080;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"已访问的超链接";
	mso-style-id:9;}
.style28
	{mso-pattern:auto none;
	background:#FFFFCC;
	border:.5pt solid #B2B2B2;
	mso-style-name:"注释";}
.style29
	{mso-pattern:auto none;
	background:#F4B084;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 2";}
.style30
	{color:#44546A;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-style-name:"标题 4";}
.style31
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"警告文本";}
.style32
	{color:#44546A;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-style-name:"标题";}
.style33
	{color:#7F7F7F;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"解释性文本";}
.style34
	{color:#44546A;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border-bottom:1.0pt solid #5B9BD5;
	mso-style-name:"标题 1";}
.style35
	{color:#44546A;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border-bottom:1.0pt solid #5B9BD5;
	mso-style-name:"标题 2";}
.style36
	{mso-pattern:auto none;
	background:#9BC2E6;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 1";}
.style37
	{color:#44546A;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border-bottom:1.0pt solid #ACCCEA;
	mso-style-name:"标题 3";}
.style38
	{mso-pattern:auto none;
	background:#FFD966;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 4";}
.style39
	{mso-pattern:auto none;
	background:#F2F2F2;
	color:#3F3F3F;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:.5pt solid #3F3F3F;
	mso-style-name:"输出";}
.style40
	{mso-pattern:auto none;
	background:#F2F2F2;
	color:#FA7D00;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:.5pt solid #7F7F7F;
	mso-style-name:"计算";}
.style41
	{mso-pattern:auto none;
	background:#A5A5A5;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:2.0pt double #3F3F3F;
	mso-style-name:"检查单元格";}
.style42
	{mso-pattern:auto none;
	background:#E2EFDA;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 6";}
.style43
	{mso-pattern:auto none;
	background:#ED7D31;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 2";}
.style44
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border-bottom:2.0pt double #FF8001;
	mso-style-name:"链接单元格";}
.style45
	{color:#000000;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border-top:.5pt solid #5B9BD5;
	border-bottom:2.0pt double #5B9BD5;
	mso-style-name:"汇总";}
.style46
	{mso-pattern:auto none;
	background:#C6EFCE;
	color:#006100;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"好";}
.style47
	{mso-pattern:auto none;
	background:#FFEB9C;
	color:#9C6500;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"适中";}
.style48
	{mso-pattern:auto none;
	background:#D9E1F2;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 5";}
.style49
	{mso-pattern:auto none;
	background:#5B9BD5;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 1";}
.style50
	{mso-pattern:auto none;
	background:#DDEBF7;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 1";}
.style51
	{mso-pattern:auto none;
	background:#BDD7EE;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 1";}
.style52
	{mso-pattern:auto none;
	background:#FCE4D6;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 2";}
.style53
	{mso-pattern:auto none;
	background:#F8CBAD;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 2";}
.style54
	{mso-pattern:auto none;
	background:#A5A5A5;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 3";}
.style55
	{mso-pattern:auto none;
	background:#FFC000;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 4";}
.style56
	{mso-pattern:auto none;
	background:#FFF2CC;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"20% - 强调文字颜色 4";}
.style57
	{mso-pattern:auto none;
	background:#FFE699;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 4";}
.style58
	{mso-pattern:auto none;
	background:#4472C4;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 5";}
.style59
	{mso-pattern:auto none;
	background:#B4C6E7;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 5";}
.style60
	{mso-pattern:auto none;
	background:#8EA9DB;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 5";}
.style61
	{mso-pattern:auto none;
	background:#70AD47;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"强调文字颜色 6";}
.style62
	{mso-pattern:auto none;
	background:#C6E0B4;
	color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"40% - 强调文字颜色 6";}
.style63
	{mso-pattern:auto none;
	background:#A9D08E;
	color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:"60% - 强调文字颜色 6";}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	mso-number-format:"General";
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-pattern:auto;
	mso-background-source:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;}
.xl65
	{mso-style-parent:style0;
	mso-number-format:"\@";
	font-weight:700;
	mso-font-charset:134;}
.xl66
	{mso-style-parent:style0;
	mso-number-format:"\@";
	mso-font-charset:134;}
.xl67
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-size:16.0pt;
	font-weight:700;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-size:16.0pt;
	font-weight:700;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-weight:700;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-right:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-weight:700;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-weight:700;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-weight:700;
	mso-font-charset:134;}
.xl80
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;}
.xl81
	{mso-style-parent:style0;
	mso-number-format:"\@";
	font-weight:700;
	mso-font-charset:134;}
.xl82
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-weight:700;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
 -->  </style>
  <!--[if gte mso 9]>
   <xml>
    <x:ExcelWorkbook>
     <x:ExcelWorksheets>
      <x:ExcelWorksheet>
       <x:Name>Sheet1</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>285</x:DefaultRowHeight>
        <x:Selected/>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>4</x:ActiveCol>
          <x:ActiveRow>6</x:ActiveRow>
          <x:RangeSelection>E7</x:RangeSelection>
         </x:Pane>
        </x:Panes>
        <x:ProtectContents>False</x:ProtectContents>
        <x:ProtectObjects>False</x:ProtectObjects>
        <x:ProtectScenarios>False</x:ProtectScenarios>
        <x:PageBreakZoom>100</x:PageBreakZoom>
        <x:Print>
         <x:ValidPrinterInfo/>
         <x:PaperSizeIndex>9</x:PaperSizeIndex>
        </x:Print>
       </x:WorksheetOptions>
      </x:ExcelWorksheet>
     </x:ExcelWorksheets>
     <x:ProtectStructure>False</x:ProtectStructure>
     <x:ProtectWindows>False</x:ProtectWindows>
     <x:WindowHeight>8370</x:WindowHeight>
     <x:WindowWidth>20385</x:WindowWidth>
    </x:ExcelWorkbook>
    <x:SupBook>
     <x:Path>C:\Users\hnzswqc\Desktop\</x:Path>
    </x:SupBook>
   </xml>
  <![endif]-->
 </head>
 <body link="blue" vlink="purple" class="xl66">
  <table width="1311" border="0" cellpadding="0" cellspacing="0" style='width:983.25pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="91" class="xl66" style='mso-width-source:userset;mso-width-alt:2912;'/>
   <col width="98" class="xl66" style='mso-width-source:userset;mso-width-alt:3136;'/>
   <col width="91" span="4" class="xl66" style='mso-width-source:userset;mso-width-alt:2912;'/>
   <col width="101" class="xl66" style='mso-width-source:userset;mso-width-alt:3232;'/>
   <col width="172" class="xl66" style='mso-width-source:userset;mso-width-alt:5504;'/>
   <col width="181" class="xl66" style='mso-width-source:userset;mso-width-alt:5792;'/>
   <col width="91" class="xl66" style='mso-width-source:userset;mso-width-alt:2912;'/>
   <col width="122" class="xl66" style='mso-width-source:userset;mso-width-alt:3904;'/>
   <col width="91" span="245" class="xl66" style='mso-width-source:userset;mso-width-alt:2912;'/>
   <tr height="34.67" style='height:26.00pt;mso-height-source:userset;mso-height-alt:520;'>
    <td class="xl67" height="34.67" width="1311" colspan="12" style='height:26.00pt;width:983.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>汇总信息(单位：元)</td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl69" height="44" style='height:33.00pt;' x:str>考勤时间</td>
    <td class="xl70" x:str>${workCollect.date}</td>
    <td class="xl69" x:str>考勤人数</td>
    <td class="xl71" x:str>${workCollect.workerNum}</td>
    <td class="xl69" x:str>总支出</td>
    <td class="xl71" x:str><fmt:formatNumber type="number" value="${workCollect.wages+workCollect.lendMoney+workCollect.other}" pattern="0.00" maxFractionDigits="2"/></td>
    <td class="xl69" x:str>工资总支出</td>
    <td class="xl71" x:str><fmt:formatNumber type="number" value="${workCollect.wages}" pattern="0.00" maxFractionDigits="2"/></td>
    <td class="xl69" x:str>借款总支出</td>
    <td class="xl71" x:str><fmt:formatNumber type="number" value="${workCollect.lendMoney}" pattern="0.00" maxFractionDigits="2"/></td>
    <td class="xl69" x:str>杂项总支出</td>
    <td class="xl71" x:str><fmt:formatNumber type="number" value="${workCollect.other}" pattern="0.00" maxFractionDigits="2"/></td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl66" height="19" colspan="12" style='height:14.25pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl66" height="19" colspan="12" style='height:14.25pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="58.67" style='height:44.00pt;mso-height-source:userset;mso-height-alt:880;'>
    <td class="xl67" height="58.67" colspan="12" style='height:44.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>考勤管理</td>
   </tr>
   <tr height="41.33" style='height:31.00pt;mso-height-source:userset;mso-height-alt:620;'>
    <td class="xl69" height="41.33" style='height:31.00pt;' x:str>序号</td>
    <td class="xl69" x:str>姓名</td>
    <td class="xl69" x:str>工种</td>
    <td class="xl69" x:str>时间</td>
    <td class="xl69" x:str>考勤</td>
    <td class="xl69" x:str>评分</td>
    <td class="xl69" x:str>工资（元）</td>
    <td class="xl69" x:str>借款（元）</td>
    <td class="xl69" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>备注</td>
   </tr>
   
 	<c:forEach items="${list}" var="worker" varStatus="i">
 		 <tr height="41.33" style='height:31.00pt;mso-height-source:userset;mso-height-alt:620;'>
		    <td class="xl72" height="124" rowspan="3" style='height:93.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${i.index+1}</td>
		    <td class="xl72" rowspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${worker.name}</td>
		    <td class="xl72" rowspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${worker.workTypeName}</td>
		    <c:set value="${fu:findCheckWorkList(date,worker)}" var="checkWorkList"></c:set>
		    <c:if test="${!empty checkWorkList}">
			    <c:forEach items="${checkWorkList}" var = "cw" varStatus="j">
					<c:set value="${j.index}" var="l"></c:set>
					 	 <td class="xl71" x:str>
					 	 	<c:choose>
								<c:when test="${cw.time == CHECK_WORK_TIME_MORNING}">上午</c:when>
								<c:when test="${cw.time == CHECK_WORK_TIME_AFTERNOON}">下午</c:when>
								<c:when test="${cw.time == CHECK_WORK_TIME_NIGHT}">晚班</c:when>
								<c:otherwise>未知</c:otherwise>
							</c:choose>
					 	 </td>
					    <td class="xl71" x:str>
					    	<c:if test="${cw.status == CHECK_WORK_STATUS_CQ}">是</c:if>
					    	<c:if test="${cw.status == CHECK_WORK_STATUS_QQ}">否</c:if>
					    </td>
			   		 <td class="xl71" x:str>
			   		 		<c:choose>
								<c:when test="${cw.score == 1}">优</c:when>
								<c:when test="${cw.score == 2}">良</c:when>
								<c:when test="${cw.score == 3}">中</c:when>
								<c:when test="${cw.score == 4}">差</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
			   		 </td>
					    <td class="xl71" x:str><fmt:formatNumber type="number" value="${cw.wages }" pattern="0.00" maxFractionDigits="2"/></td>
					    <td class="xl71" x:str><fmt:formatNumber type="number" value="${cw.lendMoney }" pattern="0.00" maxFractionDigits="2"/></td>
					    <td class="xl71" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${cw.note}</td>
					<c:if test="${!j.last}">
					 	</tr>
			 		 	<tr height="41.33" style='height:31.00pt;mso-height-source:userset;mso-height-alt:620;'>
					</c:if>
					<c:if test="${j.last}">
					 	</tr>
					</c:if>
				</c:forEach>					
			  </c:if>
			   <c:if test="${empty checkWorkList}">
				   			<td class="xl71" x:str>
						 	 	上午
						 	 </td>
						    <td class="xl71" x:str>
						    	否
						    </td>
						    <td class="xl71" x:str></td>
						    <td class="xl71" x:str><fmt:formatNumber type="number" value="" pattern="0.00" maxFractionDigits="2"/></td>
						    <td class="xl71" x:str><fmt:formatNumber type="number" value="" pattern="0.00" maxFractionDigits="2"/></td>
						    <td class="xl71" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
					 	</tr>
			 		 	<tr height="41.33" style='height:31.00pt;mso-height-source:userset;mso-height-alt:620;'>
			 		 		<td class="xl71" x:str>
						 	 	下午
						 	 </td>
						    <td class="xl71" x:str>
						    	否
						    </td>
						    <td class="xl71" x:str></td>
						    <td class="xl71" x:str><fmt:formatNumber type="number" value="" pattern="0.00" maxFractionDigits="2"/></td>
						    <td class="xl71" x:str><fmt:formatNumber type="number" value="" pattern="0.00" maxFractionDigits="2"/></td>
						    <td class="xl71" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
					 	</tr>
			 		   <tr height="41.33" style='height:31.00pt;mso-height-source:userset;mso-height-alt:620;'>
			 		 		<td class="xl71" x:str>
						 	 	晚班
						 	 </td>
						    <td class="xl71" x:str>
						    	否
						    </td>
						    <td class="xl71" x:str></td>
						    <td class="xl71" x:str><fmt:formatNumber type="number" value="" pattern="0.00" maxFractionDigits="2"/></td>
						    <td class="xl71" x:str><fmt:formatNumber type="number" value="" pattern="0.00" maxFractionDigits="2"/></td>
						    <td class="xl71" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str></td>
					 	</tr>
			   
			   
			   </c:if>
 	</c:forEach>
 	
 	
   <tr height="19" style='height:14.25pt;'>
    <td class="xl66" height="19" colspan="12" style='height:14.25pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl66" height="19" colspan="12" style='height:14.25pt;mso-ignore:colspan;'></td>
   </tr>
   
   
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl67" height="44" colspan="12" style='height:33.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>杂项支出</td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl69" height="44" style='height:33.00pt;' x:str>序号</td>
    <td class="xl69" x:str>支出类别</td>
    <td class="xl69" x:str>金额</td>
    <td class="xl76" colspan="9" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>备注</td>
   </tr>
   <c:forEach items="${workCostList}" var="workCost" varStatus="i">
   		 <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
		    <td class="xl78" height="44" style='height:33.00pt;' x:str>${i.index+1 }</td>
		    <td class="xl78" x:str>${workCost.workTypeName }</td>
		    <td class="xl78" x:str><fmt:formatNumber type="number" value="${workCost.money }" pattern="0.00" maxFractionDigits="2"/></td>
		    <td class="xl78" colspan="9" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${workCost.note }</td>
	   </tr>
   </c:forEach>
  
  
   <tr height="19" style='height:14.25pt;'>
    <td class="xl66" height="19" colspan="12" style='height:14.25pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="19" style='height:14.25pt;'>
    <td class="xl66" height="19" colspan="12" style='height:14.25pt;mso-ignore:colspan;'></td>
   </tr>
   
   
   <tr height="32" class="xl65" style='height:24.00pt;mso-height-source:userset;mso-height-alt:480;'>
   	<td class="xl79" x:str>制表人</td>
    <td class="xl80" x:str>${SESSION_USER_KEY.userName }</td>
    <td class="xl79" height="32" style='height:24.00pt;' x:str>制表日期</td>
    <td class="xl80" colspan="2" style='border-right:none;border-bottom:none;' x:str>${workCollect.currentTime }</td>
    <td class="xl81" colspan="7" style='mso-ignore:colspan;'></td>
   </tr>
   <![if supportMisalignedColumns]>
    <tr width="0" style='display:none;'>
     <td width="91" style='width:68;'></td>
     <td width="98" style='width:74;'></td>
     <td width="91" style='width:68;'></td>
     <td width="101" style='width:76;'></td>
     <td width="172" style='width:129;'></td>
     <td width="181" style='width:136;'></td>
     <td width="91" style='width:68;'></td>
     <td width="122" style='width:92;'></td>
     <td width="91" style='width:68;'></td>
    </tr>
   <![endif]>
  </table>
 </body>
</html>

