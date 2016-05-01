<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	session.setAttribute("token2", session.getAttribute("token1"));
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
<title>云平台--虚拟化资源申请</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/user/js/jquery-2.1.3.min.js"></script>
	
<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/Validation.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/user/js/apply.js"></script>
<!--<link href="css/jquery.ui.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/user/css/base.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/user/css/apply.css"
	rel="stylesheet" />
</head>
<body>
	<div id='data'>
		<!--*************************************右上角********************************-->
		<div class="wel-user">
			<img src="<%=request.getContextPath()%>/user/images/agent%20-g.png"
				alt=""/>
		</div>
		<span>欢迎您 : <%=sesson.getAttribute("name")%>&nbsp;|</span><span><a
			href="<%=request.getContextPath()%>/userLogout.htm">注销登录&nbsp;</a>|</span><span><a
			href="<%=request.getContextPath()%>/modPwd.htm">修改密码</a>
		</span>
	</div>
	<div id="topic">
		<a href="#" alt="云平台自助管理系统"></a>
	</div>
	<div id="content">
		<div class="nav">
			<!--------------------导航栏及下面的空白部分开始--------------------------------------->
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
		<!-------------------导航栏及下面的空白部分结束--------------------------------->
		<!-------------------申请表单部分开始------------------------------------------->
		<div class="content-r">
			<h1>
				<span>虚拟资源申请</span>
			</h1>
			<div id="main-content">
				<form method="post" name="form1" id="form1" action="">
					<!------------------------------申请表单第一部分开始------------------------------------------->
					<div class="container1">
						<ul class="container-left">
							<li id="li_first"><span>部门</span><input name="workplace"
								id="workplace" type="text" value="${userDepartment }"/>
								<div class="mes" id="msg1">该项不能为空</div>		
								</li>
							<li><span>申请人</span><input name="txtUserName" type="text"
								id="name" value=<%=session.getAttribute("name")%> />
								 <div class="mes" id="msg2">请正确填写申请人姓名</div>				 
								</li>
							<%-- <li><span>E-mail</span><input name="e-mail" type="text"
								id="email" value=<%=session.getAttribute("userEmail")%>> --%>
								
								<li><span>E-mail</span><input name="email" type="text"
								id="email" value=<%=session.getAttribute("userEmail")%>>
								<div class="mes msg" id="msg3">对不起，email错误</div>							
							</li>
						</ul>
						<ul class="container-right">
							<li id="li_second"><span>电话</span>
								<input name="phonenum"
									id="phone" type="text" value="${userphone }"/>
									 <div class="mes" id="msg4">对不起，请正确填写联系方式</div>
								</li>
							<li><span>申请日期</span><input name="data" type="text"
								id="time" value=<%=time%>></li>
							<li><span>使用时限</span><input name="datalength" id="timed"
								value="" type="text" style="width:30px;"/>个月
								<div class="mes" id="msg5">对不起，请填写合法时限(不超过12个月)</div>
								</li>
						</ul>
					</div>
					<!------------------------------申请表单第一部分结束------------------------------------------->
					<!------------------------------申请表单第二部分开始------------------------------------------->
					<div class="container2">
						<div class="inside">
							<span class="mustHave">所需配置</span>
									<input name="software" type="text"
									id="configuration" value="${configInfo }"/>								
						</div>						
						<div class="inside1" style="margin-top:10px;">
							<span style="margin-left:48px;">域名</span>
							<textarea id="domainName"  placeholder="如有对外开放的web服务，请填写您的域名。云平台提供形如xxx.csxupt.com的免费域名。如果你的web服务不是使用默认的80端口，请在域名后面加上端口号。"></textarea>
						</div>
						<div class="inside1" style="margin-top:10px;">
							<span style="margin-left:30px;margin-right:16px;margin-top:25px;">端口号</span>
								<textarea id="temPort" style="margin-top:15px;margin-left:-18px;" placeholder="Windows操作系统默认开放远程桌面3389管理端口，Linux操作系统默认开放ssh 22端口；如需开放额外端口请在此注明，格式为服务名+端口，如Mysql 3306。(如需多个端口，务必用逗号“，”隔开)"></textarea>
						</div>
						<div class="system" id="txt1" style="margin-top:15px;">
							<span>系统类型</span>
							<div id="select">
								<p id="btn_input" class="s_input"
									style="border:1px solid #D6D6D6;margin-left:5px;">==请选择操作系统==</p>
								<div class="triangle" id="btn_list"></div>
								<div class="note note1">提示：如果不选择，系统将为您提供默认操作系统</div>
								<ul class="select_list">
									<li><c:forEach items="${systemInfo }" var="systemList">
											<li>
												<label> 
													<input type="text" id="sel" name="sel" value="${systemList.systemType }" readonly="readonly" onclick="return selectSystem(this);"/>
												</label>
											</li>
										</c:forEach></li>

									<li><input type="text" class="define"
										style="border-bottom:1px solid #d6d6d6; " value="自定义系统类型"
										readonly="readonly" /></li>
								</ul>
							</div>
						</div>
						<div class="function" id="func">
							<span style="padding-right:5px;">用&nbsp;&nbsp;途</span>
							<textarea name="details" id="uses" style="margin-top:-5px;margin-left:-10px;"></textarea>
						</div>
					</div>
					<div class="container3" style="margin-top:13px;margin-left:110px;">
						<label
							onmouseover="document.getElementById('func').style.display='block';"
							onMouseOut="document.getElementById('func').style.display='none';">
						</label>
						<div id="div1" class="note" style="margin-top:60px;border:none;">提示：此为必填项,否则无法提交!</div>
					</div>
					<div class="handin">
						<button type="reset" value="重置" name="reset" id="reset">
							<a href="javescript:void(0);">重置</a>
						</button>
						<button type="submit" value="提交" name="submit" id="submit"
							>提交</button>
					</div>					
					<div id="shade" style="display:none;"></div>
					<div id="container" style="display:none;">
						<div id="submit_c">表单已提交，请您及时查看进度!</div>
					</div>
					<!------------------------------申请表单第二部分结束------------------------------------------->
				</form>
				<div id="fileDown">
					<button id="useMean1" onclick="loadFilesLinux()">虚拟化资源使用说明(Linux)</button>
					<button id="useMean2" onclick="loadFilesWids()">虚拟化资源使用说明(Windows)</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
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
    	var systemType=document.getElementById("sel").value;
		function selectSystem(o){
			systemType=o.value;
		}
		
		function loadFilesLinux(){
			window.location.href="<%=request.getContextPath()%>/loadFilesLinux.htm";
		}
		function loadFilesWids(){
			window.location.href="<%=request.getContextPath()%>/loadFilesWids.htm";
		}
  	function submitApply(){
    		// 初始化XMLHttpRequest对象
  		var xhr=createXMLHttpRequest();
    		// 服务器请求URl
       	var uri="<%=request.getContextPath()%>/applyResource.htm";
    	xhr.onreadystatechange=function(){
	 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 					var data = xhr.responseText;
								if(data==1) {
									alert('申请提交成功');
									window.location.href="<%=request.getContextPath()%>/userLookStatus.htm";
								}
								if (data == 0) {
								alert('申请提交失败');
									window.location.href=window.location.href;
								}
							}
						}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("department=" + document.getElementById("workplace").value
					+ "&name=" + document.getElementById("name").value
					+ "&temPort=" + document.getElementById("temPort").value
					+ "&phone=" + document.getElementById("phone").value
					+ "&time=" + document.getElementById("time").value
					+ "&timed=" + document.getElementById("timed").value
					+ "&domainName=" + document.getElementById("domainName").value
					+ "&configuration="
					+ document.getElementById("configuration").value
					+ "&systemType=" + systemType
					+ "&uses=" + document.getElementById("uses").value);
		};
	</script>
</body>
</html>
