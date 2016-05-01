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
<title>录入账号</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/manage/css/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/manage/js/common.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="row" id="header">
		<div class="col-md-12">
			<marquee direction="left" Behavior="scroll">您好！欢迎进入云平台自助服务管理系统</marquee>
			<div id="show">dig</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3  col-md-offset-1">
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
					</form></li>
			</ul>
		</div>
		<div class="col-md-7 ">
			<form action="" id="zy-form">
				<div class="row ziyuan">
					<div class="col-md-2" style="text-align:left">
						<label>账号</label>
					</div>
					<div class="col-md-4">
						<input class="zyInput" type="text" id="numb">
					</div>
				</div>
				<div class="row ziyuan">
					<div class="col-md-2" style="text-align: left">
						<label>密码</label>
					</div>
					<div class="col-md-4">
						<input class="zyInput" type="text" id="pwd">
					</div>
				</div>
				<div class="row ziyuan">
					<div class="col-md-2" style="text-align: left">
						<label>虚机类型</label>
					</div>
					<div class="col-md-5">
						<input class="typeInput" type="radio" name="types" value="1"
							id="manage" /> <label for="manager">win7</label> <input
							type="radio" class="types" name="types" value="2" id="manage" />
						<label for="manager">win8</label> <input type="radio"
							class="types" name="types" value="3" id="manage" /> <label
							for="manager">win10</label>
					</div>
				</div>
				<button type="button" class="btn btn-success" onclick="addCount()">确定</button>

			</form>
		</div>
	</div>
	<div id="footer"></div>
</body>
<script>
	function turn() {
		var on_off = document.getElementById('on');
		on_off.onclick = function() {
			on_off.id = (on_off.id == "on") ? "off" : "on";
		};
	}
	turn();
	/*
	function click(){
	document.form1.action="cloud/addCounter"
	document.form1.submit();
	}
	 */
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
	var systemType;
	function addCount() {
		//点击确定之后获取选中的radio的值
		var radionum = document.getElementsByName("types");

		for ( var i = 0; i < radionum.length; i++) {
			if (radionum[i].checked)
				systemType = radionum[i].value;

		}
		/* alert("xuanze " + systemType); */
		//初始化XMLHttpRequest对象
		var xhr = createXMLHttpRequest();
		//服务器请求URl
		var uri = "addCounter.htm";
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200 || xhr.status == 304) {
					var data = xhr.responseText;
					if (data == 0) {
						alert('添加个人办公机账号失败！');
					}
					if (data == 1) {
						alert('添加个人办公机账号成功！');
					}
					window.location.href = window.location.href;
				}
			}
		};
		xhr.open("POST", uri, true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		/* alert(document.getElementById("numb").value); */
		xhr.send("numb=" + document.getElementById("numb").value + "&pwd="
				+ document.getElementById("pwd").value + "&systemType="
				+ systemType);
	}
</script>
</html>