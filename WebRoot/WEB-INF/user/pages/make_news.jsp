<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言板--云平台自助服务系统</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/user/css/base.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/user/css/make_news.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	//onchange : 当光标消失的时候，只能触发一次
	//ie : onpropertychange : 输入连续触发
	//标准：oninput : 也是连续触发
	window.onload = function() {
		var oDiv = document.getElementById('div1');
		var oP = oDiv.getElementsByTagName('p')[0];
		var oT = oDiv.getElementsByTagName('textarea')[0];
		var oA = oDiv.getElementsByTagName('a')[0];
		var message = document.getElementById('message');
		var ie = !-[ 1, ];
		var bBtn = true;
		var timer = null;
		var iNum = 0;
		oT.onfocus = function() {
			if (bBtn) {
				oP.innerHTML = '留言，还可以输入<span>200</span>字';
				bBtn = false;
			}
		};
		oT.onblur = function() {

			if (oT.value == '') {
				oP.innerHTML = '有意见或问题要私信给管理员，请留言~';
				bBtn = true;
			}
		};
		if (ie) {
			oT.onpropertychange = toChange;
		} else {
			oT.oninput = toChange;
		}
		function toChange() {
			var num = Math.ceil(getLength(oT.value) / 2);
			var oSpan = oDiv.getElementsByTagName('span')[0];

			if (!oSpan) {
				return
			}
			if (num <= 250) {
				oSpan.innerHTML = 250 - num;
				oSpan.style.color = '';
			} else {
				oSpan.innerHTML = num - 250;
				oSpan.style.color = '#F87266';
			}
			if (oT.value == '' || num > 250) {
				oA.className = 'dis';
			} else {
				oA.className = '';
			}
		}
		function getLength(str) {
			return String(str).replace(/[^\x00-\xff]/g, 'aa').length;
		}
		function sendMes(mesg){
			 $.ajax({ 
					type: "POST",
					url: "<%=request.getContextPath()%>/sendMes.htm",
					contentType:"application/x-www-form-urlencoded; charset=utf-8",
					data: {content:mesg}, 
					dataType:"json",
					success: function(data){
			        	window.location.href=window.location.href;
		      	}}); 
		}
		oA.onclick = function() {
			//alert(message.value);
			sendMes(message.value);
			if (this.className == 'dis') {
				clearInterval(timer);
				timer = setInterval(function() {

					if (iNum == 5) {
						clearInterval(timer);
						iNum = 0;
					} else {
						iNum++;
					}
					if (iNum % 2) {
						oT.style.background = 'red';
					} else {
						oT.style.background = '';
					}
				}, 100);
			} else {
				alert('发布成功！');
				window.location.href="<%=request.getContextPath()%>/readMesage.htm";
			}

		};

	};
</script>
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
			<div id="div1">
				<p class="liu_yan">有意见或问题要私信给管理员，请留言~</p>
				<textarea id="message"></textarea>
				<a class="dis" href="javascript:">发表</a>
			</div>
			<div id="info_list">
				<a href="#" id="detail">历史记录</a>
				<ul class="look_info">
					<c:forEach items="${mesList }" var="mesList">
						<c:if test="${mesList.target=='管理员' }">
							我
						</c:if>
						<c:if test="${mesList.target!='管理员' }">
							管理员
						</c:if>
						<li><span>></span>${mesList.content }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
