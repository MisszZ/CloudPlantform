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
    <title>删除申请</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/manage/js/common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js"></script>
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
				<li><a
					href="<%=request.getContextPath()%>/userInfo.htm">用户操作</a>
				</li>
				<li id="btn-zy" style="cursor:pointer">资源信息</li>
				<div id="zycz" style="display:none">
					<a href="<%=request.getContextPath()%>/searchResource.htm">查询修改</a> <a
						href="<%=request.getContextPath()%>/addMachineType.htm">虚机模板录入</a>
				</div>
				<li><a href="<%=request.getContextPath()%>/addPerMacNum.htm">录入账号</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/RejectApplyList.htm">删除申请</a>
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
							<input id="tempStatus" value="${addTimeStat }"/>
						</div>
						<input type="button" id="on" name="on" type="button" class="turnOn"
							style=" width:60px; height:30px;border:1px;">
					</form></li>
			</ul>
    </div>
    <div class="col-md-7">
    	<c:if test="${empty rejectedApplyList}">
		  	<div id="mask"></div>
			<div id="nosource" style="display:block;">
			<span>暂时没有需要删除用户！</span><br />
    		</div>
		</c:if>
		<c:if test="${!empty rejectedApplyList}">
	        <div id="del">
	        	<form id="del" action="" method="method">
		            <div id="del_head">
		                <label>
		                    <input id="check_all" type="checkbox"/>
		                </label>全选
		                <a class="delBut" href="javascript:delMulti()">删除</a>
		            </div>
		            <table id="delete" cellspacing="0" cellpadding="0">
		                <tr style="width: 50px">
		                    <th>选择</th>
		                    <th>姓名</th>
		                    <th>邮箱</th>
		                    <th>申请日期</th>
		                    <th>拒绝理由</th>
		                    <th>删除</th>
		                </tr>
		                <c:forEach var="info" items="${rejectedApplyList}">
			                <tr>
			                    <td><input class="box" type="checkbox" name="emailList" value="${info.email}"/></td>
			                    <td>${info.name }</td>
			                    <td >${info.email }</td>
			                    <td>${info.time }</td>
			                    <td>${info.reason }</td>
			                    <td>
			                        <button onclick="delOne(this)">删除</button>
			                    </td>
			                </tr>
		                </c:forEach>  
	           		 </table>
	           	</form>
	        </div>
       </c:if>
    </div>
    
    <div id="footer">
    <!--  <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus" title="Dismissible popover" data-content="And here's some amazing content. It's very engaging. Right?">可消失的弹出框</a>-->
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
    	}
    	function delEmailInfo(infos,urls){
    			alert(infos);
				//初始化XMLHttpRequest对象
				var xhr=createXMLHttpRequest();
				//服务器请求URl
				var uri=urls;
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4){
						 if(xhr.status==200||xhr.status==304){
						 	var data = xhr.responseText;
							if(data==1) 
								{alert('删除成功！');}
							else{
								alert('删除失败！');
							}
							window.location.href=window.location.href;
						  }
					  }
				 };
				xhr.open("POST", uri, true);
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xhr.send("emailList="+infos);
    	}
	function delOne(email){
				var userEmail=email.parentNode.parentNode.getElementsByTagName('td')[2].innerHTML;
				var time=email.parentNode.parentNode.getElementsByTagName('td')[3].innerHTML;
		  		var sure=window.confirm("确定要删除？");
		  		if(sure){
		  			delEmailInfo(userEmail,"delRejApplyOne.htm");
				}else{
					alert("请先选择要删除的记录！");
				}
		}
	var idsObj =document.getElementsByName("emailList");
	function delMulti(){
		var s='';
		var flag=false;
		for(var i=0; i<idsObj.length; i++){ 
			if(idsObj[i].checked){
				s+=idsObj[i].value; //如果选中，将value添加到变量s中
				s+=',';
				flag=true;
			} 	
		} 
		if(flag){
			var sure=window.confirm("确定要删除？");
		  	if(sure){
		  		delEmailInfo(s,"delMutRejApply.htm");
			}	
			}else{
				alert("请选择要删除的记录");
			}
		}
	var emails='';
	var nums=0;
	document.getElementById("check_all").onclick=function(){
		var selBut=document.getElementById("check_all");
		if(nums==0){
			for(var i=0; i<idsObj.length; i++){ 
					idsObj[i].checked=true;
					emails+=idsObj[i].value; //将value添加到变量s中
					emails+=',';
			} 
			nums=1;
		}else{
			for(var i=0; i<idsObj.length; i++){ 
				idsObj[i].checked=false;
				emails=''; //将emials清空
			} 
			nums=0;
		}
	}
</script>
</html>