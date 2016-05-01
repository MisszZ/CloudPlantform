<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	HttpSession sesson = request.getSession();
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>审核申请</title>
<link >
<link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/manage/js/common.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js" type="text/javascript"></script>


<style>
.col-md-7 {
	overflow-y: scroll;
}
</style>
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
			<ul id="test">
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
		<div class="col-md-7">
			<div id="sh">
			<c:choose>
				<c:when test="${empty info}">
    				近期没有用户申请云平台资源!!!
    			</c:when>
				<c:otherwise>
					<ul id="test">
						<c:forEach var="info" items="${info}">
							<li id="infoList" value="true" onclick="lookApply(this)"
								style="display:block">${info.name}</li>
							<div id="table" class="table" style="display:none">
								<table border="0" cellspacing="0" width="100%" align="center">
									<tr>
										<td align="center" width="250" height="50">部门</td>
										<td align="center" width="250">${info.department}</td>
										<td align="center" width="250">申请日期</td>
										<td align="center" width="250">${info.time }</td>
										<!--  <td align="center" width="250">${info.time}</td>-->
									</tr>
									<tr>
										<!--<td align="center" width="100" height="50">申请人</td>-->
										<!--<td width="200"></td>-->
										<td align="center" width="100" height="50">电话</td>
										<td align="center" width="300">${info.phone}</td>
										<td align="center" width="100" height="50">E-MAIL</td>
										<td align="center" width="300">${info.email }</td>
										<!--<td align="center" width="300">${info.email}</td>-->
									</tr>
									<tr height="50">

										<td align="center">使用时限</td>
										<td align="center" colspan="3">到${info.timed}</td>
									</tr>
									<tr height="50">
										<td align="center">用途</td>
										<td align="center" colspan="3">${info.uses}</td>
									</tr>
									<tr height="60">
										<td align="center">操作系统类型</td>
										<td align="center" colspan="3">${info.systemType}</td>
									</tr>
									<tr height="50">
										<td align="center">配置</td>
										<td align="center" colspan="3">${info.configuration}</td>
									</tr>
									<tr height="50">
										<%-- <td align="center" width="100" height="50">申请开放端口</td>
										<td align="center" colspan="3">${info.temPort }</td>
										<td align="center">申请域名</td>
										<td align="center" colspan="3">${info.domainName }</td> --%>
										<td align="center" width="100" height="50">申请开放端口</td>
										<td align="center" width="300">${info.temPort}</td>
										<td align="center" width="100" height="50">申请域名</td>
										<td align="center" width="300">${info.domainName }</td>
									</tr>
									<tr height="45">
										<td colspan="4"><input class="pass" type="submit"
											value="通过" id="pass" onclick="agreeBlock(this)"> <input
											class="refuse" type="submit" value="拒绝" id="refuse"
											onclick="refuseBlock(this)"></td>
									</tr>
								</table>

								<div id="given-inf" class="given-inf" style="display:none">
									<div id="agreeForm">
										<form id="agreeInfoForm">
											<div class="row">
												<div style="display:none">
													<li>${info.email }</li>
												</div>
												<div style="display:none">
													<li>${info.uses }</li>
												</div>
												<div style="display:none">
													<li>${info.systemType }</li>
												</div>
												<div class="col-md-2">
													<label>虚机位置</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="location" />
												</div>
												<div class="col-md-2 col-lg-offset-2">
													<label>虚机名称</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="machineName" />
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<label>内网IP</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="inIp">
												</div>
												<div class="col-md-2 col-lg-offset-2">
													<label>外网IP</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="outIp">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<label>内网端口</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="inPortTrue">
												</div>
												<div class="col-md-2 col-lg-offset-2">
													<label>外网端口</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="outPortTrue">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<label>域名</label>
												</div>
												<div class="col-md-2">
													<input style="width:300" class="text" type="text" id="domainName">
												</div>
												<div class="col-md-2">
													<label></label>
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">
													<label>备注</label>
												</div>
												<div class="col-md-2">
													<input style="width:300" class="text" type="text" id="note">
												</div>
											</div>
											<input onclick="agreeSure(this)" type="button" class="sure"
												id="sure" value="确定"> <input onclick="back(this)"
												type="reset" class="cancel" id="cancel" value="取消">
										</form>
									</div>
								</div>
								<div id="refuse-rea" class="refuse-rea" style="display:none">
									<form id="rejForm">
										<textarea name="" id="rejReason" cols="75" rows="6"
											placeholder="请给出拒绝理由:"></textarea>
										<input onclick="sureRef(this)" class="sure" type="submit"
											id="re-sure" value="确定"> <input
											onclick="backRef(this)" type="reset" class="refCancel"
											id="re-cancel" value="取消">
									</form>
								</div>
							</div>
						</c:forEach>
					</ul>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	<div style="display:none">
		<input id="machineNum" value=${machineNum } />
	</div>
	<div id="footer"></div>
</body>
<script>
		
		alert(document.getByTagName("div").nodes);

		var machineNum=document.getElementById('machineNum').value;
	    var xmlrequest;
    	function createXMLHttpRequest(){
    		if(window.XMLHttpRequest){
    			xmlrequest=new XMLHttpRequest();
    		}
    		else if(window.ActiveXObject){
    			try{
    				xmlrequest=new ActiveXObject("Msxml2.XMLHTTP");
    			}catch(e){
    				try{
    					xmlrequest=new ActiveXObject("Microsoft.XMLHTTP");
    				}catch(e){}
    			}
    		}
    		return xmlrequest;
    	}
	
	var flag=<%=sesson.getAttribute("flag")%>;
	//var userEmial=document.getElementById('userEmail').value;
	if(flag==1){
		 setTimeout("alert('警告！虚拟机数量还剩"+machineNum+"个')", 2000);
    	 var t= setTimeout("alert('警告！虚拟机数量还剩"+machineNum+"个')", 2000);
    	 clearTimeout(t);
	}
    //展开申请表,并隐藏其他申请人信息
    function lookApply(o){
        var otherName=o.parentNode.getElementsByTagName('li');
    	var next = o.nextElementSibling;// || this.nextSibling;
    	var tables = document.getElementsByClassName('table');
        next.style.display = (next.style.display == "block") ? "none" : "block";	
		for(var i=0;i<otherName.length;i++){
			if(otherName[i]==o){
				var temp=i;
			}
			if(otherName[i]!=o&&i>temp){
				otherName[i].style.display = (otherName[i].style.display == "none") ? "block" : "none";
				
			}
			/* if(otherName[i]!=o){
				var table=otherName[i].nextElementSibling || this.nextSibling;
				table.style.display = (table.style.display == "block") ? "none" : "none";
			} */
		}
    }
    //同意申请，并填写信息
    function agreeBlock(o){
    	var userName=o.parentNode.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('div')[0];
    	userName.style.display = (userName.style.display == "block") ? "none" : "block";
    	var userName1=o.parentNode.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('div')[27];
    	if(userName1.style.display=="block"){
    		userName1.style.display="none";
    	}
    }
    //取消同意，收回同意表单
    function back(o){
    	var temp=o.parentNode.parentNode.parentNode;
    	temp.style.display = (temp.style.display == "block") ? "none" : "block";
    }
    //拒绝申请，填写理由
    function refuseBlock(o){
		var userName=o.parentNode.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('div')[27];
    	userName.style.display = (userName.style.display == "block") ? "none" : "block";
    	var userName1=o.parentNode.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('div')[0];
    	if(userName1.style.display=="block"){
    		userName1.style.display="none";
    	}
    }
    //取消拒绝，收回表单
    function backRef(o){
    	var temp=o.parentNode.parentNode;
    	temp.style.display = (temp.style.display == "block") ? "none" : "block";
    }
    //提交拒绝信息
    function sureRef(o){
    	var userEmail=o.parentNode.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('li')[0].innerHTML;
    	var uses=o.parentNode.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('li')[1].innerHTML;
    	var systemType=o.parentNode.parentNode.parentNode.getElementsByTagName('div')[1].getElementsByTagName('li')[2].innerHTML;
    	var reason=o.parentNode.getElementsByTagName('textarea')[0].value;
    	if (confirm('确定？')) {
           //初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="adminRejectApply.htm";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==0) {
									alert('保存数据失败！');
									window.location.href=window.location.href;
								}
								 else if(data==1){
									alert('保存数据成功！');
									window.location.href=window.location.href;
								}
					}
				}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("reason=" + reason+"&email="+userEmail+"&uses="+uses+"&systemType="+systemType);
        } else {
            return false;
            window.location.reload();
        }
    }
    //同意并提交信息
    function agreeSure(o){ 
    	var userEmail=o.parentNode.getElementsByTagName('div')[1].getElementsByTagName('li')[0].innerHTML;
    	var uses=o.parentNode.getElementsByTagName('div')[2].getElementsByTagName('li')[0].innerHTML;
    	var systemType=o.parentNode.getElementsByTagName('div')[3].getElementsByTagName('li')[0].innerHTML;
    	var location=o.parentNode.getElementsByTagName('div')[5].getElementsByTagName('input')[0].value;
    	var machineName=o.parentNode.getElementsByTagName('div')[7].getElementsByTagName('input')[0].value;
    	var inIp=o.parentNode.getElementsByTagName('div')[10].getElementsByTagName('input')[0].value;
    	var outIp=o.parentNode.getElementsByTagName('div')[12].getElementsByTagName('input')[0].value;
    	var inPortTrue=o.parentNode.getElementsByTagName('div')[15].getElementsByTagName('input')[0].value;
    	var outPortTrue=o.parentNode.getElementsByTagName('div')[17].getElementsByTagName('input')[0].value;
    	var domainName=o.parentNode.getElementsByTagName('div')[20].getElementsByTagName('input')[0].value;
    	var note=o.parentNode.getElementsByTagName('div')[24].getElementsByTagName('input')[0].value;
    	/* alert(domainName);
    	alert(note); */
    	var confirm_=confirm('确定同意申请？');
        if (confirm_) {	
       		//初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="adminAgreeApply.htm";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==0) {
									alert('保存数据失败！');
									window.location.href=window.location.href;
								}
								 else if(data==1){
									alert('保存数据成功！');
									window.location.href=window.location.href;
								}
					}
				}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("location=" + location+ "&machineName="+ machineName + "&inIp="+ inIp + "&outIp="
					+ outIp + "&inPortTrue="+ inPortTrue+ "&outPortTrue="+ outPortTrue + "&note="
					+ note + "&email="+ userEmail+ "&systemType="+ systemType+ "&uses="+ uses+ "&domainName="+ domainName);
			} else {
				alert('取消添加');
				return false;
				window.location.reload();
			}
    	}
	function turn() {
		var on_off = document.getElementById('on');
		on_off.onclick = function() {
			on_off.id = (on_off.id == "on") ? "off" : "on";
		};
	}
	turn();
</script>
</html>