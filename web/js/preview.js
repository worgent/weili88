function previewWx(wx_id,w,h) {
    if(!w){
        w = 1190;
    }
    if(!h){
       h = 500;
    }
    var url = "/common/preview_weixin.jsp?id=" + wx_id;
    var obj = openDialog(url,w, h, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewWxz(wxz_id) {
    var url = "/common/preview_account_weixinzhu.jsp?id=" + wxz_id;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewGgz(ggz_id) {
    var url = "/common/preview_account_guanggaozhu.jsp?id=" + ggz_id;
    var obj = openDialog(url,1190, 580, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewRuanwenReal(gg_id) {
    var url = "/common/preview_rw.jsp?id=" + gg_id ;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewRuanwen(gg_id,p) {
    var url = "/common/preview_gg_ruanwen.jsp?gg_id=" + gg_id + "&p=" + p;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewTiepian(gg_id,p) {
    var url = "/common/preview_gg_tiepian.jsp?gg_id=" + gg_id + "&p=" + p;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function operationOrderGg(gg_id,p,p2) {
    var url = "operation_order_gg.jsp?id=" + gg_id + "&p=" + p+"&p2="+p2;
    var obj = openDialog(url,1190, 750, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewRwdx(order_id,p) {
    var url = "/common/preview_rwdx.jsp?id=" + order_id + "&p=" + p;
    var obj = openDialog(url,1190, 450, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function dzsq_tiepian(gg_id,p) {
    var url = "ggdzsq_tiepian_detail.jsp?id=" + gg_id + "&p=" + p;
    var obj = openDialog(url,1190, 550, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function dzsq_ruanwen(gg_id,p) {
    var url = "ggdzsq_ruanwen_detail.jsp?id=" + gg_id + "&p=" + p;
    var obj = openDialog(url,1190, 750, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}
function dzsq_wxht(gg_id,p) {
    var url = "ggdzsq_wxht_detail.jsp?id=" + gg_id + "&p=" + p;
    var obj = openDialog(url,1190, 750, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function wxhtDetail(htId) {
    var url = "wxht_detail.jsp?id=" + htId;
    var obj = openDialog(url,1190, 750, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function gg_tiepian_order(htId) {
    var url = "gg_tiepian_order.jsp?id=" + htId;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}
function gg_tiepian_jiedan(htId) {
    var url = "ggjd_tiepian_jiedan.jsp?id=" + htId;
    var obj = openDialog(url,1190, 600, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function gg_ruanwen_order(htId) {
    var url = "gg_ruanwen_order.jsp?id=" + htId;
    var obj = openDialog(url,1190, 550, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}
function gg_ruanwen_jiedan(htId) {
    var url = "ggjd_ruanwen_jiedan.jsp?id=" + htId;
    var obj = openDialog(url,1190, 400, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function gg_wxht_order(htId) {
    var url = "gg_wxht_order.jsp?id=" + htId;
    var obj = openDialog(url,1190, 550, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}
function gg_wxht_jiedan(htId) {
    var url = "ggjd_wxht_jiedan.jsp?id=" + htId;
    var obj = openDialog(url,1190, 400, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function wdxx_detail(htId,p) {
    var url = "wdxx_detail.jsp?id=" + htId + "&p=" + p;
    var obj = openDialog(url,1000, 350, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}


