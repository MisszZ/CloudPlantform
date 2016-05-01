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
<title>用户消息</title>
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
		<div class="col-md-7">
			<div id="yhxx">
				<ul>
					<c:forEach items="${mesList}" var="mesList">
						<c:if test="${mesList.target!='管理员' }">
							<h3>管理员:<span class="timer">${mesList.time}</span>
							</h3>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mesList.content}
						</c:if>
						<c:if test="${mesList.target=='管理员' }">						
						<%-- <li><span>></span>${mesList.content }</li> --%>
						<li>
							<h3>
								${mesList.name}
								<li>${mesList.email}</li>
								<span class="timer">${mesList.time}</span>
							</h3>
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mesList.content }
							</p>
							<div>
								<button class="btn btn-default reply" onclick="replay(this)">回复</button>
							</div>
							<form id="replayCon" name="replayCon" style="display:none">
								<textarea cols="86" rows="6"></textarea>
								<input id="sendMesg" type="submit" class="sendBtn" value="发送"
									onclick="sendMge(this)"> <input type="reset"
									class="cancelBtn" value="取消" onclick="cancelMge(this)">
							</form></li>
							<div style="margin:0;padding:0; width:100%;height:5px;background-color:#EFEFEF;overflow:hidden;margin-top: 15px;"></div>
							<!-- <HR style="border:3 solid #ff0033" width="100%" SIZE=3> -->
						</c:if>
					
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
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
	var userName;
    function replay(o){					//点击弹框出现文本框
    	userName=o.parentNode.parentNode.getElementsByTagName('h3')[0].getElementsByTagName('li')[0].innerHTML;            
        var text=o.parentNode.parentNode.getElementsByTagName('form')[0];
        text.style.display="block";
    }
    function sendMge(o){             //点击发送按钮提交表单
     	 var content=o.parentNode.getElementsByTagName('textarea')[0].value;
     	 alert(userName);
     	 alert(content);
     	 <%-- var xhr=createXMLHttpRequest();
			//服务器请求URl
			var uri="<%=request.getContextPath()%>/sendEmail/adminResMesg?target="+userName+"&content="+content+"";
			alert(uri);
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4){
					if(xhr.status==200||xhr.status==304){
						var data = xhr.responseText;
						if(data==1) 
						{alert('发送成功！');}
						else{
							alert('发送失败！');
						}
													//window.location.href="<%=request.getContextPath()%>/sendEmail/tofsyj";
					}
				}
			}; --%>
     	 
     	 
     	 
       $.ajax({ 
					type: "POST",
					url: "<%=request.getContextPath()%>/adminResMesg.htm",
					contentType:"application/x-www-form-urlencoded;charset=utf-8",
					data: {content:content,target:userName}, 
					dataType:"json",
					success: function(data){
						//alert(data);
			        	//window.location.href="<%=request.getContextPath()%>/userAddTimeAppl/toAddDate";
		      	}});
    }
    function cancelMge(o){           //点击取消按钮   隐藏文本框
        o.parentNode.style.display="none";
    }
</script>
</html>