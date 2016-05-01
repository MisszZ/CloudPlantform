/**
 * Created by Administrator on 2015/8/28.
 */
window.onload=function(){
    var oData=document.getElementById('data');//���Ϸ�
    var oTop=document.getElementById('topic');//����ͼ
    var oBtn=document.getElementById('btn1');//������˰칫��İ�ť
    var oTet=document.getElementById('content');//��Ҫ���ݲ���
    var oMask=document.getElementById('mask');//����
    var oMain=document.getElementById('content_main');//�����ϲ�����
    //��ʼ��
    oBtn.style.display='block';//������˰칫��ť��ʾ
    oData.style.display='block';//��ʾ���Ϸ�����
    oTop.style.display='block';//��ʾ����ͼƬ
    //oMask.style.display='none';//��������
    //oMain.style.display='none';//�����ϲ���������
    //���������˰칫��ť,��ʾ�����Լ������ϵ����ݣ����������������·���ʾ
    oBtn.onclick=function(){
        oMask.style.display='block';//��ʾ����
        oMain.style.display='block';//��ʾ�����Ϸ�����
    };
};
