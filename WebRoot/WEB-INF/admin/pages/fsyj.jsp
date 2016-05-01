<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>发送邮件</title>
<style>
form {
	margin: 0;
}
textarea {
	display: block;
}
</style>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/manage/theme/themes/default/default.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/manage/css/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/manage/js/common.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/manage/js/getOtherUserInfo.js"></script>
<script
	src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/manage/theme/kindeditor-min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/manage/theme/lang/zh_CN.js"
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
					</form>
				</li>
			</ul>
		</div>
		<div class="col-md-8" id="fsyj">
			<div class="row">
				<div class="col-md-9">
					<form id="sendEmail" name="sendEmail">
						<div style="height:auto">
							<div class="row">
								<div class="col-md-1 col-md-offset-1">
									<label>收件人</label>
								</div>
								<div class="col-md-10 col-md-offset-1">
									<input type="text" id="recipients" name="recipients"
										style="font-size: 1rem">
								</div>
								<div class="col-md-1 col-md-offset-1">
									<label>标题</label>
								</div>
								<div class="col-md-10 col-md-offset-1">
									<input type="text" id="title" name="recipients"
										style="font-size: 1rem">
								</div>
								<div class="col-md-1 col-md-offset-1">
									<label>正文</label>
								</div>
								
							</div>
							<div class="col-md-10 col-md-offset-1">
								<textarea id="content" name="content"
									style="width:100px;height:350px;visibility:hidden;"></textarea>
							</div>
						</div>
						<div class="sendBtn">
							<input type="button" name="getText" class="getText" value="发送邮件" />
							<input type="button" name="clear" class="clear" value="清空内容" />
						</div>
					</form>
				</div>
				<div class="col-md-2 col-md-offset-1">
					<h6>联系人</h6>
					<ul id="sendName">
						<!-- <table id="userList"> -->
						<td>
							<button type="button" onclick="selectAllUser()">全部选择</button>
						</td>
						<td><input class="box" type="checkbox" name="emailList"
							value="${info.email}" style="display:none" />
						</td>
						<c:forEach items="${userInfo }" var="userInfo">
							<li>${userInfo.name }</li>
						</c:forEach>

						<div id="otherUser" style="display:none">
							<c:forEach items="${userInfoOther }" var="userInfoOther">
								<li>${userInfoOther.name }</li>
							</c:forEach>
						</div>
						<button type="button" id="loadMore">展开</button>
						<button type="button" id="loadLess" style="display:none">收起</button>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<div id="footer"></div>
</body>
<script>
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
    	};
    	var sendName = document.getElementById('sendName').getElementsByTagName('li');
    	//选择所有用户
    	var selFla=0;
    	function selectAllUser(){
    		if(selFla==0){
    			selFla=1;
	    		for (var i = 0; i < sendName.length; i++) {         //点击姓名时在input中显示
	                $('#recipients').val( $('#recipients').val() + sendName[i].innerHTML + ";"); 
	        	}
        	}
    	}
    	
       
        //alert(sendName.length);
        var recipients = document.getElementsByName('recipients');
        for (var i = 0; i < sendName.length; i++) {         //点击姓名时在input中显示
            sendName[i].onclick = function () {
                $('#recipients').val( $('#recipients').val() + this.innerHTML + ";"); 
            };
        }
        var oUl=document.getElementById('sendName');
        var loadBtn=document.getElementById('loadMore');
        var loadLessBtn=document.getElementById('loadLess');
        var i=0;
        loadBtn.onclick=function (){
        	var otherUser=document.getElementById('otherUser');
        	loadBtn.style.display="none";
        	document.getElementById('loadLess').style.display ="block";
        	otherUser.style.display = (otherUser.style.display == "block") ? "none" : "block";
        };
        loadLessBtn.onclick=function(){
        	loadLessBtn.style.display="none";
        	loadBtn.style.display="block";
        	otherUser.style.display = (otherUser.style.display == "block") ? "none" : "block";
        }
       var title=document.getElementById('title').innerHTML;
       var content=document.getElementById('content').innerHTML;
       
       //发送邮件
        KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
				uploadJson : "<%=request.getContextPath()%>/toPubArt.htm", 
					allowFileManager : true
				});
				K('input[name=getText]').click(function(e) {					
					if(editor.text()!=""&&title.value!=""){
						//alert(editor.text());
						//salert(document.getElementById("title").value);
						//初始化XMLHttpRequest对象
						var idsObj =document.getElementsByName("recipients");
			    		var xhr=createXMLHttpRequest();
			    		//服务器请求URl
			    		var uri="adminSendEmail.htm?emailList="+$('#recipients').val()+"&content="+editor.text()+"&title="+document.getElementById("title").value+"";
			    		xhr.onreadystatechange=function(){
					 				if(xhr.readyState==4){
					 					if(xhr.status==200||xhr.status==304){
					 						var data = xhr.responseText;
											if(data==1){
												alert('邮件发送成功！');			
											} 
											else if(data==0){
											 	alert('邮件发送失败！');
											 }
											window.location.href=window.location.href;
										}
									}
						};
						xhr.open("POST", uri, true);
						xhr.setRequestHeader("Content-Type",
								"application/x-www-form-urlencoded");
						xhr.send(null);
					}else{
						alert('输入有误');
				        event.preventDefalut();
				        return false;
					}
				});
				K('input[name=clear]').click(function(e) {
					editor.html('');
				});
			});
</script>
</html>