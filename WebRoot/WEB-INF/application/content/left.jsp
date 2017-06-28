<!--<%=request.getRequestURI() %>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hnzskj.common.util.constant.Constant"%>
<%@ include file="/common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>表格</title>
        <meta name="keywords" content="侧边导航菜单(可分组折叠)">
        <meta name="description" content="侧边导航菜单(可分组折叠)" />
        <meta name="HandheldFriendly" content="True" />
        <link rel="shortcut icon" href="img/favicon.ico">

        <style>
            .panel-group{max-height:770px;overflow: auto;}
            .leftMenu{margin:0px;width: 100%}
            .panel-group .panel + .panel{margin-top: 1px!important}
            .leftMenu .panel-heading{font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
            .leftMenu .panel-heading span{position:absolute;right:10px;top:12px;}
            .leftMenu .menu-item-left{padding: 2px; background: transparent; border:1px solid transparent;border-radius: 6px;}
            .leftMenu .menu-item-left:hover{background:#C4E3F3;border:1px solid #1E90FF;}
            .funcabar{
			    height: 100%;
			    background: #F9F9F7;
			    border-right: 1px solid #DDD;
			    position: relative;
			    margin-left: 0px;
			}
        </style>
        <%@ include file="/common/bootstrap.jsp"%>
    </head>

    <body style="margin: 0px;overflow-Y:auto;">
    <div class="funcabar">
        <div class="row">
            <div class="col-md-2" style="border: 1px;">
            
                <div class="panel-group table-responsive" role="tablist" id="accordion">
                    <div class="panel panel-primary leftMenu">
                        <!-- 利用data-target指定要折叠的分组列表 -->
                        <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" data-parent="#accordion" role="tab" >
                            <h4 class="panel-title">
                                分组1
                                <span class="glyphicon glyphicon-chevron-up right"></span>
                            </h4>
                        </div>
                        <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                        <div id="collapseListGroup1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
                           <script type="text/javascript">
								var b = new dTree('b');
								 b.config.useCookies=false;
								 b.config.folderLinks=false;
								 b.config.target = "right";
								 b.add("00000000-0000-0000-0000-000000000000","-1","根目录","javascript:getDataC('00000000-0000-0000-0000-000000000000','项目资料树');","","");		
								 b.add("00000000","00000000-0000-0000-0000-000000000000","一级菜单","project!showProject.action?project.proId=${proId}","","");
								 b.add("00000001","00000000","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 b.add("00000003","00000000","一级菜单","project!showProject.action?project.proId=${proId}","","");
								 b.add("00000004","00000003","二级菜单","project!showProject.action?project.proId=${proId}","","");
							     document.write(b);
							     b.openAll();
							</script>
                        </div>
                    </div><!--panel end-->
                    <div class="panel panel-primary leftMenu">
                        <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup2" data-parent="#accordion" role="tab" >
                            <h4 class="panel-title">
                               		 分组2
                                <span class="glyphicon glyphicon-chevron-down right"></span>
                            </h4>
                        </div>
                        <div id="collapseListGroup2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2" style="overflow:auto; ">
                           <script type="text/javascript">
								var a = new dTree('a');
								 a.config.useCookies=false;
								 a.config.folderLinks=false;
								 a.config.target = "right";
								 a.add("00000000-0000-0000-0000-000000000000","-1","根目录","javascript:getDataC('00000000-0000-0000-0000-000000000000','项目资料树');","","");		
								 a.add("00000000","00000000-0000-0000-0000-000000000000","一级菜单","project!showProject.action?project.proId=${proId}","","");
								 a.add("00000001","00000000","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 a.add("00000003","00000000","一级菜单","project!showProject.action?project.proId=${proId}","","");
								 a.add("00000004","00000003","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 a.add("00000005","00000003","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 a.add("00000006","00000003","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 a.add("00000007","00000003","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 a.add("00000008","00000003","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 document.write(a);
							     a.openAll();
							</script>
                        </div>
                    </div>  
                    
                     <div class="panel panel-primary leftMenu">
                        <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" data-parent="#accordion" role="tab" >
                            <h4 class="panel-title">
                                分组2
                                <span class="glyphicon glyphicon-chevron-down right"></span>
                            </h4>
                        </div>
                        <div id="collapseListGroup3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading3" >
                        
                        	<script type="text/javascript">
								var c = new dTree('c');
								 c.config.useCookies=false;
								 c.config.folderLinks=false;
								 c.config.target = "right";
								 c.add("00000000-0000-0000-0000-000000000000","-1","根目录","javascript:getDataC('00000000-0000-0000-0000-000000000000','项目资料树');","","");		
								 c.add("00000000","00000000-0000-0000-0000-000000000000","一级菜单","project!showProject.action?project.proId=${proId}","","");
								 c.add("00000001","00000000","二级菜单","project!showProject.action?project.proId=${proId}","","");
								 c.add("00000003","00000000","一级菜单","project!showProject.action?project.proId=${proId}","","");
								 c.add("00000004","00000003","二级菜单","project!showProject.action?project.proId=${proId}","","");
							     document.write(c);
							     c.openAll();
							</script>
                        </div>
                    </div>  
                    
                    
                </div>
            </div>
            <div class="col-md-10">
            </div>
        </div>
        <script>
        $(function(){
            $(".panel-heading").click(function(e){
                /*切换折叠指示图标*/
                $(this).find("span").toggleClass("glyphicon-chevron-down");
                $(this).find("span").toggleClass("glyphicon-chevron-up");
            });
        });
    	
        </script>
       </div>
   </body>

</html>