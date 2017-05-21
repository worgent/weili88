function previewWx(wx_id,w,h) {
    if(!w){
        w = 1190;
    }
    if(!h){
       h = 500;
    }
    var url = "preview_weixin.jsp?id=" + wx_id;
    var obj = openDialog(url,w, h, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewWxz(wxz_id) {
    var url = "preview_account_weixinzhu.jsp?id=" + wxz_id;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewGgz(ggz_id) {
    var url = "preview_account_guanggaozhu.jsp?id=" + ggz_id;
    var obj = openDialog(url,1190, 580, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewRuanwenReal(gg_id) {
    var url = "preview_rw.jsp?id=" + gg_id ;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewRuanwen(gg_id,p) {
    var url = "preview_gg_ruanwen.jsp?gg_id=" + gg_id + "&p=" + p;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewTiepian(gg_id,p) {
    var url = "preview_gg_tiepian.jsp?gg_id=" + gg_id + "&p=" + p;
    var obj = openDialog(url,1190, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function operationOrderGg(gg_id,p,status) {
    var url = "operation_order_gg.jsp?gg_id=" + gg_id + "&p=" + p+"&status="+status;
    var obj = openDialog(url,1190, 750, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function previewRwdx(order_id,p) {
    var url = "preview_rwdx.jsp?id=" + order_id + "&p=" + p;
    var obj = openDialog(url,1190, 450, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function rzDetail(rzId) {
    var url = "account_renzheng_detail.jsp?id=" + rzId;
    var obj = openDialog(url,1250, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}

function fkglDetail(wxzId) {
    var url = "fkgl_wxz_detail.jsp?id=" + wxzId;
    var obj = openDialog(url,1250, 650, "yes");
    if (obj != "" && obj != null) {
        location.reload();
    }
}


