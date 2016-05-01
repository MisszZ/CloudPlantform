/**
 * Created by Administrator on 2015/9/6.
 */
window.onload=function(){
	var oIpt1=document.getElementById('input1');//ԭ旧密码输入框
    var oIpt2=document.getElementById('input2');//修改密码输入框
    var oIpt3=document.getElementById('input3');//修改密码确认输入框
	var btn=document.getElementById('btn_submit');//提交按钮
	var form1=document.getElementById('form1');//获取表单
    var oIpt ='yq123';//数据库中存储的旧密码
	btn.onclick=function(event){
        //判空
        if(form1.pri_pass.value==''||form1.new_pass.value==''||form1.ensure_pass.value == ''){
			alert('表单中有未填项!');
			return false;//输入有误阻止提交
			}
	/*判断旧密码输入是否有误*/
    if(oIpt1.value !=oIpt){
    	alert("旧密码输入有误!");
		event.preventDefault();//输入有误阻止提交
		oIpt1.value='';//输入有误项置为0
		
	}
	/*判断修改密码输入是否一致*/
	else if(oIpt2.value !=oIpt3.value){
    	alert("修改后的密码输入不一致!");
		event.preventDefault();//输入有误阻止提交
		oIpt2.value='';//输入有误项置为0
		oIpt3.value='';//输入有误项置为0
	
	}
	else{
		form1.submit();//提交表单
		}
	}
};













