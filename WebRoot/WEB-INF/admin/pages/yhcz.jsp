<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	HttpSession sesson = request.getSession();
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String oldpwd=(String)sesson.getAttribute("adminpwd");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户操作</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css"/>
    <script src="<%=request.getContextPath()%>/manage/js/common.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/manage/js/jquery-2.1.3.min.js" type="text/javascript"></script>
<style>
	.col-md-6 {
		width: 60%;
	}
	.dddd{
		color:red;
	}
</style>
</head>
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
							<input id="tempStatus" value="${addTimeStat }" />
						</div>
						<input type="button" id="on" name="on" type="button"
							class="turnOn" style=" width:60px; height:30px;border:1px;">
					</form>
			</li>
		</ul>
	</div>
	<div class="col-md-7">
		<div id="con-right">
			<div id="yhcz">
				<div>
					<form id="myform">
						<div id="find-add">
							<input type="text" name="name" id="username"
								class='search-input-text' placeholder='输入要查询人的姓名'> <input
								type="button" value="查询" class='search-input-button'
								id="search-input-button" onclick="find()" /> <input
								type="button" value="添加用户" id="add-users" class="add-users"
								onclick="add()" />
						</div>
					</form>
					<div id="userInfo">
						<table id="mytable" width="780px">
							<tr>
								<td>姓名</td>
								<td>E-MAIL</td>
								<td>操作</td>
							</tr>

							<c:forEach items="${info }" var="info">
								<tr>
									<%-- <td><input style="text" value="${info.name}"></td>
									<td><input style="text" value="${info.email}"></td> --%>
									<td>${info.name}</td>
									<td>${info.email}</td>
									<td><button class="mydelete" name="mydelete"
											onclick="delUser()">删除</button>
										<button class="reset" name="reset">重置密码</button></td>
								</tr>
							</c:forEach>

						</table>
					</div>
				</div>
				<table id="test">
				</table>
				<div id="mask" style="display:none"></div>

				<div id="entering" style="display:none">
					<form id="addUerForm" name="add_users" method="post">
						<span>录入用户</span>
						<hr/>
						<label>姓名</label><input type="text" name="name" id="name"
							autocomplete="off"><br /> <label>邮箱</label><input
							type="text" name="email" id="email" autocomplete="off"><br />
						<button id="btn-sure">确定</button>
						<button id="btn-cancel">取消</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="footer"></div>
</body>
<script type="text/javascript">
	    var zy = document.getElementById('btn-zy');
	    var zycz = document.getElementById('zycz');
	    var initializationTime = (new Date()).getTime(); 
	    var del = document.getElementsByName('mydelete');
	    var mods = document.getElementsByName('mychange');
	    var reset = document.getElementsByName('reset');
	    var modify = document.getElementById('modify-form');
	    var Omask = document.getElementById('mask');
	    var Oenter = document.getElementById('entering');
	    var my_btn_sure = document.getElementById('btn-sure');
	    var my_btn_cancel = document.getElementById('btn-cancel');
	    var found = document.getElementById('search-input-button');
	    var myTable=document.getElementById('mytable');
	    var findTable =document.getElementById('find-table');
	    function $(id) {
	        return typeof id === 'string' ? document.getElementById(id) : id;
	    }
	    function showLeftTime() {			//系统时间
	        var now = new Date();
	        var year = now.getFullYear();
	        var month = now.getMonth();
	        var day = now.getDate();
	        var hours = now.getHours();
	        var minutes = now.getMinutes();
	        var seconds = now.getSeconds();
	        // document.all.show.innerHTML=""+year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
	        //一秒刷新一次显示时间
	        var timeID = setTimeout(showLeftTime, 1000);
	    }
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
	    	};    	
	    	function delUser(t){
	    				alert(t);
	    				var xhr=createXMLHttpRequest();
			    		//服务器请求URl
			    		var uri="adminDeleteUser.htm?userEmail="+t+"";
			    		xhr.onreadystatechange=function(){
					 				if(xhr.readyState==4){
					 					if(xhr.status==200||xhr.status==304){
					 						var data = xhr.responseText;
					 						if(data==1){
					 							alert("删除用户成功");
					 							window.location.href=window.location.href;
					 						}
					 						if(data==0){
					 							alert("删除用户失败");
					 							window.location.href=window.location.href;
					 						}
					 					}
					 				}
					 			};
			    		xhr.open("POST",uri,true);
			    		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			    		xhr.send();
	    	}
		    for (var i = 0; i < del.length; i++)		//删除操作
		    {
		        del[i].onclick = function () {
		            var con = confirm('确定删除该用户？');
		            if (con == true) {
		                var btn = this.parentNode;
		                var trs = btn.parentNode;
		                
		                var tvalue=trs.cells[1].innerHTML;
		                delUser(tvalue);
		                //alert(tvalue);
		                //trs.parentNode.removeChild(trs);
			    	}
		           };
		    }
		function initUserPwd(temp){
			var xhr=createXMLHttpRequest();
			    		//服务器请求URl
			    		var uri="adminInitUserPwd.htm?userEmail="+temp+"";
			    		xhr.onreadystatechange=function(){
					 				if(xhr.readyState==4){
					 					if(xhr.status==200||xhr.status==304){
					 						var data = xhr.responseText;
					 						if(data==1){
					 							alert("重置密码成功");
					 						}
					 						if(data==2){
					 							alert("重置密码失败");
					 						}
					 					}
					 				}
					 			};
			    		xhr.open("POST",uri,true);
			    		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			    		xhr.send();
		}
	    for (var i = 0; i < reset.length; i++)	//密码重置
	    {
	        reset[i].onclick = function () {
	            var con = confirm('确定将密码重置？');
	            if (con == true) {
	            	var btn = this.parentNode;
	                var trs = btn.parentNode;
	                var tvalue=trs.cells[1].innerHTML;
	                alert(tvalue);
	                initUserPwd(tvalue);
	            }
	        };
	    }
	    function find() {
	 	    var info=document.getElementById("username").value; 
	 	    if(info==""||info==null){
	 	    	window.location.href=window.location.href;
	 	    }else{
		    //初始化XMLHttpRequest对象
	    		var xhr=createXMLHttpRequest();
	    		//服务器请求URl
	    		var uri="adminSearchByName.htm?time="+new Date()+"";
	    		//alert(uri);
	    		xhr.onreadystatechange=function(){
			 				if(xhr.readyState==4){
			 					if(xhr.status==200||xhr.status==304){
			 						var data = xhr.responseText;
			 						if(data.length>2){
			 							//清除表记录
			 							var tab = document.getElementById("mytable");
				 						var oTr = tab.getElementsByTagName('tr');
				 						for(i=1;i<oTr.length;i++){
			 								oTr[i].style.display="none";
			 							} 
			 						} 
									var json = jQuery.parseJSON(data); 	 						
									var oTB = document.getElementById("mytable");
									var oTR = oTB.insertRow(oTB.rows.length);
									jQuery.each(json, function(i, json) {
										var oTD1 = oTR.insertCell(0);
										oTD1.innerHTML=json['name'];
										var oTD2 = oTR.insertCell(1);
										oTD2.innerHTML=json['email'];
										var oTD3 = oTR.insertCell(2);
										oTD3.innerHTML ="<button name='mydelete'  onclick='dell(this)' style='color:red'>删除</button><button name='mydelete' onclick='initPwd(this)'>重置密码</button>";
									});
			 					}
			 				}
			 			};
		    		xhr.open("POST",uri,true);
		    		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		    		xhr.send("username="+document.getElementById("username").value);
	    		}
	    	}
	   
	   
	   function dell(o){
	   		//alert(o);
	   			var btn = o.parentNode;
	            var trs = btn.parentNode;
	            var tvalue=trs.cells[1].innerHTML;
	            //alert(tvalue);
	            delUser(tvalue);
	   			var oTB = document.getElementById("mytable");
				var oDel = o.parentNode.parentNode.sectionRowIndex;
				oTB.deleteRow(oDel);
			}
	   function initPwd(o){
	   			var btn = o.parentNode;
	            var trs = btn.parentNode;
	            var tvalue=trs.cells[1].innerHTML;
	            alert(tvalue);
	            initUserPwd(tvalue);
	   }
	   
	    function add() {
	        var oHeight = document.documentElement.scrollHeight;
	        var oWidth = document.documentElement.scrollWidth;
	        Omask.style.display = "block";
	        Omask.style.color = "red";
	        Omask.style.height = oHeight + "px";
	        Omask.style.width = oWidth + "px";
	        Oenter.style.display = "block";
	    }
	    Omask.onclick = my_btn_cancel.onclick = function (event) {
	        Omask.style.display = "none";
	        Oenter.style.display = "none";
	        event.preventDefault();
	    };
	    my_btn_sure.onclick = function (event) {
	        var con1 = confirm('确定要添加该用户？');
	        if (con1 == true) {
	        	//初始化XMLHttpRequest对象
	    		var xhr=createXMLHttpRequest();
	    		//服务器请求URl
	    		var uri="<%=request.getContextPath()%>/adminAddUser.htm?time="+new Date()+"";
	    		xhr.onreadystatechange=function(){
			 				if(xhr.readyState==4){
			 					if(xhr.status==200||xhr.status==304){
			 						var data = xhr.responseText;
									if(data==0){ 
										alert('添加失败,该邮箱已经注册过！');
										window.location.href=window.location.href;
									}
									if(data==1){
										alert('添加成功');
										window.location.href=window.location.href;									}
								}
							}
				};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("name=" + document.getElementById("name").value
					+ "&email=" + document.getElementById("email").value);
		} else if (con1 == false) {
			Omask.style.display = "none";
			Oenter.style.display = "none";
			event.preventDefault();
		}
		//location.reload();
	};
	for ( var i = 0; i < mods.length; i++) {
		mods[i].onclick = function() {
			var trs = this.parentNode.parentNode;
			var tds = trs.getElementsByTagName("td");
			alert(tds.length);
		};

	}
	// 取消单元格中的文本框，并将文本框中的值赋给单元格
	function cancel(obj) {
		var txtValue = document.getElementById("_text_000000000_").value;
		obj.innerText = txtValue;
	}
	/*********************************************/
	// 事件
	document.onclick = function() {
		if (event.srcElement.tagName.toLowerCase() == "td") {
			changeTotext(event.srcElement);
		}
	};
	document.onmouseup = function() {
		if (document.getElementById("_text_000000000_")
				&& event.srcElement.id != "_text_000000000_") {
			var obj = document.getElementById("_text_000000000_").parentElement;
			cancel(obj);
		}
	};
</script>
</html>