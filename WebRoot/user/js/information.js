window.onload=function(){
	var oTent1=document.getElementById('content-r');
	var oTent2=document.getElementById('content-r2');
	oTent1.style.display='none';
	oTent2.style.display='none';
	function setContent(num){
		if(num==1)
		{
		oTent1.style.display='none'	;
		oTent2.style.display='block';
			}
		else if(num==2)
		{
		oTent1.style.display='block';
		oTent2.style.display='none';
			}
	}
	setContent(2);////����Ϊ1ʱ���״����룬����Ϊ2ʱ���鿴��������Դ����Ϣ
	
};