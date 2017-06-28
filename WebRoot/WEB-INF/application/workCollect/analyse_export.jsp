<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@page import="com.hnzskj.common.util.date.DateUtil"%>
<%@page import="com.hnzskj.checkwork.model.WorkCollect"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String year =null;
String month = null;
if(null==request.getAttribute("year")){
	year = DateUtil.getCurrentYear();
}else{
	year = request.getAttribute("year").toString();
}
if(null==request.getAttribute("month")){
	month = DateUtil.getCurrentMonth().toString();
}else{
	month = (String)request.getAttribute("month").toString();
}

request.setAttribute("year",year);
request.setAttribute("month",month);

String fileName = year+"年"+month+"月份考勤信息";
response.setContentType("application/x-download;chartset=utf-8");
response.setHeader("Content-Disposition", "attachment;filename="
		+ java.net.URLEncoder.encode(fileName + ".xls", "utf-8"));


%>

<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="ProgId" content="Excel.Sheet"/>
  <meta name="Generator" content="WPS Office ET"/>
  <!--[if gte mso 9]>
   <xml>
    <o:DocumentProperties>
     <o:Author>hnzswqc</o:Author>
     <o:Created>2017-06-08T10:41:26</o:Created>
     <o:LastSaved>2017-06-11T15:21:24</o:LastSaved>
     <o:Revision>1</o:Revision>
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
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font2
	{color:windowtext;
	font-size:12.0pt;
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
	mso-font-charset:134;}
.font4
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font5
	{color:#7F7F7F;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font6
	{color:#800080;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font7
	{color:#9C0006;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font8
	{color:#006100;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font9
	{color:#3F3F3F;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font10
	{color:#44546A;
	font-size:15.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font11
	{color:#000000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font12
	{color:#44546A;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font13
	{color:#44546A;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font14
	{color:#0000FF;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font15
	{color:#44546A;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font16
	{color:#FF0000;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font17
	{color:#3F3F76;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font18
	{color:#FFFFFF;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font19
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font20
	{color:#9C6500;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font21
	{color:#000000;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font22
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"宋体";
	mso-generic-font-family:auto;
	mso-font-charset:134;}
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
	mso-style-name:"强调文字颜色 2";}
.style44
	{color:#FA7D00;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	mso-font-charset:134;
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
	text-align:center;
	font-size:16.0pt;
	font-weight:700;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	mso-number-format:"\@";
	mso-font-charset:134;}
.xl67
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-weight:700;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-size:16.0pt;
	font-weight:700;
	mso-font-charset:134;
	border-left:.5pt solid windowtext;
	border-top:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-size:16.0pt;
	font-weight:700;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-size:16.0pt;
	font-weight:700;
	mso-font-charset:134;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	text-align:center;
	font-weight:700;
	mso-font-charset:134;
	border:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	font-weight:700;
	mso-font-charset:134;}
.xl74
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	mso-font-charset:134;}
 -->  </style>
  <!--[if gte mso 9]>
   <xml>
    <x:ExcelWorkbook>
     <x:ExcelWorksheets>
      <x:ExcelWorksheet>
       <x:Name>Sheet2</x:Name>
       <x:WorksheetOptions>
        <x:DefaultRowHeight>285</x:DefaultRowHeight>
        <x:Selected/>
        <x:Panes>
         <x:Pane>
          <x:Number>3</x:Number>
          <x:ActiveCol>5</x:ActiveCol>
          <x:ActiveRow>3</x:ActiveRow>
          <x:RangeSelection>F4</x:RangeSelection>
         </x:Pane>
        </x:Panes>
        <x:ProtectContents>False</x:ProtectContents>
        <x:ProtectObjects>False</x:ProtectObjects>
        <x:ProtectScenarios>False</x:ProtectScenarios>
        <x:PageBreakZoom>100</x:PageBreakZoom>
        <x:Print>
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
 <body link="blue" vlink="purple">
  <table width="735" border="0" cellpadding="0" cellspacing="0" style='width:546.75pt;border-collapse:collapse;table-layout:fixed;'>
   <col width="83" style='mso-width-source:userset;mso-width-alt:2656;'/>
   <col width="126" style='mso-width-source:userset;mso-width-alt:4032;'/>
   <col width="128" style='mso-width-source:userset;mso-width-alt:4096;'/>
   <col width="165" style='mso-width-source:userset;mso-width-alt:5280;'/>
   <col width="115" style='mso-width-source:userset;mso-width-alt:3680;'/>
   <col width="112" style='mso-width-source:userset;mso-width-alt:3584;'/>
   <col width="115" style='mso-width-source:userset;mso-width-alt:3680;'/>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl65" height="44" width="502" colspan="7" style='height:33.00pt;width:376.50pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${year }年${month }月份工资统计表</td>
    <td class="xl66" width="115" style='width:86.25pt;'></td>
    <td class="xl66" width="112" style='width:84.00pt;'></td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl67" height="44" style='height:33.00pt;' x:str>序号</td>
    <td class="xl67" x:str>姓名</td>
    <td class="xl67" x:str>出勤次数</td>
    <td class="xl67" x:str>评优次数</td>
    <td class="xl67" x:str>工资总数</td>
    <td class="xl67" x:str>借款总数</td>
    <td class="xl67" x:str>实际工资</td>
  
   </tr>
   <c:set var="total_count" value="0"></c:set>
   <c:set var="total_score" value="0"></c:set>
   <c:set var="total_wages" value="0"></c:set>
   <c:set var="total_lendMoney" value="0"></c:set>
   <c:set var="total_wages_sj" value="0"></c:set>
   <c:forEach items="${list1}" var="w1" varStatus="i1">
   		<tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
		    <td class="xl68" height="44" style='height:33.00pt;' x:str>${i1.index+1 }</td>
		    <td class="xl68" x:str>${w1.workerName }</td>
		    <td class="xl68" x:str>${w1.count}</td>
		    <td class="xl68" x:str>${w1.score }</td>
		    <td class="xl68" x:str>
		    	<c:if test="${w1.wages>0}">
		    		<fmt:formatNumber type="number" value="${w1.wages}" pattern="0.00" maxFractionDigits="2"/>
	    		</c:if>
		    </td>
	   		<td class="xl68" x:str>
	   			<c:if test="${w1.lendMoney>0}">
	   				<fmt:formatNumber type="number" value="${w1.lendMoney}" pattern="0.00" maxFractionDigits="2"/>
   				</c:if>
	   		</td>
	    	<td class="xl68" x:str>
	    		<c:if test="${w1.wages-w1.lendMoney!=0}">
	    			<fmt:formatNumber type="number" value="${w1.wages-w1.lendMoney }" pattern="0.00" maxFractionDigits="2"/>
	    		</c:if>
	    	</td>
	    	
	    	 <c:set var="total_count" value="${total_count+w1.count}"></c:set>
			 <c:set var="total_score" value="${total_score+w1.score}"></c:set>
			 <c:set var="total_wages" value="${total_wages+w1.wages}"></c:set>
		     <c:set var="total_lendMoney" value="${total_lendMoney+w1.lendMoney}"></c:set>
		     <c:set var="total_wages_sj" value="${total_wages_sj+(w1.wages-w1.lendMoney)}"></c:set>
       
		   </tr>
   </c:forEach>
   
    <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
	    <td class="xl69" height="44" colspan="2" style='height:33.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>汇总</td>
	    <td class="xl68" x:str>${total_count }</td>
	    <td class="xl68" x:str>${total_score }</td>
	    <td class="xl68" x:str>
	    	<c:if test="${total_wages>0}">
	    		<fmt:formatNumber type="number" value="${total_wages}" pattern="0.00" maxFractionDigits="2"/>
	    	</c:if>
	    </td>
	    <td class="xl68" x:str>
	    	<c:if test="${total_lendMoney>0}">
	    		<fmt:formatNumber type="number" value="${total_lendMoney}" pattern="0.00" maxFractionDigits="2"/>
    		</c:if>
	    </td>
	    <td class="xl68" x:str>
	    	<c:if test="${total_wages_sj>0}">
	    		<fmt:formatNumber type="number" value="${total_wages_sj }" pattern="0.00" maxFractionDigits="2"/>
	    	</c:if>
	   	</td>
	    <td colspan="2" style='mso-ignore:colspan;'></td>
	   </tr>
  
  
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl66" height="44" colspan="6" style='height:33.00pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl65" height="44" colspan="4" style='height:33.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>2017年6月份杂项支出分类汇总统计（单位：元）</td>
    <td class="xl66" colspan="2" style='mso-ignore:colspan;'></td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl68" height="44" style='height:33.00pt;' x:str>序号</td>
    <td class="xl68" x:str>类别</td>
    <td class="xl68" x:str>金额</td>
    <td class="xl68" x:str>占比</td>
    <td class="xl66" colspan="2" style='mso-ignore:colspan;'></td>
   </tr>
   <c:forEach items="${list2}" var="w2" varStatus="i2">
	   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
	    <td class="xl68" height="44" style='height:33.00pt;' x:str>${i2.index+1 }</td>
	    <td class="xl68" x:str>${w2.workTypeName }</td>
	    <td class="xl68" x:str>
	    	<c:if test="${w2.cost>0}">
	    		<fmt:formatNumber type="number" value="${w2.cost}" pattern="0.00" maxFractionDigits="2"/>
    		</c:if>
    	</td>
	    <td class="xl68" x:str>
	    	<c:if test="${w2.cost/w2.money>0}">
	    		<fmt:formatNumber type="percent" value="${w2.cost/w2.money}" maxFractionDigits="2"/>
	    	</c:if>
	    	</td>
	    <td class="xl66" colspan="2" style='mso-ignore:colspan;'></td>
	   </tr>
   </c:forEach>
   
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl66" height="44" colspan="6" style='height:33.00pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl69" height="44" colspan="6" style='height:33.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>2017年6月份每天费用支出统计表（单位：元）</td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl72" height="44" style='height:33.00pt;' x:str>序号</td>
    <td class="xl72" x:str>日期</td>
    <td class="xl72" x:str>工资总支出</td>
    <td class="xl72" x:str>借款总支出</td>
    <td class="xl72" x:str>杂项总支出</td>
    <td class="xl72" x:str>总支出</td>
   </tr>
   <c:forEach items="${list3}" var="w3" varStatus="i3">
	   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
	    <td class="xl68" height="44" style='height:33.00pt;' x:str>${i3.index+1 }</td>
	    <td class="xl68" x:str>${w3.date}</td>
	    <td class="xl68" x:str><fmt:formatNumber type="number" value="${w3.wages}" pattern="0.00" maxFractionDigits="2"/></td>
	    <td class="xl68" x:str>
	    <c:if test="${w3.lendMoney>0}">
	    	<fmt:formatNumber type="number" value="${w3.lendMoney}" pattern="0.00" maxFractionDigits="2"/>
	    </c:if>
	    </td>
	    <td class="xl68" x:str>
    		<c:if test="${w3.other>0}">
	    		<fmt:formatNumber type="number" value="${w3.other }" pattern="0.00" maxFractionDigits="2"/>
	    	</c:if>		
	   	</td>
	    <td class="xl68" x:str>
	     <c:if test="${w3.wages+w3.lendMoney+w3.other>0}">
		    <fmt:formatNumber type="number" value="${w3.wages+w3.lendMoney+w3.other }" pattern="0.00" maxFractionDigits="2"/></td>
	    </c:if>
	   </tr>
   </c:forEach>
   
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl66" height="44" colspan="6" style='height:33.00pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl69" height="44" colspan="6" style='height:33.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>2017年每月总费用支出统计（单位：元）</td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl72" height="44" style='height:33.00pt;' x:str>序号</td>
    <td class="xl72" x:str>月份</td>
    <td class="xl72" x:str>工资总支出</td>
    <td class="xl72" x:str>借款总支出</td>
    <td class="xl72" x:str>杂项总支出</td>
    <td class="xl72" x:str>总支出</td>
   </tr>
   <c:forEach items="${list4}" var="w4" varStatus="i4">
	   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
	    <td class="xl68" height="44" style='height:33.00pt;' x:str>${i4.index+1 }</td>
	    <td class="xl68" x:str>${w4.month }月份</td>
	      <td class="xl68" x:str><fmt:formatNumber type="number" value="${w4.wages}" pattern="0.00" maxFractionDigits="2"/></td>
	    <td class="xl68" x:str>
	    	<c:if test="${w4.lendMoney>0}">
	    		<fmt:formatNumber type="number" value="${w4.lendMoney}" pattern="0.00" maxFractionDigits="2"/>
	    	</c:if>
	    </td>
	    <td class="xl68" x:str>
	    	<c:if test="${w4.other>0}">
	    		<fmt:formatNumber type="number" value="${w4.other }" pattern="0.00" maxFractionDigits="2"/>
	    	</c:if>
	    	</td>
   		<td class="xl68" x:str>
		    <c:if test="${w4.wages+w4.lendMoney+w4.other>0}">
		   	 <fmt:formatNumber type="number" value="${w4.wages+w4.lendMoney+w4.other }" pattern="0.00" maxFractionDigits="2"/>
		    </c:if>
	   </td>
	   </tr>
   </c:forEach>
   
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl66" height="44" colspan="6" style='height:33.00pt;mso-ignore:colspan;'></td>
   </tr>
   <tr height="44" style='height:33.00pt;mso-height-source:userset;mso-height-alt:660;'>
    <td class="xl73" height="44" style='height:33.00pt;' x:str>制表人</td>
    <td class="xl74" x:str>${SESSION_USER_KEY.userName }</td>
    <td class="xl73" x:str>制表日期</td>
    <td class="xl74" colspan="2" style='border-right:none;border-bottom:none;' x:str>${workCollect.currentTime }</td>
    <td></td>
   </tr>
   <![if supportMisalignedColumns]>
    <tr width="0" style='display:none;'>
     <td width="83" style='width:62;'></td>
     <td width="126" style='width:95;'></td>
     <td width="128" style='width:96;'></td>
     <td width="165" style='width:124;'></td>
     <td width="115" style='width:86;'></td>
     <td width="112" style='width:84;'></td>
    </tr>
   <![endif]>
  </table>
 </body>
</html>
