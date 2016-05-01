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
    <title>云平台自助服务系统</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/manage/js/script.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/manage/js/jquery.hhh.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/index.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css"/>
</head>
<script type="javascript">

    function validateSubmit() {
        var username = document.getElementById("");
    }
</script>

<!--[if It IE 9]>-->
<script>
    (function () {
        if (!
                        0) return;
        var e = "abbr, article, aside, audio, canvas, datalist, details, dialog, eventsource, figure, footer, header, hgroup, mark, menu, meter, nav, output, progress, section, time, video".split(', ');
        var i = e.length;
        while (i--) {
            document.createElement(e[i]);
        }
    });
</script>
<body>
<!--页面展示部分-->
<div class="row">
    <div id="btnLogin" class="col-md-1 col-md-offset-10">
        <a>登录</a>
    </div>
    <div id="btnZc" class="col-md-1 col-xs-offset-0">
        <a>注册</a>
    </div>
</div>
<!--页面隐藏部分-->
<div id="mask" style="display:none"></div>
<!--登录注册部分-->
<div id="content" style="display:none">
    <div id="close"><img src="<%=request.getContextPath()%>/manage/images/close1.png" alt=""></div>
    <!--关闭按钮-->
    <div id="login-tit" class="login-tit ">                     <!--点击选项-->
        <ul>
            <li class="btn-login">登录</li>
            <li class="btn-zhuce">注册</li>
        </ul>
    </div>
    <div id="login-con" class="login-con">
        <div id="mod1" class="mod">        	
	            <form id="form1" >
	                <div id="EM">
	                    <img class="mail-pic" src="<%=request.getContextPath()%>/manage/images/email.png" alt="">
	                    <input id="mail-input" type="text" placeholder="请输入登录邮箱" name="email" autocomplete="off" onblur="check_mail()">
	                    <span class="notNull" style="display: none">邮箱不能为空！</span>
	                    <span class="isRight" style="display: none">邮箱格式不正确！</span>
	                </div>
	                <div id="PA">
	                    <img class="key-pic" src="<%=request.getContextPath()%>/manage/images/unlock.png" alt="">
	                    <input id="pass-input" type="password" placeholder="请输入密码" name="pwd" autocomplete="off" onblur="check_password()">
	                    <span class="notNull" style="display: none">密码不能为空！</span>
	                </div>
	                <div id="tijiao">
	                	<span id="checked">            	
		                    <input type="radio" name="users" value="0"  id="user" checked="checked"/>
		                    <label for="user">用户</label>
							&nbsp;
		                    <input type="radio" name="users" value="1" id="manage"/>
						    <label for="manager">管理员</label>     
	                	</span>
	                	<!--<span id="forget_key"><a href="">忘记密码</a></span>-->
	                	<span class="buttons"><input type="button" value="登录" id="denglu" onclick="mySubmit()"/></span>	
	                </div>
	            </form>           
        </div>
        <form id="zhuce">
        <div id="mod2" class="mod" style="display:none" >
            	
            	<div id="userName">
	                <img class="name-pic" src="<%=request.getContextPath()%>/manage/images/agent.png" alt="">
	                <input id="name-input" type="text" placeholder="请输入姓名" name="name" autocomplete="off" onblur="check_name()">
	                <span class="notNull" style="display: none">姓名不能为空！</span>
	                <span class="isRight" style="display: none">姓名格式不正确！</span>
            	</div>
	            <div id="Zem">
	                <img class="em-pic" src="<%=request.getContextPath()%>/manage/images/email.png" alt="">
	                <input id="em-input" type="text" placeholder="请输入邮箱" name="email" autocomplete="off" onblur="check_em()">
	                <span class="notNull" style="display: none">邮箱不能为空！</span>
	                <span class="isRight" style="display: none">邮箱格式不正确！</span>
	            </div>
            	<span class="buttons"><input type="button" value="注册" onclick="validataform()"/></span>
            
       </div>
       </form>
    </div>
</div>
<!--登录注册部分-->
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
	
    var mail = document.getElementById('mail-input');
    var pass = document.getElementById('pass-input');
    var notNull = document.getElementsByClassName('notNull');
    var em = document.getElementById('em-input');
    var na = document.getElementById('name-input');
    var a = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    var b = /^[0-9]*$/;
    var isRight = document.getElementsByClassName('isRight');
    var flag1= 0,flag2= 0,flag3= 0,flag4=0;
    function check_mail(){
        if (mail.value == "") {
            notNull[0].style.display = "block";
        }
        else {
            notNull[0].style.display = "none";
        }
        if (mail.value.length>0 && a.test(mail.value) == false) {
            isRight[0].style.display = "block";
        }
        else {
            isRight[0].style.display = "none";
        }
    }
    function check_password(){
        if (pass.value == "") {
            notNull[1].style.display = "block";
        }
        else {
            notNull[1].style.display = "none";
        }
    }
    function check_name() {
        if (na.value == "") {
            notNull[2].style.display = "block";
            flag1=0;
        }
        else {
            notNull[2].style.display = "none";
            flag1=1;
        }

        if (na.value.length>0 && b.test(name.value) == true) {
            isRight[1].style.display = "block";
            flag3=0;
        }
        else {
            isRight[1].style.display = "none";
            flag3=1;
        }


    }
    function check_em(){
        if (em.value == "") {
            notNull[3].style.display = "block";
            flag2=0;
        }
        else {
            notNull[3].style.display = "none";
            flag2=1;
        }
        if (em.value.length>0 && a.test(em.value) == false) {
            isRight[2].style.display = "block";
            flag4=0;
        }
        else {
            isRight[2].style.display = "none";
            flag4=1;
        }
    }
    function validataform(){
        if(flag1==1 && flag2==1 && flag3==1 && flag4==1)
        {
        	//初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="<%=request.getContextPath()%>/activation.htm";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;	
								if(data==0) 
									alert('该账号不存在');
								else if(data==1)
									alert('密码已经发送到您的邮箱，请登录邮箱查看');
		 					}
		 				}
		 			};
    		xhr.open("POST",uri,true);
    		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    		xhr.send("name="+document.getElementById("name-input").value+"&email="+document.getElementById("em-input").value);
    	}
        else
        {
            alert('您的输入有误！');
        }
    }
    function mySubmit(){
    	var email=document.getElementById("mail-input").value;
    	var tepPwd=document.getElementById("pass-input").value;
		var radionum = document.getElementsByName('users');
        var denglu = document.getElementById('denglu');
        var form1 = document.getElementById('form1');
        var pwd=md5(tepPwd);
        var radionum=document.getElementsByName("users");//不能getElementById，ById又只会读数组第一个值
		var sexid;
 		for(var i = 0; i < radionum.length; i++)
		{
     		if(radionum[i].checked)
     		sexid=i;
		}
        if(sexid==1)	
        {   
            //初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="<%=request.getContextPath()%>/adminLogin.htm";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==0){
									alert('账号或密码错误');
								 	//window.location.href=window.location.href;
								 }
								if(data==1){
									window.location.href="<%=request.getContextPath()%>/adminCheckApply.htm";
								}
		 					}
		 				}
		 			};
    		xhr.open("POST",uri,true);
    		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    		xhr.send("email="+email+"&pwd="+pwd);
        };
        if(sexid==0)
        {
            //初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="<%=request.getContextPath()%>/userLogin.htm";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==0){
									alert('账号或密码错误');
									//window.location.href=window.location.href;
								}
								else if(data==1){
									window.location.href="<%=request.getContextPath()%>/userLookStatus.htm";
								};
		 					};
		 				};
		 			};
    		xhr.open("POST",uri,true);
    		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    		xhr.send("email="+email+"&pwd="+pwd);
        };
    }
</script>
</body>
</html>