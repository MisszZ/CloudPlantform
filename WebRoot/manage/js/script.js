function $(id) {
    return typeof id === 'string' ? document.getElementById(id) : id;
}
window.onload = function () {
    var sHeight = window.screen.height;
    var oMask = document.getElementById('mask');
    var oClose = document.getElementById('close');
    var notNull = document.getElementsByClassName('notNull');
    var isRight = document.getElementsByClassName('isRight');
    var btn = document.getElementsByClassName('button');

    oMask.style.height = sHeight + 'px';
    var onlg = document.getElementById("btnLogin");
    var onzc = document.getElementById("btnZc");
    var titles = $('login-tit').getElementsByTagName('li'),
        mods = $('login-con').getElementsByClassName('mod');
    if (titles.length != mods.length)
        return;
    for (var i = 0; i < titles.length; i++) {
        titles[i].id = i;
        titles[i].onclick = function () {
            for (var j = 0; j < titles.length; j++) {
                titles[j].className = '';
                mods[j].style.display = 'none';
            }
            this.className = "select";
            mods[this.id].style.display = 'block';
        }
        var lg = document.getElementsByTagName('btn-login');
        var zc = document.getElementsByTagName('btn-zhuce');
        var onlg = document.getElementById("btnLogin");
        var onzc = document.getElementById("btnZc");
        onlg.onclick = function () {
            for (var j = 0; j < titles.length; j++) {
                titles[j].className = '';
                mods[j].style.display = 'none';
            }
            document.getElementById("mask").style.display = "block";
            document.getElementById("content").style.display = "block";
            titles[0].className = 'select';
            mods[0].style.display = 'block';
        }
        onzc.onclick = function () {
            for (var j = 0; j < titles.length; j++) {
                titles[j].className = '';
                mods[j].style.display = 'none';
            }
            document.getElementById("mask").style.display = "block";
            document.getElementById("content").style.display = "block";
            titles[1].className = 'select';
            mods[1].style.display = 'block';
        }
    }
    oMask.onclick = oClose.onclick = function () {
        oMask.style.display = "none";
        document.getElementById("content").style.display = "none";
    }
    //var mail = document.getElementById('mail-input');
    //var pass = document.getElementById('pass-input');
    //var name = document.getElementById('name-input');
    //var em = document.getElementById('em-input');
    //var b = /^[0-9]*$/;
    //var a = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    //var flag1= 0,flag2= 0,flag3= 0,flag4=0;
    //btn[0].onclick = function () {
    //    if (mail.value == "") {
    //        notNull[0].style.display = "block";
    //    }
    //    else {
    //        notNull[0].style.display = "none";
    //    }
    //    if (pass.value == "") {
    //        notNull[1].style.display = "block";
    //    }
    //    else {
    //        notNull[1].style.display = "none";
    //    }
    //    if (mail.value.length>0 && a.test(mail.value) == false) {
    //        isRight[0].style.display = "block";
    //    }
    //    else {
    //        isRight[0].style.display = "none";
    //    }
    //
    //}
    //function check_name() {
    //    if (name.value == "") {
    //        notNull[2].style.display = "block";
    //    }
    //    else {
    //        notNull[2].style.display = "none";
    //        flag1=1;
    //    }
    //
    //    if (name.value.length>0 && b.test(name.value) == true) {
    //        isRight[1].style.display = "block";
    //
    //    }
    //    else {
    //        isRight[1].style.display = "none";
    //        flag3=1;
    //    }
    //
    //
    //}
    //function check_em(){
    //    if (em.value == "") {
    //        notNull[3].style.display = "block";
    //    }
    //    else {
    //        notNull[3].style.display = "none";
    //        flag2=1;
    //    }
    //    if (em.value.length>0 && a.test(em.value) == false) {
    //        isRight[2].style.display = "block";
    //    }
    //    else {
    //        isRight[2].style.display = "none";
    //        flag4=1
    //    }
    //}
    //function formchk(){
    //    if(flag1==1 && flag2==1 && flag3==1 && flag4==1)
    //    {
    //        alert('注册成功，已将初始密码下发至您的邮箱，请注意查收！');
    //    }
    //    else
    //    {
    //        alert('sdiygu');
    //    }
    //}
}