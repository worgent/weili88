//弹出模对话框调用
//参数：url要链接的页面
//参数：Width弹出对话框的宽度
//参数：Height弹出对话框的高度
//参数：scrollPar弹出的对话框是否滚动（'yes'或'no'两种）
function openDialog(url, Width, Height, scrollPar, e) {
    // 相对于浏览器的居中位置
    var bleft = ($(window).width() - Width) / 2;
    var btop = ($(window).height() - Height) / 2;

    // 根据鼠标点击位置算出绝对位置
    var tleft = 0;
    var ttop = 0;

    if(e){
        tleft = e.screenX - e.clientX;
      ttop = e.screenY - e.clientY;
    }

    // 最终模态窗口的位置
    var left = bleft + tleft;
    var top = btop + ttop;
    url = url + (url.indexOf("?") == -1 ? "?" : "&") + "date=" + new Date();
    var sFeatures = "dialogWidth:" + Width + "px; dialogHeight:" + Height + "px;dialogLeft:" + left + "px;dialogTop:" + top + "px;edge:sunken; help:no; scroll:" + scrollPar + "; status:no;menubar:no; location:no";
    //return window.showModalDialog(url, window, sFeatures);
     var ret = window.showModalDialog(url, window, sFeatures);
    //for Chrome
      if(ret==undefined) {
          ret = window.returnValue;
      }
    return ret;
}
///*ajax加载数据实现隔行换色*/
//function getTrColor(trobj) {
//    $(trobj + " tr:odd").css("background-color", "#F2F9FF");
//    $(trobj + " tr:even").css("background-color", "#E8F2FA");
//    $(trobj + " tr").bind("mouseover", function() {
//        $(this).css("background-color", "#D7E8FB");
//    });
//    $(trobj + " tr").bind("mouseout", function() {
//        $(this).css("background-color", "#F2F9FF");
//        $(trobj + " tr:odd").css("background-color", "#F2F9FF");
//        $(trobj + " tr:even").css("background-color", "#E8F2FA");
//    });
//    judgeFuncPower();
//    //judgeFieldPower();暂时不用
//}

$(document).ready(function() {
    /* 隔行换色 */
    $(".formTable tr:odd").css("background-color", "#FFFFFF");
    $(".formTable tr:even").css("background-color", "#F2F9FF");

    /* 隔行换色 */
    $(".tableList tr:odd").css("background-color", "#FFFFFF");
    $(".tableList tr:even").css("background-color", "#F2F9FF");
    $(".tableList tr").bind("mouseover", function() {
        $(this).css("background-color", "#D7E8FB");
    });

    $(".tableList tr").bind("mouseout", function() {
        $(this).css("background-color", "#F2F9FF");
        $(".tableList tr:odd").css("background-color", "#FFFFFF");
        $(".tableList tr:even").css("background-color", "#F2F9FF");
    });

    $("table a").live("mouseup", function() {
        if ($(this).parent().parent().parent().find("tr").attr("id") == 'pages') {
        } else {
            //		清除所有的背景色
            $(this).parent().parent().parent().find("tr").removeClass("trBgcolor");
            // 		设置该行背景色
            $(this).parent().parent().addClass("trBgcolor");
        }
    });
});

/* 选项卡页面调用 */
function setTab(name, n, cur) {
    for (var i = 1; i <= n; i++) {
        var menu = document.getElementById(name + i);
        var con = document.getElementById(name + "_" + i);
        menu.className = i == cur ? "curTag" : "";
        con.style.display = i == cur ? "block" : "none";
    }
}

function getIds() {
    var chks = $("input:checkbox[flag='chkChild']");
    var ids = "";
    $.each(chks, function(k, v) {
        if (v.checked == true) {
            if (ids != "") {
                ids += ",";
            }
            ids += v.value;
        }
    });
    return $.trim(ids);
}
function getIdsByFlag(flag) {
    var chks = $("input:checkbox[flag='" + flag + "']");
    var ids = "";
    $.each(chks, function(k, v) {
        if (v.checked == true) {
            if (ids != "") {
                ids += ",";
            }
            ids += v.value;
        }
    });
    return $.trim(ids);
}

$(function() {
    $("#chk").click(function() {
        var chks = $("input:checkbox[flag='chkChild']");
        var isChked = this.checked;
        $.each(chks, function(k, v) {
            if (isChked) {
                v.checked = true;
            } else {
                v.checked = false;
            }
        });
    });
});

function resetChk(){
    var chks = $("input:checkbox[flag='chkChild']");
    $.each(chks, function(k, v) {
        v.checked = false;
    });
    $("chk").checked = false;
}
