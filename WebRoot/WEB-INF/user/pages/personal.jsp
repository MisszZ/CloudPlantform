<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	HttpSession sesson = request.getSession();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>云平台自助服务系统</title>
<link type="text/css" href="<%=request.getContextPath()%>/user/css/base.css" rel="stylesheet" />
<link type="text/css" href="<%=request.getContextPath()%>/user/css/personal.css" rel="stylesheet" />
<script type="text/javascript">
	function startMove(){
		var timer=null;
		var oLi=document.getElementById('content-r');
		var oLi1=oLi.getElementsByTagName('li')[0];
		var oLi2=oLi.getElementsByTagName('li')[2];
		oLi1.style.display='block';
		oLi2.style.display='block';

		clearInterval(timer);//为了解决当频繁迅速点击按钮时div会运动加速的问题，要在每次运动结束时时关掉计时器
		timer=setInterval(function(){
			var ispeed=7;
			//解决了当到达位置时，点击按钮还动的问题
			if(oLi2.offsetLeft>=600&&oLi1.offsetTop>=10)//判断是否到达终点，限制div运动的距离，到了位置关闭计数器，停止
				{
					clearInterval(timer);//到达终点，关闭
				}
			else
				{
					oLi1.style.top=oLi1.offsetTop+ispeed+'px';	//到达之前，运动
					oLi2.style.left=oLi2.offsetLeft+ispeed+'px';
				}
		},30);
		/*$('button').trigger('click');*///模拟用户点击事件
	};
</script>
</head>

<body>
	<div id='data'>
		<div class="wel-user">
		<img src="<%=request.getContextPath()%>/user/images/agent%20-g.png">
	</div>
	<span>欢迎您 : <%=sesson.getAttribute("name")%>&nbsp;|</span><span><a
				href="<%=request.getContextPath()%>/userLogout.htm">注销登录&nbsp;</a> |</span><span><a
				href="<%=request.getContextPath()%>/modPwd.htm">修改密码</a> 
	</span>
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
			<div class="nav_bottom"></div>
		</div>
		<div id="content-r">
        	<ul>
            	<li style="display:none;">虚拟机账号：999999999</li>
                <li style="border:none;"><button value="查看账号密码" onclick="startMove()">点击查看密码详情</button></li>
                <!--此处添加用户邮箱的地址链接，用户即可直接查看密码-->
                <li style="display:none;"><a href="###">密码已发送至您的邮箱，去邮箱查看!</a></li>
            </ul>
		</div>
	</div>
</body>
</html>
