window.onload=function() {
	var oData = document.getElementById('data');//获取右上角信息
	var oTopic = document.getElementById('topic');//获取网站名称图片
	var oContet = document.getElementById('content');//获取网站核心内容
	var oMask = document.getElementById('mask');//获取遮罩
	var oSource1 = document.getElementById('nosource');//获取提示一
	var oSource2 = document.getElementById('havesource');//获取提示二
	oData.style.display = 'block';
	oTopic.style.display = 'block';
	oContet.style.display = 'block';
	oMask.style.display = 'none';
	oSource1.style.display = 'none';
	oSource2.style.display = 'none';
	function alertMess(count) {	//显示提示一
		if (count == 4) {
			oMask.style.display = 'block';
			oSource1.style.display = 'block';
			oSource2.style.display = 'none';
		} else if (count == 5) {//显示提示二
			oMask.style.display = 'block';
			oSource1.style.display = 'none';
			oSource2.style.display = 'block';
		}
	}
	function setPlan(num){
		var oLi=document.getElementById('rapid').getElementsByTagName('li');
		if(num==1)
		{
			oLi[0].style.display="block";
		}
		else if(num==2)
		{
			oLi[2].style.display="block";
		}
		else if(num==3)
		{
			oLi[1].style.display="block";
		}
		else{
			oLi[0].style.display="none";
			oLi[1].style.display="none";
			oLi[2].style.display="none";
		}
	}
	alertMess(5);
	setPlan(1);
};

