<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>云平台--修改密码</title>
<link href="<%=request.getContextPath()%>/user/css/base.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/user/css/password.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/jquery.hhh.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/user/js/jquery-2.1.3.min.js"></script>
</head>

<body>
	<div id='data'>
		<!--*************************************右上角********************************-->
		<div class="wel-user">
			<img src="<%=request.getContextPath()%>/user/images/agent%20-g.png">
		</div>
		<span>欢迎您 : <%=sesson.getAttribute("name")%>&nbsp;|</span><span><a
			href="<%=request.getContextPath()%>/userLogout.htm">注销登录&nbsp;</a> </span>|<span><a
			href="<%=request.getContextPath()%>/modPwd.htm">修改密码</a> </span>
	</div>
	<div id="topic">
		<a href="index.html" alt="云平台自助管理系统"></a>
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
		<div id="content-r">
			<form >
				<div id="xgmm">
					<div class="input">
						<!--  <a href="">当前密码:</a><input type="password" placeholder="请输入当前密码"
							id="input1" />
						-->
						<label>当前密码:</label> <input type="password" id="old" name="pwd"
							placeholder="请输入当前密码" onblur="check_old()"> <span
							class="notNull" style="display:none">当前密码不能为空!</span>

					</div>
					<div class="input">
						<!--  <a href="">新密码:</a><input type="password" placeholder="请输入密码"
							id="input2" />
						-->
						<label>新密码:</label> <input type="password" id="new" name="newpwd"
							placeholder="请输入密码" onblur="check_new()"> <span
							class="notNull" style="display:none">密码不能为空!</span>

					</div>
					<div class="input">
						<!--  <a href="">确认密码:</a><input type="password" placeholder="请输入密码"
							id="input3" />
						-->
						<label>确认密码:</label>
						<input type="password" id="new_again" placeholder="请输入密码"
							onblur="check_again()"> <span class="notNull"
							style="display:none">两次密码输入不一致!</span>
					</div>
					<span><button type="submit" value="保存" id="btn_submit" onclick="saveChange()">保存</button>
					</span>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
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
    	
    function turn() {
        var on_off = document.getElementById('on');
        on_off.onclick = function () {
            on_off.id = (on_off.id == "on") ? "off" : "on";
        };
    }
    //turn();
    function check_old(){
        if(old.value=="")
        {
            spans[0].style.display="block";
        }
        else
        {
            spans[0].style.display="none";
           	flag1=1;       
        }
    }
    function check_new(){
        if(new_one.value=="")
        {
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
            spans[2].style.display="block";
        }
        else
        {
            spans[2].style.display="none";
            flag3=1;
        }
    }
/*     var a="1";
    alert(a)
 	alert(md5(a)); */
  function saveChange(event){
      if(flag1==1 && flag2==1 && flag3==1)
      {
    	  var olTepPwd=document.getElementById("old").value;
    	  var newTepPwd=document.getElementById("new").value
    	  var newPwd=md5(newTepPwd);
    	  var oldPwd=md5(olTepPwd);
    	  alert('请等待服务器处理，不要刷新页面！');
    	 /*  alert(olTepPwd);
    	  alert(oldPwd); */
      		//初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="updatePwd.htm";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==1){
									alert('密码修改成功！');
								} 
								else if(data==0){
								 	alert('密码修改失败！');
								}
								window.location.href="<%=request.getContextPath()%>/userToAdm/updatePwd";
							}
						}
			};
			xhr.open("post", uri, true);alert(uri);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			
			xhr.send("oldPwd="+oldPwd+"&newpwd=" + newPwd);
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
