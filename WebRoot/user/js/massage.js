window.onload=function(){
    var oAct=document.getElementById('state');
    var spans=oAct.getElementsByTagName('span');
    var oPic=document.getElementById('open');
    var oPic1=document.getElementById('close');
    var oPic2=document.getElementById('reopen');
    oPic.onclick=function(){
        spans[1].style.display='block';
        spans[0].style.display='none';
    };
    oPic1.onclick=function(){
        spans[0].style.display='block';
        spans[1].style.display='none';
    };
    oPic2.onclick=function(){
        spans[1].style.display='block';
        spans[0].style.display='none';
    };
};