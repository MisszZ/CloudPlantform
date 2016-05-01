$(document).ready(function(){
    var btn = $("#btn_input");//获取input点击按钮
    var uls = $(".select_list");//获取下拉菜单主题
    uls.css('display','none');

    //控制下拉菜单下拉状态或者上拉状态
    btn.click(function(){
        if(uls.css('display') == 'none')
        {
            uls.slideDown('fast');//下拉

        } else{
            uls.slideUp('fast');//上拉
        }
    });
    //点击选项进行传值,此时input的不可修改属性应该为readonly而不是disabled,否则无法传值
   $("#select").find('ul li input:not(.define)').each(function(){
       $(this).click(function(){
           var txt = $(this).val();
           $("#select").find("p").html(txt);
           $(".select_list").hide();
       })
   });
    var define=$(".define");
    $(define).focus(function() {
        $(define).removeAttr("readonly");
        if(this.value==this.defaultValue){
            this.value="";
            $(define).click(function(){
            if (this.value != "") {
                var txt = $(this).val();
                $("#select").find("p").html(txt);
                $(".select_list").hide();
                        }
            })

        }

    });
    $(define).blur(function() {
        $(define).attr("readonly",true);
        this.value=this.defaultValue;
    });
});