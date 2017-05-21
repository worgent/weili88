<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <title>创建充值</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="5"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
            <jsp:include page="left.jsp">
                <jsp:param name="p" value="0"/>
            </jsp:include>
            <div id="CooperationMain" class="layout-main box clear-fix">
                <div class="layout-block-header"><h2>用支付宝充值</h2></div>
                <form id="f1" name="alipayment" action="/user/chongzhi/order_insert.do" method="post" target="_blank">
                    <table class="formTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                充值账户:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                ${user.englishName}
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                充值金额:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" name="money" width="120" size="30" value="1000" onkeyup="value=value.replace(/[^\d]/g,'')"/>元
                            </td>
                        </tr>

                        <tr style="height:60px;">
                            <td style="width: 150px;text-align: right;">

                            </td>
                            <td style="text-align: left;padding-left:10px;">
                                <button class="button blue medium" id="b1" type="button">用支付宝支付</button>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </form>

            </div>
        </div>

        <jsp:include page="/user/common/foot.jsp"/>

    </div>
</div>
<script type="text/javaScript">
    $(document).ready(function () {
        $("#b1").click(function(e) {
            if ($("#money").val() == '') {
                layer.msg('充值金额不能为空!');
                return false;
            }
            $("#f1").submit();
            $.layer({
                        shade: [0],
                        area: ['auto','auto'],
                        dialog: {
                            msg: '支付完成前，请不要关闭此支付验证窗口。 支付完成后，请根据您支付的情况点击下面按钮。',
                            btns: 2,
                            type: 7,
                            btn: ['遇到问题','支付完成'],
                            yes: function() {
                                layer.alert('请重新进行支付或联系客服');
                            }, no: function() {
                                window.location.href = "/user/chongzhi/order_list.do";
                            }
                        }
                    });
        });


    });
</script>

</body>
</html>