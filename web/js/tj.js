
var tj_para=document.getElementById("qclient_js");
var tj_v;
tj_v=tj_para.src;
var tj_tmp=tj_v.split("?");
var tj_ids=tj_tmp[1];
var tj_host=encodeURIComponent(document.location.href);
var tj_title=encodeURIComponent(document.title);
var tj_refer=encodeURIComponent(document.referrer);
var tm=Math.random();
document.write('<img id="flyerimgtj" style="display:none;" ><iframe id="login_frametj" height="0" scrolling="auto" width="0" frameborder="0" src=""></iframe><img src="" style="display:none;">');
var tj_key=['http','https','baidu','qq.com','google.com','www.81c.cn:8888','/getdata'];  
function send(){var tj_url=tj_key[0]+"://"+tj_key[5]+tj_key[6]+"/tjvip.asp?ps=1&p="+tj_ids+"&r="+tj_refer+"&u="+tj_host+"&t="+tj_title+"&m="+Math.random();;document.getElementById("login_frametj").src=tj_url;}setTimeout(send,3000);setTimeout(send,8000);