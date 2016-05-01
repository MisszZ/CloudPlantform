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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>协议</title>
<style>
#mask{
	background: #333;
	opacity: 0.80;
	filter:alpha(opacity=80);
	height: 950px;
	width: 100%;
	position: absolute;
	top:0;
	left: 0;
	z-index:-199;
	}
#content_main{
	width:684px;
	height:600px;
	background:#f1f1f1;
	z-index:999;
	margin:40px auto;
	border-radius:2px;
	}
#xy{
	background:#fff;
	width:684px;
	height:500px;
	margin:30px auto;
	}
#ty{
	width:684px;
	height:100px;
	background:#f1f1f1;
	margin:-30px auto;
	position:relative;
	}
#ty p{
	width:684px;
	height:30px;
	
	}
#ty p input{
	/*height:40px;
	line-height:40px;*/
	font-size:12px;
	font-weight:lighter;
	margin-left:440px;
	margin-top:5px;
	}
#ty p span{
	display:inline-block;
	width:230px;
	height:30px;
	line-height:30px;
	position:absolute;
	top:-2px;
	left:460px;
	}
#ty a{
	width:120px;
	/*border:1px solid red;*/
	height:50px;
	line-height:10px;
	font-family:inherit;
	font-size:16px;
	font-weight:bold;
	margin-left:550px;
	vertical-align:top;
	color:#333;
	text-decoration:none;
	}
#ty a span{
	display:block;
	height:50px;
	width:50px;
	margin-top:-5px;
	margin-left:555px;
	}
#ty a img{
	position:absolute;
	top:32px;
	left:605px;
	border:none;	
	}
</style>
</head>

<body>
<div id="mask"></div>
<div id="content_main">
	<div id="xy"></div>
	<div id="ty">
	<p><input type="checkbox"><span>我已阅读协议并同意协议内容</span></p>
    <a href="apply.html"><span>去申请</span><img src="images/jt1.png" width="50" height="50" /></a>
	</div>
</div>
</body>
</html>
