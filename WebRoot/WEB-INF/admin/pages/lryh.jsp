<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>录入用户</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/manage/common.css">
<script src="<%=request.getContextPath()%>/manage/js/common.js" type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="header" onload="showLeftTime()">

		<marquee direction="left" Behavior="scroll">您好！欢迎进入云平台自助服务管理系统</marquee>
		<div id="show">dig</div>
	</div>
	<div id="content">
		<div id="con-left">
			<ul>
				<li><a href="<%=request.getContextPath()%>/adminCheckApply.htm">审核申请</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/userInfo.htm">用户操作</a>
				</li>
				<li id="btn-zy" style="cursor:pointer">资源信息</li>
				<div id="zycz" style="display:none">
					<a href="<%=request.getContextPath()%>/searchResource.htm">查询修改</a>
					<a href="<%=request.getContextPath()%>/addMachineType.htm">虚机模板录入</a>
				</div>
				<li><a href="<%=request.getContextPath()%>/addPerMacNum.htm">录入账号</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/RejectApplyList.htm">删除申请</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/adminLookMes.htm">用户消息</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/adminResPwd.htm">修改密码</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/userList.htm">发送邮件</a>
				</li>
				<li>续期设置
					<form>
						<div style="display:none">
							<input id="tempStatus" value="${addTimeStat }" />
						</div>
						<input type="button" id="on" name="on" type="button"
							class="turnOn" style=" width:60px; height:30px;border:1px;">
					</form>
				</li>
			</ul>
		</div>
		<div id="con-right"></div>
	</div>
	<div id="mask" style="display:none"></div>
	<div id="entering" style="display:none">
		<span>录入用户</span>
		<hr />
		<form id="addUserForm">
			<label>姓名</label><input id="name" type="text"><br /> <label>邮箱</label><input
				id="email" type="text"><br />
			<button id="btn-sure" value="" onclick="addUser()"></button>
			<button id="btn-cancel">取消</button>
		</form>
	</div>
	<div id="footer"></div>
	<script>
		function fun() {
			alert('dih');
		}
		btn - enter.onclick == function() {
			alert('hi');
			Omask.style.display = "block";
			Oenter.style.display = "block";
		}

		var xmlrequest;
		function createXMLHttpRequest() {
			if (window.XMLHttpRequest) {
				xmlrequest = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				try {
					xmlrequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						xmlrequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
					}
				}
			}
			return xmlrequest;
		}
		function addUser() {
			//初始化XMLHttpRequest对象
			alert('wwwwwwwww');
			var xhr = createXMLHttpRequest();
			//服务器请求URl
			var uri = "user/add";
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200 || xhr.status == 304) {
						var data = xhr.responseText;
						alert(data);
						if (data == 0)
							alert('添加失败');
						if (data == 1)
							alert('添加成功');
						}
						window.location.href=window.location.href;
				}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("username=" + document.getElementById("name").value
					+ "&email=" + document.getElementById("email").value);
		}
	</script>
</body>
</html>