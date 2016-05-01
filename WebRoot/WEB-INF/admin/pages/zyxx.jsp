<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>资源信息</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/manage/css/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/manage/js/common.js"></script>
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
					</form>
				</li>
			</ul>
		</div>
		<div class="col-md-7 ">
			<div id="zyxx">
				<div id="search">
					<form>
						<div class="row find">
							<div class="col-md-2">
								<label>姓名</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="name">
							</div>
						</div>
						<div class="row find">
							<div class="col-md-2">
								<label>部门</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="department">
							</div>
						</div>
						<div class="row find">
							<div class="col-md-2">
								<label>内网IP</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="inIp">
							</div>
						</div>
						<div class="row find">
							<div class="col-md-2">
								<label>外网IP</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="outIp">
							</div>
						</div>
						<div class="row find">
							<div class="col-md-2">
								<label>内网端口</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="inPortTrue">
							</div>
						</div>
						<div class="row find">
							<div class="col-md-2">
								<label>外网端口</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="outPortTrue">
							</div>
						</div>
						<div class="row find">
							<div class="col-md-2">
								<label>操作系统</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="systemType">
							</div>
						</div>
						<div class="row find">
							<div class="col-md-2">
								<label>虚拟名称</label>
							</div>
							<div class="col-md-2 col-lg-offset-1">
								<input type="text" id="machineName">
							</div>
						</div>
						<div class="btn selRadio">
							<span id="checked">            	
		                    <input type="radio" name="status" value="0"/>
		                    <label for="user">虚机正在使用</label>
							&nbsp;
		                    <input type="radio" name="status" value="1"/>
						    <label for="manager">虚机已过期</label>     
	                	</span>
						</div>
						<button id="user-enter" type="button" name="find"
							class="btn btn-success" onclick="result()">查询</button>
						<!-查询按钮-->
					</form>

				</div>
			</div>
		</div>
	</div>
	<div id="find_mask"></div>
	<!--查询遮罩-->
	<div id="find_table" style="display:none">
		<!--查询表格-->
		<div id="find_table_btn">
			<button id="find_table_save" onclick="save_change()">保存</button>
			<button id="find_table_cancle" onclick="del_change()">取消</button>
		</div>
		<table id="mytable" cellspacing="0" cellpadding="0">
			<tr>
				<th>使用者</th>
				<th>Email</th>
				<th>所在部门</th>
				<th>操作系统</th>
				<th>外网IP</th>
				<th>内网IP</th>
				<th>外端口号</th>
				<th>内端口号</th>
				<th>虚拟机名称</th>
				<th>物理归属</th>
				<th>是否到期</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</table>
	</div>
	<div id="add_mask" style="display:none"></div>
	<div id="add_table" style="display: none">
		<form name="addForm">
			<table border="0" cellspacing="0" width="587" align="center">
				<tr>
					<td align="center" width="1" height="1">姓名</td>
					<td width="200"><input type="text" id="userName1" /></td>
					<td align="center" width="100">部门</td>
					<td width="197"><input type="text" id="department1" /></td>
				</tr>
				<tr>
					<!--<td align="center" width="100" height="50">申请人</td>-->
					<!--<td width="200"></td>-->
					<td align="center" width="100" height="50">电话</td>
					<td width="200"><input type="text" id="phone1"  r/></td>
					<td align="center" width="100" height="50">E-MAIL</td>
					<td width="200"><input type="text" id="email1" /></td>
				</tr>
				<tr>
					<td align="center" width="100" height="50">申请日期</td>
					<td width="200"><input type="text" id="time1" /></td>
					<td align="center" width="100">到期时间</td>
					<td width="197"><input type="text" id="timed1" /></td>
				</tr>
				<tr height="50">
					<td align="center">用途</td>
					<td colspan="3"><input type="text" id="uses1" /></td>
				</tr>
				<tr height="60">
					<td align="center">系统类型</td>
					<td colspan="3"><input type="text" id="systemType1" /></td>
				</tr>
				<tr height="50">
					<td align="center">配置</td>
					<td colspan="3"><input type="text" id="configuration1" /></td>
				</tr>
				<tr height="50">
					<!-- <td align="center" width="100" height="50">申请端口号</td>
					<td colspan="2"><input type="text" id="tempPort1" /></td>
					<td align="center">申请域名</td>
					<td colspan="2"><input type="text" id="domainName1" /></td> -->
					<td align="center" width="100" height="50">申请端口号</td>
					<td width="200"><input type="text" id="tempPort1" /></td>
					<td align="center" width="100">申请域名</td>
					<td width="197"><input type="text" id="domainName1" /></td>
				</tr>
				<tr>
					<td align="center" width="100" height="50">虚机位置</td>
					<td width="200"><input type="text" id="location1" /></td>
					<td align="center" width="100">虚机名称</td>
					<td width="197"><input type="text" id="machineName1" /></td>
				</tr>
				<tr>
					<td align="center" width="100" height="50">内网IP</td>
					<td width="200"><input type="text" id="inIp1" /></td>
					<td align="center" width="100">外网IP</td>
					<td width="197"><input type="text" id="outIp1" /></td>
				</tr>
				<tr>
					<td align="center" width="100" height="50">内网端口</td>
					<td width="200"><input type="text" id="inPort1" /></td>
					<td align="center" width="100">外网端口</td>
					<td width="197"><input type="text" id="outPort1" /></td>
				</tr>
				<tr height="50">
					<td align="center">备注</td>
					<td colspan="3"><input type="text" note="note1" /></td>
				</tr>
				<tr height="65">
					<td colspan="4"><input class="addBtn addSureBtn" type="submit"
						value="确定" style="width:75px;height:35px;" onclick="addSure(this)">
						<input class="addBtn" type="reset" value="取消"
						style="width:75px;height:35px" onclick="addCancel()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="addTable"></div>

	<div id="footer"></div>
	<script charset="UTF-8">
		var Omask = document.getElementById('find_mask');
		var Otable = document.getElementById('find_table');
		var addForm = document.getElementById('add_table');
		var addMask = document.getElementById('add_mask');

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
		};
		var tempData;
		var selRadios=document.getElementsByName('status');
		function result() {
			var oHeight = document.documentElement.scrollHeight;
			var oWidth = document.documentElement.scrollWidth;
			Omask.style.display = "block";
			Omask.style.height = oHeight + "px";
			Omask.style.width = oWidth + "px";
			var selStatu=5;
			for(var i=0;i<selRadios.length;i++){
				if(selRadios[0].checked){
					selStatu=1;
				}
				if(selRadios[1].checked){
					selStatu=3;
				}
			}
			//初始化XMLHttpRequest对象
			var xhr = createXMLHttpRequest();
			//服务器请求URl
			var uri = "searchResult.htm";
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4) {
					if (xhr.status == 200 || xhr.status == 304) {
						var data = xhr.responseText;
						var tab = document.getElementById("mytable");
				 		var oTr = tab.getElementsByTagName('tr');
				 		for(i=1;i<oTr.length;i++){
			 				oTr[i].style.display="none";
			 			} 
						//数据写入表单
						var json = jQuery.parseJSON(data);
						tempData=json;
						var info=json.length;
						//alert(data);
						var oTB = document.getElementById("mytable");
						//创建tbody节点，表格中必须有tbody才能添加，直接添加tr不成功
					    var tbody = document.createElement("tbody");
						var oInput=document.createElement("input");
						if(info>0){
								for(var i=0;i<info;i++){
									if(json[i].state==1){
										var state="否";
									}
									if(json[i].state==3){
										var state="是";
									}
									var row = oTB.insertRow(oTB.rows.length);
								    row.insertCell(0).innerHTML =json[i].name; 
									row.insertCell(1).innerHTML =json[i].email;
									row.insertCell(2).innerHTML =json[i].department; 
									row.insertCell(3).innerHTML =json[i].systemType; 
									row.insertCell(4).innerHTML = json[i].outIp; 
									row.insertCell(5).innerHTML = json[i].inIp;
									row.insertCell(6).innerHTML = json[i].outPortTrue;
									row.insertCell(7).innerHTML = json[i].inPortTrue; 
									row.insertCell(8).innerHTML =json[i].machineName; 
									row.insertCell(9).innerHTML =json[i].location;
									row.insertCell(10).innerHTML =state; 
									row.insertCell(11).innerHTML =json[i].note; 
									row.insertCell(12).innerHTML ="<button name='addInfo'  onclick='addInfo(this)'>添加</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button name='addInfo'  onclick='deleteOne(this)'>删除</button>";
								} 	
							}
					}
				}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded;charset=utf-8");
			xhr.send("name=" + document.getElementById("name").value
					+ "&department="
					+ document.getElementById("department").value + "&inIp="
					+ document.getElementById("inIp").value + "&outIp="
					+ document.getElementById("outIp").value + "&inPortTrue="
					+ document.getElementById("inPortTrue").value + "&outPortTrue="
					+ document.getElementById("outPortTrue").value + "&systemType="
					+ document.getElementById("systemType").value
					+ "&machineName="
					+ document.getElementById("machineName").value
					+ "&state="
					+ selStatu);	
			Otable.style.display = "block";
		}
		Omask.onclick = function() {
			Omask.style.display = "none";
			Otable.style.display = "none";
		};
		//删除数据
		function deleteOne(o){
			var userEmail=o.parentNode.parentNode.cells[1].innerHTML;
			var inIp=o.parentNode.parentNode.cells[5].innerHTML;
			var outIp=o.parentNode.parentNode.cells[4].innerHTML;
			var inPortTrue=o.parentNode.parentNode.cells[7].innerHTML;
			var outPortTrue=o.parentNode.parentNode.cells[6].innerHTML;
			//初始化XMLHttpRequest对象
			var xhr = createXMLHttpRequest();
			//服务器请求URl
			var uri = "delTiemdMac.htm?email="+userEmail+"&inIp="+inIp+"&outIp="+outIp+"&inPortTrue="+inPortTrue+"&outPortTrue="+outPortTrue+"";
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200 || xhr.status == 304) {
						var data = xhr.responseText;
						if(data==1){
							alert('删除成功！');
						}
						if(data==0){
							alert('删除失败！');
						}
						window.location.href=window.location.href;
					}
				}
			};
			xhr.open("POST",uri, true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send(null);	
		}
		//获取申请表单，为用户开通更多端口
		/* function addInfo(o){
			jQuery.each(tempData, function(i, tempData) {
				document.getElementById('userName1').value = tempData.name;
				document.getElementById('department1').value = tempData['department'];
				document.getElementById('phone1').value = tempData['phone'];
				document.getElementById('email1').value = tempData['email'];
				document.getElementById('time1').value = tempData.time;
				document.getElementById('timed1').value = tempData['timed'];
				document.getElementById('uses1').value = tempData['uses'];
				document.getElementById('systemType1').value = tempData['systemType'];
				document.getElementById('configuration1').value = tempData['configuration'];
				document.getElementById('tempPort1').value = tempData.temPort;
				document.getElementById('location1').value = tempData['location'];
				document.getElementById('machineName1').value = tempData['machineName'];
			});
			addForm.style.display = (addForm.style.display == "block") ? "none" : "block";
			addMask.style.height = document.documentElement.scrollHeight + 'px';
			addMask.style.display = "block";	
		} */
		
		function addInfo(o){
			var btn = o.parentNode;
	        var trs = btn.parentNode;
	        var tvalue=trs.cells[1].innerHTML;
	        var tmachineName=trs.cells[8].innerHTML;
			//初始化XMLHttpRequest对象
			var xhr = createXMLHttpRequest();
			//服务器请求URl
			var uri = "getUserAllpyInfo.htm?email="+tvalue+"&machineName="+tmachineName+"";
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200 || xhr.status == 304) {
						var data = xhr.responseText;
						//alert(data);
						//数据写入表单
						var json = $.parseJSON(data);
						/* alert(json); */ 
						jQuery.each(json, function(i, json) {
							document.getElementById('userName1').value = json['name'];
							document.getElementById('department1').value = json['department'];
							document.getElementById('phone1').value = json['phone'];
							document.getElementById('email1').value = json['email'];
							document.getElementById('time1').value = json['time'];
							document.getElementById('timed1').value = json['timed'];
							document.getElementById('uses1').value = json['uses'];
							document.getElementById('systemType1').value = json['systemType'];
							document.getElementById('configuration1').value = json['configuration'];
							document.getElementById('tempPort1').value = json['temPort'];
							document.getElementById('location1').value = json['location'];
							document.getElementById('machineName1').value = json['machineName'];
							document.getElementById('location1').value = json['location'];
							document.getElementById('domainName1').value = json['domainName'];
							document.getElementById('inIp1').value = json['inIp'];
						});
						addForm.style.display = (addForm.style.display == "block") ? "none" : "block";
						addMask.style.height = document.documentElement.scrollHeight + 'px';
						addMask.style.display = "block";
						
					}
				}
			};
			xhr.open("POST",uri, true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
			xhr.send(null);	
		} 
		function surefun() {
			var con = confirm('确定？');
			if (con == true) {
				$.ajax({ //这是$.ajax()方法  
					type : "POST",
					url : "addMachineType.htm",
					cache : false,
					data : $('#addForm').serialize(),//ajax提交表单      
					dataType : "text",//接受响应的数据类型，我的响应是一个页面，所以这里用“html”
					success : function(data) {
						alert('data');
					},
					error : function(response, ioArgs) {
						return response;
					}
				});
			}
		}
		/* function addInf() {
			addForm.style.display = "block";
			addMask.style.height = document.documentElement.scrollHeight + 'px';
			addMask.style.display = "block";
			alert(document.documentElement.scrollHeight);
		} */

		addMask.onclick = function() {
			addMask.style.display = "none";
			addForm.style.display = "none";
		};
		//添加用户虚机个数
		function addSure(o) {
			var userInfo=o.parentNode.parentNode.parentNode.getElementsByTagName('tr');
			var name=userInfo[0].getElementsByTagName('input')[0].value;
			var department=userInfo[0].getElementsByTagName('input')[1].value;
			var phone=userInfo[1].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
			var userEmail=userInfo[1].getElementsByTagName('td')[3].getElementsByTagName('input')[0].value;;
	    	var time=userInfo[2].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var timed=userInfo[2].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var uses=userInfo[3].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var systemType=userInfo[4].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var configuration=userInfo[5].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var temPort=userInfo[6].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var location=userInfo[7].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var machineName=userInfo[7].getElementsByTagName('td')[3].getElementsByTagName('input')[0].value;
	    	var inIp=userInfo[8].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var outIp=userInfo[8].getElementsByTagName('td')[3].getElementsByTagName('input')[0].value;
	    	var inPortTrue=userInfo[9].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var outPortTrue=userInfo[9].getElementsByTagName('td')[3].getElementsByTagName('input')[0].value;
	    	var note=userInfo[10].getElementsByTagName('td')[1].getElementsByTagName('input')[0].value;
	    	var confirm_=confirm('确定同意申请？');
	    	if(confirm_){	
		    	//初始化XMLHttpRequest对象
	    		var xhr=createXMLHttpRequest();
	    		//服务器请求URl
	    		var uri="addUserMachineOther.htm";
	    		xhr.onreadystatechange=function(){
			 				if(xhr.readyState==4){
			 					if(xhr.status==200||xhr.status==304){
			 						var data = xhr.responseText;
									if(data==0) {
										alert('保存数据失败！');
										window.location.href=window.location.href;
									} else if (data == 1) {
										alert('保存数据成功！');
										window.location.href=window.location.href;
									}

						}
					}
				};
				xhr.open("POST", uri, true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send("location=" + location + "&machineName=" + machineName
						+ "&inIp=" + inIp + "&outIp=" + outIp + "&inPortTrue="
						+ inPortTrue + "&outPortTrue=" + outPortTrue + "&note="
						+ note + "&email=" + userEmail + "&systemType="
						+ systemType + "&uses=" + uses + "&time=" + time
						+ "&timed=" + timed + "&configuration=" + configuration
						+ "&temPort=" + temPort);
			} else {
				alert('取消添加');
				return false;
				window.location.reload();
			}
		}
		function addCancel() {
			addMask.style.display = "none";
			addForm.style.display = "none";
		}
		// 将单元格转化成文本框 
		function changeTotext(obj) {
			var tdValue = obj.innerText;
			obj.innerText = "";
			var txt = document.createElement("input");
			txt.type = "text";
			txt.value = tdValue;
			txt.id = "_text_000000000_";
			txt.setAttribute("className", "text");
			obj.appendChild(txt);
			txt.select();
			//obj.style.border = "1px dashed #ff9900"; 
		}
		// 取消单元格中的文本框，并将文本框中的值赋给单元格 
		function cancel(obj) {
			var txtValue = document.getElementById("_text_000000000_").value;
			obj.innerText = txtValue;
		}
		/*********************************************/
		// 事件 
		/* document.onclick = function() {
			if (event.srcElement.tagName.toLowerCase() == "td") {
				changeTotext(event.srcElement);
			}

		};
		document.onmouseup = function() {
			if (document.getElementById("_text_000000000_")
					&& event.srcElement.id != "_text_000000000_") {
				var obj = document.getElementById("_text_000000000_").parentElement;
				cancel(obj);
			}
		}; */
		function save_change() {
			var con = confirm('确认修改？');
			if (con == "true") {
				$.ajax({ //这是$.ajax()方法  
					type : "POST",
					url : "cloud/addType",
					cache : false,
					data : $('#addForm').serialize(),//ajax提交表单      
					dataType : "text",//接受响应的数据类型，我的响应是一个页面，所以这里用“html”

					success : function(data) {
						alert('data');
					},
					error : function(response, ioArgs) {
						return response;
					}
				});
			}
		}
		function del_change() {
			Otable.style.display = "none";
			Omask.style.display = "none";
		}
		function turn() {
			var on_off = document.getElementById('on');
			on_off.onclick = function() {
				on_off.id = (on_off.id == "on") ? "off" : "on";
			};
		}
		turn();

		/*var cons=document.getElementsByName('con');
		var seeks = document.getElementsByName('seek');
		function hidden(){
			for(var i=0;i<cons.length;i++){
				cons[i].style.display="none";
				for(var j=0;j<seeks.length;j++){
					seeks[i].style.display="none";
				}
			}

		}
		function showSelect(id){
			hidden();
			document.getElementById('con'+id).style.display="block";
		}
		
		document.getElementById('search-input-button1').onclick=function(){
			
			document.getElementById('name-seek').style.display="block";
		}
		document.getElementById('search-input-button2').onclick=function(){
			document.getElementById('type-seek').style.display="block";
		}*/
	</script>
</body>