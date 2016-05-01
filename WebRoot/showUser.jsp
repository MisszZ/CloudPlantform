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
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

<title>Insert title here</title>
<script type="text/javascript" src="manage/js/jquery-1.7.2.js"></script>  

<style type="text/css">
	
	table{
		border: 1px solid gray;
	}
	td,th{
		border:1px solid gray;
		width: 60px;
	}
</style>
</head>
<body >
	<div >
		<table  >
			<tr>
				<th>email</th>
				<th>pwd</th>
			</tr>
			<c:forEach items="${users }" var="user">
				<tr>
					<td>${user['email'] }</td>
					<td>${user['pwd'] }</td>
				</tr>
			</c:forEach>
			
		</table>
		
	</div>
</body>
</html>
