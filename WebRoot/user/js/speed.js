window.onload=function() {
	var oData = document.getElementById('data');//��ȡ���Ͻ���Ϣ
	var oTopic = document.getElementById('topic');//��ȡ��վ����ͼƬ
	var oContet = document.getElementById('content');//��ȡ��վ��������
	var oMask = document.getElementById('mask');//��ȡ����
	var oSource1 = document.getElementById('nosource');//��ȡ��ʾһ
	var oSource2 = document.getElementById('havesource');//��ȡ��ʾ��
	oData.style.display = 'block';
	oTopic.style.display = 'block';
	oContet.style.display = 'block';
	oMask.style.display = 'none';
	oSource1.style.display = 'none';
	oSource2.style.display = 'none';
	function alertMess(count) {	//��ʾ��ʾһ
		if (count == 4) {
			oMask.style.display = 'block';
			oSource1.style.display = 'block';
			oSource2.style.display = 'none';
		} else if (count == 5) {//��ʾ��ʾ��
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

