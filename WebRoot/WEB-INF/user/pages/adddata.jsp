<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	HttpSession sesson = request.getSession();
%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>云平台--虚拟化资源续期</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/user/css/adddata.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/user/css/base.css" />
<link href="<%=request.getContextPath()%>/user/css/speed.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/jquery-2.1.3.min.js"></script>
</head>

<body>
<div id='data'>
    <!--*************************************右上角********************************-->
    <div class="wel-user">
        <img src="<%=request.getContextPath()%>/user/images/agent%20-g.png" />
    </div>
    <span>欢迎您 : <%=sesson.getAttribute("name")%>&nbsp;|</span><span><a href="<%=request.getContextPath()%>/userLogout.htm">注销登录&nbsp;</a>|</span><span><a href="<%=request.getContextPath()%>/modPwd.htm">修改密码</a></span>
</div>
	<div id="topic"><a href="index.html" alt="云平台自助管理系统"></a></div>
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
    	<c:if test="${empty info}">
		  	<div id="mask"></div>
			<div id="nosource" style="display:block;">
			<span>对不起，您还没有申请任何资源！</span><br />
   			<a href="<%=request.getContextPath()%>/userApplyRes.htm"><button><span>申请</span></button></a>
    		</div>
		</c:if>
		<c:if test="${!empty info}">
	        <div id="content-r">
	        <div class="laba"><img src="<%=request.getContextPath()%>/user/images/lb1.png"/></div>
	        <h1>虚拟资源续期</h1>
	        	<table id="table1">
	            	<tr>
	                	<th>虚机名称</th>
	                    <th>到期日期</th>
	                    <th>续期是否</th>
	                    <th class="data_length">续期时限</th>
	                </tr>
	                <c:forEach items="${info }" var="info" >
		                <tr>
		                <td>${info.machineName }</td>
		                <td class="add_data">${info.timed }</td>
			                <td class="data_length">
				                 <select id="test" class="select">
				                    <option value="一个月">一个月</option>
				                    <option value="三个月">三个月</option>
				                    <option value="六个月">六个月</option>
				                    <option value="十二个月">十二个月</option>
				            	 </select>
			                 </td>
		                 <td><a id="addTime" href="" class="btn">续期</a></td>
		                </tr>
					</c:forEach>
				 </table>
	        </div>
        </c:if>
        <div style="display:none;">
        	<input id="addTimeState" value="${addTimeStat }"/>
        </div>
   </div>
<script type="text/javascript">
	var addTimeStat=document.getElementById('addTimeState').value;
	function addDate(obj,num){
	    	//不可以续期时的效果
	        if(num==0){
	            oSelect[obj.index].setAttribute("disabled",true);
	            oSelect[obj.index].style.background="#f1f1f1";
	            oSelect[obj.index].parentNode.style.background="#f1f1f1";
	            oA[obj.index].parentNode.style.background="#f1f1f1";
	            oA[obj.index].onclick=function(){
	                return false;
	            }
	        }else{//可以续期时的效果
	            oSelect[obj.index].removeAttribute("disabled");
	            oSelect[obj.index].style.background="#fff";
	            oSelect[obj.index].parentNode.style.background="#fff";
	            oA[obj.index].parentNode.style.background="#fff";
	            oA[obj.index].onclick=function(){
	            }
	        }
	}
	window.onload=function(){
	    oTable=document.getElementById("table1");
	    oTr=oTable.getElementsByTagName("tr");
	    oA=oTable.getElementsByTagName("a");
	    oSelect=oTable.getElementsByTagName("select");
	    //初始化所有的select,a让其都点击都无效
	    for(var i=0;i<oTr.length;i++) {
	        oTr[i].index = i;
	        oSelect[i].setAttribute("disabled",true);
	        oSelect[i].style.background="#f1f1f1";
	        oSelect[i].parentNode.style.background="#f1f1f1";
	        oA[i].parentNode.style.background="#f1f1f1";
	        oA[i].onclick=function(){
	            return false;
	        }
			addDate(oTr[i],addTimeStat);//参数的含义，第一个是要让哪行的可以续期是否，第二个参数为0时不可以续期
	    }
	}
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
	var temp="一个月";
	var flag=0;
	var oSel=document.getElementById("table1").getElementsByTagName("select");
	var oBtn=document.getElementById("table1").getElementsByTagName("a");
	
	for(var i=0;i<oSel.length;i++){
		 oSel[i].index=i;
		 function sendData(data1,data2){
				//初始化XMLHttpRequest对象
				var xhr=createXMLHttpRequest();
				//服务器请求URl
				var uri="<%=request.getContextPath()%>/applyAddDate.htm?machineName="+data1+"&newTime="+data2+"";
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4){
						if (xhr.status == 200 || xhr.status == 304){
							var data = xhr.responseText;
							if(data==1){
								alert('已经续期不能再次提交续期申请');
								window.location.href=window.location.href;
							}
							if(data==2){
								alert('续期成功');
								window.location.href="lookResource.htm";
							}
							if(data==3){
								alert('续期失败');
								window.location.href=window.location.href;
							}
							window.location.href=window.location.href; 
						};
					};
				};
				xhr.open("post", uri, true);
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");	
				xhr.send(null); 
		}
	}
	for(i=0;i<oSel.length;i++){
		
			oSel[i].index=i;	
			var flag=0;
			oSel[i].onchange=function(){
				var oTxt=null;
				oTxt=this.value;
				flag=1;
				var btn = this.parentNode;
		        var trs = btn.parentNode;
		        var machineName=trs.cells[0].innerHTML;
				oBtn[this.index].onmousedown=function(){
					temp=oTxt;
					sendData(machineName,temp);
					oSel[this.index].style.disabled=false;
					btn.style.background="#f1f1f1";
					oBtn[this.index].parentNode.style.background="#f1f1f1";
				};
			};
			if(flag==0){
				
				oBtn[i].index=i;
				oBtn[i].onmousedown=function(){
					var machineName=this.parentNode.parentNode.cells[0].innerHTML;
					var temp = "一个月";
					if(addTimeStat==0){
						alert("不能续期");
					}else{
						sendData(machineName,temp); 
					}
					
				};
			};
	 	}
</script>
</body>
</html>
