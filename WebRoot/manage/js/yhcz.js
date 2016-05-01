function $(id){
	return typeof id==='string'?document.getElementById(id):id;

}

window.onload = function(){
	var mychange = document.getElementsByTagName('mychange');
	mychange.onclick = function(){
	}
}