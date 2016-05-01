<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
	java.util.Date currentTime = new java.util.Date();
	String time = simpleDateFormat.format(currentTime).toString();
	HttpSession sesson = request.getSession();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>管理虚拟机--云平台自助服务系统</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/massage.js"></script>
	<link href="<%=request.getContextPath()%>/user/css/base.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/user/css/message.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id='data'>
	<!--*************************************右上角********************************-->
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
	<div class="content-r">
		<p>已拥有虚拟机</p>
		<div class="DivSelect">
			<select class="SelectList">
				<option>2颗CPU（2.0GHz）+4G内存+50G硬</option>
				<option>2颗CPU（2.0GHz）+8G内存+50G硬</option>
				<option>2颗CPU（2.0GHz）+16G内存+50G硬</option>
			</select>
		</div>
		<p>虚拟机状态</p>
		<div id="state">
			<span style="display:none;"><img src="<%=request.getContextPath()%>/user/images/but_on.jpg" width="138" height="50"/></span>
			<span style="display:block;"><img src="<%=request.getContextPath()%>/user/images/but_off.jpg" width="138" height="50" /></span>
		</div>
		<p>管理虚拟机</p>
		<input type="button" value="开启" id="open" />
		<input type="button" value="关闭" id="close" />
		<input type="button" value="重启" id="reopen" />

	</div>
</div>
</body>
</html>


