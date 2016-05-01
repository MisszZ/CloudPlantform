<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>云平台--已申请资源信息</title>
<link href="<%=request.getContextPath()%>/user/css/base.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/user/css/information.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/user/js/jquery-2.1.3.min.js" type="text/javascript"></script>

</head>

<body>
	<!--*************************************右上角内容开始********************************-->
	<div id='data'>
		<div class="wel-user">
			<img src="<%=request.getContextPath()%>/user/images/agent%20-g.png">
		</div>
		<span>欢迎您 : <%=sesson.getAttribute("name")%>&nbsp;|</span><span><a
			href="<%=request.getContextPath()%>/userLogout.htm">注销登录&nbsp;</a> |</span><span><a
			href="<%=request.getContextPath()%>/modPwd.htm">修改密码</a> </span>
	</div>
	<!--*************************************右上角内容结束********************************-->
	<div id="topic">
		<img src="<%=request.getContextPath()%>/user/images/n.jpg">
	</div>
	<!--云平台图片-->
	<div id="content">
		<!--*************************************导航栏内容开始********************************-->
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
		<!--*************************************导航栏内容结束********************************-->
		<!--*************************************界面主内容开始********************************-->
		<div id="content-r" style="display:block;">
			<img src="<%=request.getContextPath()%>/user/images/small.png" width="100" height="95">
			<div id="infor-bg">
                <h1>已申请虚拟资源信息</h1>
                <div class="fbody" style="margin-top:30px;">
                    <label class="li_bg">虚机名称</label>
                    <!--<div class="DivSelect">-->
                    <select id="test" class="sendRequest">
                        <c:forEach items="${nameInfo }" var="nameInfo">
							<option >${nameInfo.machineName }</option>
						</c:forEach>
                    </select>
                   </div>
                <div class="fbody"> 
                    <label class="li_bg" for="uses">用途</label>
                    <input type="text" value="${info.uses }" id="uses" readonly="readonly"/>
                    </div>
                <div class="fbody"> 
                    <label class="li_bg" for="usedata">使用日期</label>
                    <input type="text" value="${info.time }至${info.timed}" id="usedata" readonly="readonly"/>
                    </div>
                <div class="fbody">
                    <label class="li_bg" for="systemtype">操作系统</label>
                    <input type="text" value="${info.systemType }" id="systemtype" readonly="readonly"/>
                </div>
                <div class="fbody">
                    <label class="li_bg" for="portnum">虚机配置</label>
                    <input type="text" value="${info.configuration }" id="portnum" readonly="readonly"/>
                </div> 
	            <!-- <c:if test="${info.domainName!=null}">
		                <div class="fbody">
		                    <label class="li_bg" for="portin">域名</label>
		                    <input type="text" value=${info.domainName } id="domainName" readonly="readonly"/>
		                </div>
		            </c:if> 
	             <div class="fbody">
	                    <label class="li_bg" for="portin">外网IP</label>
	                    <input type="text" value="${info.outIp }" id="portin" readonly="readonly"/>
	                </div>
                <div class="fbody">
                    <label class="li_bg" for="portin">外端口号</label>
                    <input type="text" value="${info.outPortTrue }" id="portin" readonly="readonly"/>
                </div> 
                <div class="fbody">
                    <label class="li_bg" for="portout">内端口号</label>
                    <input type="text" value="${info.inPortTrue }" id="portout" readonly="readonly"/>
                </div>
                -->
                <table id="table2" name="mytable">
                	<tr class="fbody">
                		<th>域名</th>
                		<th>外网IP</th>
                		<th>外端口号</th>
                		<th>内端口号</th>
                	</tr>
                <tbody>
	                	<c:forEach items="${someInfoOfMa }" var="someInfoOfMa">
							<tr class="fbody">
		                		<td>${someInfoOfMa.domainName }</td>
		                		<td>${someInfoOfMa.outIp }</td>
		                		<td>${someInfoOfMa.outPortTrue }</td>
		                		<td>${someInfoOfMa.inPortTrue }</td>
	               			</tr>
						</c:forEach>
               		</tbody> 
                </table>
                </div>
          	</div>
		</div>
		<div id="content-r2">
       	<div class="cd-popup" role="alert"></div>
			<div class="cd-popup-container">
				<p>亲，您还没有申请资源，要去申请吗?</p>
				<ul class="cd-buttons">
					<li><a href="<%=request.getContextPath()%>/userApplyRes.htm">是</a></li>
					<li><a href="#">否</a></li>
				</ul>
			<!--<a href="#" class="cd-popup-close img-replace">关闭</a>-->
			</div> <!-- cd-popup-container -->
		</div>
		<!-- cd-popup -->
	</div>
	<!--*************************************界面主内容结束********************************-->
<script type="text/javascript">

	var xmlhttp;
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
	 var  myselect=document.getElementById("test").value;
	 
	 function getInfo(){
   		 var select = document.getElementById("test");
    	 select.onchange = function(){
		          	//初始化XMLHttpRequest对象
		    		var xhr=createXMLHttpRequest();
		    		//服务器请求URl
		    		var uri="<%=request.getContextPath()%>/getMachineInfo.htm?machineName="+select.value+"";
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4){
							if (xhr.status == 200 || xhr.status == 304){
								var data = xhr.responseText;
								var json = $.parseJSON(data);
								var oTB = document.getElementById("table2");
								var oTr = oTB.getElementsByTagName('tr');
								//清空表格原有数据
								for(i=1;i<oTB.rows.length;i++){
			 						oTr[i].style.display="none";
								}
								//创建tbody节点，表格中必须有tbody才能添加，直接添加tr不成功
							    var tbody = document.createElement("tbody");
								
								var info=json.length;
								if(info>0){
								for(var i=0;i<info;i++){
									var row = oTB.insertRow(oTB.rows.length);
								    row.insertCell(0).innerHTML =json[i].domainName; 
									row.insertCell(1).innerHTML =json[i].outIp;
									row.insertCell(2).innerHTML =json[i].outPortTrue; 
									row.insertCell(3).innerHTML =json[i].inPortTrue; 
								} 
							}
								
								var item;
								$.each(json, function(i, json) {
									item1 = json['uses'];
									$('#uses').val(item1);
									item2 = json['time']+"至"+json['timed'];
									$('#usedata').val(item2);
									item3 = json['systemType'];
									$('#systemtype').val(item3);
									item4 = json['configuration'];
									$('#portnum').val(item4);
									item5 = json['inPortTrue'];
									$('#portin').val(item5);
									item6 = json['outPortTrue'];
									$('#portout').val(item6);
									item7 = json['domainName'];
									$('#domainName').val(item);
								});
							};
						};
					};
					xhr.open("get", uri, true);
					xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded;c8arset=utf-8");	
					xhr.send();
    	};
	};
	
	window.onload=function(){
	getInfo();
	var oTest=document.getElementById("test").getElementsByTagName("option");
	var oTent1=document.getElementById('content-r');
	var oTent2=document.getElementById('content-r2');
	oTent1.style.display='none';
	oTent2.style.display='none';
	function setContent(num){
		if(num==1)
		{
		oTent1.style.display='none'	;
		oTent2.style.display='block';
			}
		else if(num==2)
		{
		oTent1.style.display='block';
		oTent2.style.display='none';
			}
	}
	if(oTest.length == 0){
				setContent(1);
			}
			else{
				setContent(2);
			}
		
			////参数为1时，首次申请，参数为2时，查看已申请资源的信息
};
	 
	 
	 
		
</script>
</body>
</html>
