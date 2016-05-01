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
<title>云平台--资源申请的进度</title>
<link href="<%=request.getContextPath()%>/user/css/base.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/user/css/speed.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/user/js/speed.js"></script>
</head>
<body>
	<div id='data'>
		<!--*************************************右上角********************************-->
		<div class="wel-user">
			<img src="<%=request.getContextPath()%>/user/images/agent%20-g.png"
				alt="" />
		</div>
		<span>欢迎您 : <%=sesson.getAttribute("name")%>&nbsp;|</span><span><a
			href="<%=request.getContextPath()%>/userLogout.htm">注销登录&nbsp;</a>|</span><span><a
			href="<%=request.getContextPath()%>/modPwd.htm">修改密码</a>
		</span>
	</div>
	<div id="topic">
		<a href="" alt="云平台自助管理系统"></a>
	</div>
	<div id="content">
		<div id="sel"></div>
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
		<div style="display:none;">
				<input id="stateFir" value="${state }"/>
				<input id="haveOrNo" value="${haveOrNo }"/>
				<input id="stateFlag" value="${state }"/>
		</div>	
		<c:if test="${empty stateInfo}">
		  	<div id="mask"></div>
			<div id="nosource" style="display:block;">
			<span>对不起，您还没有申请任何资源！</span><br />
   			<a href="<%=request.getContextPath()%>/userApplyRes.htm"><button><span>申请</span></button></a>
    		</div>
		</c:if>
		<c:if test="${!empty stateInfo}">
			<div class="content-r">
				<div id="havesource" style="display:block;">
					<span>选择资源,查看进度</span> <select id="stateInf">
						<c:forEach items="${stateInfo}" var="stateInfo">
							<option>${stateInfo.systemType}</option>
						</c:forEach>
					</select>
				</div>
				<div id="rapid">
					<ul>
						<li><img
							src="<%=request.getContextPath()%>/user/images/blue.png"
							width="800" height="45" alt="" />
						</li>
						<li><img
							src="<%=request.getContextPath()%>/user/images/purple.png"
							width="800" height="45" alt="" />
						</li>
						<li><img
							src="<%=request.getContextPath()%>/user/images/gray.png"
							width="800" height="45" alt="" />
						</li>
					</ul>
				</div>
				<ul id="means">
					<li><img
						src="<%=request.getContextPath()%>/user/images/djx-1-1.png"
						width="231" height="38" alt="">
					</li>
					<li><img
						src="<%=request.getContextPath()%>/user/images/djx-1-2.png"
						width="231" height="38" alt="">
					</li>
					<li><img
						src="<%=request.getContextPath()%>/user/images/djx-1-3.png"
						width="231" height="38" alt="">
					</li>
				</ul>
				<ol>
					<li class="state1"><img
						src="<%=request.getContextPath()%>/user/images/button1-0.png"
						width="38" height="39" alt="" />
					<p>
							State1<br />正在审核
						</p>
					</li>
					<li><img
						src="<%=request.getContextPath()%>/user/images/button2-0.png"
						width="38" height="40" alt="" />
					<p>
							State2<br />审核通过
						</p>
					</li>
					<li><img
						src="<%=request.getContextPath()%>/user/images/button3-0.png"
						width="38" height="40" alt="" />
					<p>
							State3<br />申请失败
						</p>
					</li>
				</ol>
			</div>
	</c:if >
	</div>
	<script type="text/javascript">
	var a=0;
	var xmlhttp=null;
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
	function init(){
		if(a==0){
			a=1;
			var stateFir=document.getElementById('stateFir').value;
			//alert(stateFir);
			var oLi = document.getElementById('rapid').getElementsByTagName('li');
			if (stateFir == 0) {
				oLi[0].style.display = "block";
				oLi[1].style.display = "none";
				oLi[2].style.display = "none";
			} else if (stateFir == 1) {
				oLi[1].style.display = "block";
				oLi[0].style.display = "none";
				oLi[2].style.display = "none";
			} else if (stateFir == 2) {
				oLi[2].style.display = "block";
				oLi[0].style.display = "none";
				oLi[1].style.display = "none";
			} else {
				oLi[0].style.display = "none";
				oLi[1].style.display = "none";
				oLi[2].style.display = "none";
			}
		}
	}
	var haveOrNo=document.getElementById('haveOrNo').value;
	var stateFlag=document.getElementById('stateFlag').value;
	//alert(stateFlag);
	if(haveOrNo==1){
		init();
	}
	var num=3;
	function getInfo(){
   		 var select = document.getElementById("stateInf");
    	 select.onchange = function(){
		        //初始化XMLHttpRequest对象
		    	var xhr=createXMLHttpRequest();
		    	//服务器请求URl
		    	var uri="<%=request.getContextPath()%>/searchApplStatus.htm?systemType="+ select.value + "";
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200 || xhr.status == 304) {
							var data = xhr.responseText;
							num = data;
							var oLi = document.getElementById('rapid')
									.getElementsByTagName('li');
							if (num == 0) {
								oLi[0].style.display = "block";
								oLi[1].style.display = "none";
								oLi[2].style.display = "none";
							} else if (num == 1) {
								oLi[1].style.display = "block";
								oLi[0].style.display = "none";
								oLi[2].style.display = "none";
							} else if (num == 2) {
								oLi[2].style.display = "block";
								oLi[0].style.display = "none";
								oLi[1].style.display = "none";
							} else {
								oLi[0].style.display = "none";
								oLi[1].style.display = "none";
								oLi[2].style.display = "none";
							}
						};
					};
				};
				xhr.open("get", uri, true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded;c8arset=utf-8");
				xhr.send();
			};

		};
		window.onload = function() {	
			getInfo();
			//alert(num);
			var oStafor = document.getElementById("stateInf")
					.getElementsByTagName("option");
			for ( var i = 0; i < oStafor.length; i++) {
				oStafor[i].onclick = function() {
				};
			}
			var oData = document.getElementById('data');//获取右上角信息
			var oTopic = document.getElementById('topic');//获取网站名称图片
			var oContet = document.getElementById('content');//获取网站核心内容
			var oMask = document.getElementById('mask');//获取遮罩
			var oSource1 = document.getElementById('nosource');//获取提示一
			oData.style.display = 'block';
			oTopic.style.display = 'block';
			oContet.style.display = 'block';
			//oMask.style.display = 'none';
			//oSource1.style.display = 'none';
			function alertMess(count) { //显示提示一
				if (count == 4) {
					oMask.style.display = 'block';
					oSource1.style.display = 'block';
				}
			}

			/* function setPlan(num) {
				var oLi = document.getElementById('rapid')
						.getElementsByTagName('li');
				if (num == 1) {
					oLi[0].style.display = "block";
				} else if (num == 2) {
					oLi[2].style.display = "block";
				} else if (num == 3) {
					oLi[1].style.display = "block";
				} else {
					oLi[0].style.display = "none";
					oLi[1].style.display = "none";
					oLi[2].style.display = "none";
				}
			} */
			if (oStafor.length == 0) {
				alertMess(5);
				setPlan(num);
			} else {
				setPlan(num);
			}

		};
	</script>
</body>
</html>
