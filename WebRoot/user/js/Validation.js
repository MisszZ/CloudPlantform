/* 
* @Author: anchen
* @Date:   2015-09-29 22:38:24
* @Last Modified by:   anchen
* @Last Modified time: 2015-11-29 19:38:10
*/
window.onload=function(){
	
   document.form1.workplace.onblur=function(){
        workplace();
   }
   document.form1.txtUserName.onblur=function(){
        txtUserName();
   }
   document.form1.email.onblur=function(){
        email();
   }
   document.form1.phonenum.onblur=function(){
        phonenum();
   }
   document.form1.datalength.onblur=function(){
	   checkTime();
  } 
   document.form1.details.onblur=function(){
	   selTest();
  }
   document.form1.details.onblur=function(){
        details();
   }
		
   var bBtn=document.getElementById('submit');
	bBtn.onclick=function(){
		if(! validate()){
			document.form1.onsubmit=function(){
					return false;
			}
		}
		else{
			submitApply();
		}
	}
};
//验证表单
var validity=true;
var flag1=0,
    flag2=0,
    flag3=0,
    flag4=0,
    flag5=0,
    flag6=0;

//点击提交验证表单
function validate(){
    workplace();
    txtUserName();
    email();
    phonenum();
    checkTime();
    details();
    if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6){
        validity=true;
    }
    else{
    	validity=false;
    }
/*    alert(validity);*/
    return validity;
}

function workplace(){
    if(!IsEmpty(document.form1.workplace.value)){
         flag1=0;
         document.getElementById('msg1').style.display='block';
    }
    else{
        flag1=1;
       document.getElementById('msg1').style.display='none'; 
    }
}
function txtUserName(){
     if(!IsEmpty(document.form1.txtUserName.value)){
         flag2=0;
          document.getElementById('msg2').style.display='block';
 }
    else{
        flag2=1;
       document.getElementById('msg2').style.display='none';
    }
}
function email(){
     if(!check_Email(document.form1.email.value)){
         flag3=0;
          document.getElementById('msg3').style.display='block';
 }
    else{
       flag3=1;
       document.getElementById('msg3').style.display='none';
    }
}
function phonenum(){
     if(!IsNum(document.form1.phonenum.value)||!len(document.form1.phonenum.value)){
         flag4=0;
        document.getElementById('msg4').style.display='block';
    }
    else{
       flag4=1;
       document.getElementById('msg4').style.display='none';
    }
}
function checkTime(){
	 if(!check_time(document.form1.datalength.value)){
         flag5=0;
         document.getElementById('msg5').style.display='block';
    }
    else{
       flag5=1;
       document.getElementById('msg5').style.display='none';
       validity =true; 
    }
}
function details(){
     if(document.form1.details.value==""){
    	 flag6=0;
         var msg="对不起，请正确填写该项";
         document.getElementById('div1').style.color="red";
    }
    else{
        flag6=1;
     	var msg="提示：此为必填项,否则无法提交!";
     	document.getElementById('div1').style.color="#ABA6C7";
    }
     document.getElementById('div1').innerHTML=msg;
}
function IsNum(oNum){
    if(!oNum){ 
        return false;
    }
    var strP=/^\d+(\.\d+)?$/;
    if(!strP.test(oNum)){
        return false;
    }
    try{
        if(parseFloat(oNum)!=oNum){
            return false;
        }
    }catch(ex){
        return false;
    }
    return true;
}
// 空值验证
 function IsEmpty(text){
	 return (text.length > 0);
}
// 邮箱验证
function check_Email(address){
    if((address == "")||(address.indexOf('@') == -1)||(address.indexOf('.') == -1)){
        return false;
    }
    return true;
} 
//期限验证
function check_time(timer){
    if(timer==""||timer>12||timer<0){
        return false;
    }
    return true;
} 
// 电话号码长度
function len(val){
    if(val.length==11){
        return true;
    }
    return false;
}