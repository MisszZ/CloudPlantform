<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	HttpSession sesson = request.getSession();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人办公及分配--云平台自助服务系统</title>
<link type="text/css" href="<%=request.getContextPath()%>/user/css/base.css" rel="stylesheet">
<link type="text/css" href="<%=request.getContextPath()%>/user/css/office_cpt.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/office_cpt.js"></script>
<script src="<%=request.getContextPath()%>/user/js/jquery-2.1.3.min.js" type="text/javascript"></script>
</head>

<body>
	<div id='data'>
		<!--*************************************右上角********************************-->
		<div class="wel-user">
			<img src="<%=request.getContextPath()%>/user/images/agent%20-g.png">
		</div>
		<span>欢迎您 : <%=sesson.getAttribute("name")%>&nbsp;|</span><span><a
			href="<%=request.getContextPath()%>/userLogout.htm">注销登录&nbsp;</a> |</span><span><a
			href="<%=request.getContextPath()%>/modPwd.htm">修改密码</a> </span>
	</div>
	<div id="topic"><img src="<%=request.getContextPath()%>/user/images/n.jpg"></div>
	<div id="content">
		<div class="nav">
			<ul>
				<li class="small-icon" id="two"><a
					href="<%=request.getContextPath()%>/userApplyRes.htm">虚拟化资源申请</a></li>
				<li class="small-icon" id="three"><a
					href="<%=request.getContextPath()%>/userLookStatus.htm">资源申请的进度</a>
				</li>
				<li class="small-icon" id="four"><a
					href="<%=request.getContextPath()%>/lookResource.htm">已申请资源信息</a>
				</li>
				<li class="small-icon" id="five"><a
					href="<%=request.getContextPath()%>/lookAllRes.htm">虚拟化资源续期</a>
				</li>
				<li class="small-icon"><a
					href="<%=request.getContextPath()%>/readMesage.htm">私信留言管理员</a>
				</li>
				<li class="small-icon" id="six"><a
					href="<%=request.getContextPath()%>/getPersonal.htm">个人办公机分配</a>
				</li>
				<%-- <li class="small-icon" id="seven"><a
					href="<%=request.getContextPath()%>/setStatus.htm">管理虚拟机状态</a>
				</li> --%>
			</ul>
		</div>
		<div id="content-r">
			<div id="apply">
				<ul class="computer">
					<li>
						<!--w7图标--> <img
						src="<%=request.getContextPath()%>/user/images/w7.png" width="80"
						height="80" /> <input type="radio" name="systemType" checked="checked"/><span>win7</span>
					</li>
					<!--w8图标-->
					<li><img
						src="<%=request.getContextPath()%>/user/images/w81.jpg" width="80"
						height="80" /> <input type="radio" name="systemType" /><span>win8</span>
					</li>
					<li>
						<!--w10图标--> <img
						src="<%=request.getContextPath()%>/user/images/w10.png" width="80"
						height="80" /> <input type="radio" name="systemType" /><span>win10</span>
					</li>
				</ul>
				<input class="sendRequest" type="button" value="申请个人办公机" id="btn1"/>
				<div>
					<form action="<%=request.getContextPath()%>/loadFiles.htm" method="post">
						<input id="btn2"type="submit" value="办公机使用说明"/>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%-- <!--//生成协议-->
	<div id="mask" style="display:none;"></div>
	<div id="content_main" style="display:none;">
		<div id="xy"></div>
		<div id="ty">
			<!--需要同意协议，才可去申请-->
			<p>
				<input type="checkbox" 	id="agreed"><span>我已阅读协议并同意协议内容</span>
			</p>
			<button class="sendRequest"><span>去申请</span><img src="<%=request.getContextPath()%>/user/images/jt1.png"
				width="50" height="50" /> </button>
		</div>
	</div> --%>
<script type="text/javascript">
	var xmlhttp;
		function createXMLHttpRequest(){
		   if (window.XMLHttpRequest)
		   {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
		   }
		   else
			{// code for IE6, IE5
				 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
		    return xmlhttp;
		 };
	/* alert(document.getElementsById("agreed").checked); */
	//$(function(event){
		       	$(".sendRequest").click(function(){
		       var radionum=document.getElementsByName("systemType");
				var radio=0;
				for(var i = 0; i < radionum.length; i++)
				{
			    	if(radionum[i].checked)
			     	radio=i;
				}
				/* 	  var checkbox = document.getElementById('agreed');//
				  if(checkbox.checked){ */
					alert('请等待服务器处理，不要刷新页面！');
					//初始化XMLHttpRequest对象
		    		var xhr=createXMLHttpRequest();
		    		//服务器请求URl
		    		var uri="<%=request.getContextPath()%>/userApplPer.htm?system="+radio+"";
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4){
							if (xhr.status == 200 || xhr.status == 304){
								var data = xhr.responseText;
								//alert(data);
								if(data==1){
									alert('申请成功,请登录邮箱查看账号和登录密码！');
								}
								if(data==2){
									alert('申请失败');
								}
								if(data==3){
									alert('您已申请过虚机账号，不能再次申请');
								}
								if(data==7){
									alert('抱歉！win7系统的个人办公机已没有更多账号！');
								}
								if(data==8){
									alert('抱歉！win8系统的个人办公机已没有更多账号！');
								}
								if(data==10){
									alert('抱歉！win10系统的个人办公机已没有更多账号！');
								}
								window.location.href=window.location.href;
							};
						};
					};
					xhr.open("get", uri, true);
					xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded;c8arset=utf-8");	
					xhr.send(null);
				 /* }else{
				   alert('请阅读该条款');
				    event.preventDefalut();
          			return false;
				 } */
		        });		
			//});
</script>
</body>
</html>
