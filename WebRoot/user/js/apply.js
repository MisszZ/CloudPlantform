$(document).ready(function(){
    var btn = $("#btn_input");//��ȡinput�����ť
    var uls = $(".select_list");//��ȡ�����˵�����
    uls.css('display','none');

    //���������˵�����״̬��������״̬
    btn.click(function(){
        if(uls.css('display') == 'none')
        {
            uls.slideDown('fast');//����

        } else{
            uls.slideUp('fast');//����
        }
    });
    //���ѡ����д�ֵ,��ʱinput�Ĳ����޸�����Ӧ��Ϊreadonly������disabled,�����޷���ֵ
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