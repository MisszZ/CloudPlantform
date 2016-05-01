<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	HttpSession sesson = request.getSession();
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String oldpwd = (String) sesson.getAttribute("adminpwd");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/manage/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/jquery.hhh.js"></script>
<script
	src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js"
	type="text/javascript"></script>
</head>
<script type="text/javascript">
		function setAddTurn1(){
		alert('ceshi');
	}
</script>
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
					<input type="button" id="on" name="on" type="button" class="turnOn"
						style=" width:60px; height:30px;border:1px;">
				</form></li>
		</ul>
	</div>
	<div class="col-md-7">
		<form id="change_pass" name="change_pass">
			<div class="row pass">
				<div class="col-md-4" style="text-align: right">
					<label>请输入当前密码</label>
				</div>
				<div class="col-md-4 col-md-offset-1">
					<input type="password" id="old" name="pwd" onblur="check_old()">
					<span class="notNull" style="display:none">当前密码不能为空!</span>
				</div>
			</div>
			<div class="row pass">
				<div class="col-md-4" style="text-align: right">
					<label>请输入新密码</label>
				</div>
				<div class="col-md-4 col-md-offset-1">
					<input type="password" id="new" name="newpwd" onblur="check_new()">
					<span class="notNull" style="display:none">密码不能为空!</span>
				</div>
			</div>
			<div class="row pass">
				<div class="col-md-4" style="text-align: right">
					<label>再次输入新密码</label>
				</div>
				<div class="col-md-4 col-md-offset-1">
					<input type="password" id="new_again" onblur="check_again()">
					<span class="notNull" style="display:none">两次密码输入不一致!</span>
				</div>
			</div>
			<!--<button  type="button" class="btn btn-success">保存</button>-->
			<span class="btn-save"><input type="submit" value="保存"
				onclick="saveChange()">
			</span>
		</form>
	</div>
</div>
</body>

<div id="footer"></div>
<script>
    var old=document.getElementById('old');
    var new_one=document.getElementById('new');
    var new_again=document.getElementById('new_again');
    var spans=document.getElementsByClassName('notNull');
    var flag1= 0,flag2= 0,flag3= 0;
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
    function check_new(){
        if(new_one.value=="")
        {
        	alert('空');
            spans[1].style.display="block";
        }
        else
        {
            spans[1].style.display="none";
            flag2=1;
        }
    }
    function check_again(){
        if( new_again.value!=new_one.value )
        {
        	alert('不相等');
            spans[2].style.display="block";
        }
        else
        {
            spans[2].style.display="none";
            flag3=1;
        }
    }
  function saveChange(event){
      if(flag2==1 && flag3==1)
      {
    	  var olTepPwd=document.getElementById("old").value;
    	  var newTepPwd=document.getElementById("new").value
    	  var newPwd=md5(newTepPwd);
    	  var oldPwd=md5(olTepPwd);
      		//初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="adminResetPwd.htm";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==1){
									alert('密码修改成功！');
								} 
								else if(data==0)
								 	alert('密码修改失败或原密码输入错误！');
								window.location.href=window.location.href;
							}
						}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("newpwd=" + newPwd+"&oldpwd="+oldPwd);
		}
      else
      {
          alert('输入有误');
          event.preventDefalut();
          return false;
      }
  }
</script>
</body>
</html>