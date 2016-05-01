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
<title>录入虚机模板</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/manage/js/common.js" type="text/javascript"></script>
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
					<a href="<%=request.getContextPath()%>/addMachineType.htm">管理虚机模板</a>
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
		<div class="col-md-7 ">
			<form action="cloud/addType" id="zy-form" method="POST">
				<div class="row ziyuan">
					<div class="col-md-2" style="text-align: right">
						<label>系统类型</label>
					</div>
					<div class="col-md-4">
						<input type="text" id="systemType">
					</div>
				</div>
				<div class="row ziyuan">
					<div class="col-md-2" style="text-align: right">
						<label>配置</label>
					</div>
					<div class="col-md-4">
						<input type="text" id="configuration">
					</div>
				</div>
				
				<button type="button" value=click onclick="addModel()"
					class="btn btn-success">确定</button>
				<!-查看现有虚机模板-->
				<button type="button" value=click onclick="lookModel()" id="xnmb">现有虚机模板</button>
			</form>
		</div>
	</div>
	<div id="allSyso_mask"></div>
	<div id="allSyso" style="display:none">
		<table id="mytable" cellspacing="0" cellpadding="0">
			<tr>
				<th>正在使用操作系统模板</th>
				<th>操作</th>
			</tr>
		</table>
	</div>
</body>
<script>
	var Omask = document.getElementById('allSyso_mask');
	var Otable = document.getElementById('allSyso');
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
	function deleteSyso(o){
		var systemType=o.parentNode.parentNode.cells[0].innerHTML;
		//alert(systemType);
		//初始化XMLHttpRequest对象
		var xhr = createXMLHttpRequest();
		//服务器请求URl
		var uri = "delOneSyso.htm";
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200 || xhr.status == 304) {
					var data = xhr.responseText;
					if (data == 0)
						alert('删除虚机模板失败！');
					window.location.href = window.location.href;
					if (data == 1)
						alert('删除虚机模板成功！');
					window.location.href = window.location.href;
				}
			}
		};
		xhr.open("POST", uri, true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("systemType=" + systemType);
	}
	function lookModel(){
		var oHeight = document.documentElement.scrollHeight;
		var oWidth = document.documentElement.scrollWidth;
		Omask.style.display = "block";
		Omask.style.height = oHeight + "px";
		Omask.style.width = oWidth + "px";
		Otable.style.display = "block";
		//初始化XMLHttpRequest对象
		var xhr = createXMLHttpRequest();
		//服务器请求URl
		var uri = "lookAllSyso.htm";
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200 || xhr.status == 304) {
					var data = xhr.responseText;
					var json = jQuery.parseJSON(data);
					//alert(data);
						var info=json.length+1;
						//alert(info);
						var oTB = document.getElementById("mytable");
						//创建tbody节点，表格中必须有tbody才能添加，直接添加tr不成功
					    var tbody = document.createElement("tbody");
						if(info>0){
							
								for(var i=0;i<info;i++){
									var row = oTB.insertRow(oTB.rows.length);
									if(i==info-1){
										row.insertCell(0).innerHTML =''; 
										row.insertCell(1).innerHTML ="<button name='dellSyso'  onclick='flushThis()'>返回</button>";
									}else{
									    row.insertCell(0).innerHTML =json[i].systemType; 
										row.insertCell(1).innerHTML ="<button name='dellSyso'  onclick='deleteSyso(this)'>删除</button>";
									}
								}
								
								Omask.style.display = "block";
								Omask.style.height = oHeight + "px";
								Omask.style.width = oWidth + "px";
								Otable.style.display = "block";
						}
						
				}
			}
		};
		xhr.open("POST", uri, true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send(null);
	}
	function flushThis(){
		window.location.href = window.location.href;
	}
	function addModel() {
		//初始化XMLHttpRequest对象
		var xhr = createXMLHttpRequest();
		//服务器请求URl
		var uri = "adminAddMachineType.htm";
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200 || xhr.status == 304) {
					var data = xhr.responseText;
					if (data == 0)
						alert('添加虚机模板失败！');
					window.location.href = window.location.href;
					if (data == 1)
						alert('添加虚机模板成功！');
					window.location.href = window.location.href;
				}
			}
		};
		xhr.open("POST", uri, true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("systemType=" + document.getElementById("systemType").value
				+ "&configuration="
				+ document.getElementById("configuration").value);
	}
</script>
</html>