<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.xiaoshuocity.com/commonTag" prefix="commonTag" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <title>系统设置</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/gly/common/head.jsp">
            <jsp:param name="p" value="7"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="left.jsp">
                <jsp:param name="p" value="3"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix" style="height:520px;">
                <div class="layout-block-header">
                    <h2>
                        <a style="color: #333" href="jifen_zhuce.jsp" title="">注册相关积分</a>
                    </h2>
                </div>
                <jsp:include page="../../guanliyuan/common/setting_jifen_top.jsp">
                    <jsp:param name="p" value="0"/>
                </jsp:include>

                <table style="margin-top:25px;" class="formTable" width="60%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <form>
                        <tr>
                            <td style="width: 350px;text-align: right;">
                                广告主注册送积分:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="radio" name="g1" value="3" checked="true"/>100
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g1" value="1"/>200
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g1" value="1"/>500
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 350px;text-align: right;">
                                微信主注册:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="radio" name="g2" value="3" checked="true"/>100
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g2" value="1"/>200
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g2" value="1"/>500
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 350px;text-align: right;">
                                微信主增加一个微信号:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="radio" name="g3" value="3" checked="true"/>50
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g3" value="1"/>100
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g3" value="1"/>200
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 350px;text-align: right;">
                                微信主成功进行一次认证:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="radio" name="g4" value="3" checked="true"/>10
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g4" value="1"/>20
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="g4" value="1"/>50
                            </td>
                        </tr>

                        <tr style="height:60px;">
                            <td style="width: 150px;text-align: right;">
                               
                            </td>
                            <td style="text-align: left;padding-left:10px;">
                                <input type="button" value="提交"/>
                            </td>
                        </tr>

                    </form>
                    </tbody>
                </table>

            </div>
        </div>

        <jsp:include page="/user/common/foot.jsp"/>

    </div>
</div>

</body>
</html>