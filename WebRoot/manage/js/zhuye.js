function $(id){
	return typeof id==='string'?document.getElementById(id):id;

}
window.onload = function(){
	var cz = document.getElementById('btn-yhcz');
	var yhcz = document.getElementById('cz');
	var zy = document.getElementById('btn-zyxx');
	var zyxx = document.getElementById('zy');
	var lis = document.getElementsByTagName('li');
	var cancel = document.getElementsByTagName('cancel');
	var H3=document.getElementsByTagName('h3');
	var divs = $('con-right').getElementsByTagName('div');
	var del = document.getElementById('mydelete');

	del.onclick=function(){alert('de');}
	var initializationTime=(new Date()).getTime();
	function showLeftTime(){
		var now=new Date();
		var year=now.getFullYear();
		var month=now.getMonth();
		var day=now.getDate();
		var hours=now.getHours();
		var minutes=now.getMinutes();
		var seconds=now.getSeconds();
		document.all.show.innerHTML=""+year+"骞�"+month+"鏈�"+day+"鏃�"+hours+":"+minutes+":"+seconds+"";
		//涓�鍒锋柊涓�鏄剧ず鏃堕棿
		var timeID=setTimeout(showLeftTime,1000);
	}
	showLeftTime();

	if(H3.length != divs.length)
		return;
	for(var i=0;i<H3.length;i++){
		H3[i].id=i;
		H3[i].onclick = function(){
			for(var j=0;j<divs.length;j++){
				divs[j].style.display="none";
			}
			divs[this.id].style.display="block";		
		}
	}


	zy.onclick = function(){
		zyxx.style.display = (zyxx.style.display =="block")?"none":"block";
	}
	for(i=0;i<lis.length;i++){
		lis[i].onclick = function(){
			var next = this.nextElementSibling || this.nextSibling;
			next.style.display = (next.style.display =="block")?"none":"block";
		}
	}

	

	
}



