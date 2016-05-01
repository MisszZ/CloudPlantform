window.onload = function(){
	//var onOrOff=document.getElementById('on');
	var on_off=document.getElementById('on');
	var tempStatus=document.getElementById('tempStatus');
	var zy=document.getElementById('btn-zy');
	var zycz=document.getElementById('zycz');
	function showLeftTime(){
		var now=new Date();
		var year=now.getFullYear();
		var month=now.getMonth()+1;
		var day=now.getDate();
		var hours=now.getHours();
		var minutes=now.getMinutes();
		var seconds=now.getSeconds();
		document.all.show.innerHTML=""+year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";		//涓�鍒锋柊涓�鏄剧ず鏃堕棿
		var timeID=setTimeout(showLeftTime,1000);
	}
	showLeftTime();
	zy.onclick=function(){
		zycz.style.display = (zycz.style.display =="block")?"none":"block";
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
	}
	if(tempStatus.value == 1)
	{
		on_off.id = "on";
		
	}
	else{
		on_off.id = "off";
	}
	
	$(function(){
       	$(".turnOn").click(function(){
       		//alert('ceshi');
        	//初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="set/addTimeSet?time="+new Date()+"";
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==1){
        							on_off.onclick = function () {
           	 							on_off.id = (on_off.id == "on") ? "off" : "on";	
           	 						}
								} 
								if(data==0)
								 	alert('状态修改失败！');
								window.location.href=window.location.href;
							}
						}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send(null);
       	});
	});
	/*on_off.click=function(){
    	//初始化XMLHttpRequest对象
    		var xhr=createXMLHttpRequest();
    		//服务器请求URl
    		var uri="set/addTimeSet?time="+new Date()+"";
    		alert(uri);
    		xhr.onreadystatechange=function(){
		 				if(xhr.readyState==4){
		 					if(xhr.status==200||xhr.status==304){
		 						var data = xhr.responseText;
								if(data==1){
									alert('jieguo ?');
									var on_off = document.getElementById('on');
        							on_off.onclick = function () {
           	 							on_off.id = (on_off.id == "on") ? "off" : "on";	
           	 						}
								} 
								if(data==0)
								 	alert('状态修改失败！');
								//window.location.href="<%=request.getContextPath()%>/userToAdm/toxgmm";
							}
						}
			};
			xhr.open("POST", uri, true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send(null);
        };	*/
       // turn();
}
	
	