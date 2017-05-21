<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/page.css"/>
    <link href="/css/form.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <title>新增画廊</title>
</head>
<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/gly/common/head.jsp">
            <jsp:param name="p" value="5"/>
        </jsp:include>

        <div id="MainBody" class="layout-full-width">
            <jsp:include page="left.jsp">
                <jsp:param name="p" value="12"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix">
                <form method="post" action="/gly/cms/photo_insert.do" name="f1" id="f1" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${cms.id}"/>
                    <input type="hidden" name="pageNo" value="${param.pageNo}"/>
                    <table class="formTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                分类:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <select name="categoryId" id="categoryId">
                                    <c:forEach var="item" items="${dictionaryList}" varStatus="status">
                                        <option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                标题:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" name="title" id="title" size="124" value="${cms.title}"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                链接地址:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="text" width="120" size="104" name="url" value="${cms.url}"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px;text-align: right;">
                                上传图片:
                            </td>
                            <td style="text-align: left;padding-left:10px;    ">
                                <input type="file" name="file" id="file" size="60"/>
                            </td>
                        </tr>
                        <c:if test="${cms.photo!=null}">
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                </td>
                                <td style="text-align: left;padding-left:10px;    ">
                                    <img src="${cms.photo}"/>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td class="left"></td>
                            <td>
                                <input id="b1" type="button" value="提交" class="button blue medium"
                                       style="cursor: pointer;"/></td>
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
    var flag = 1;
    var url = '/gly/cms/photo_insert.do';
    $(document).ready(function () {
        var status = 1;
        <c:if test="${cms.categoryId!=null}">
        $("#categoryId").attr("value", ${cms.categoryId});
        status = ${cms.status};
        </c:if>

        $("#b1").click(function(e) {
            if ($("#title").val() == '') {
                flag = 1;
                layer.msg('标题不能为空!');
                return false;
            }
            if (flag != 1) {
                flag = 1;
                layer.msg('请不要重复提交!');
                return false;
            }
            flag = 0;
//            jQuery.post(url, $("#f1").serialize(), function(jsonobj) {
//                if (jsonobj.code == "200") {
//                    flag = 1;
//                    layer.msg(jsonobj.msg);
//                    window.location.href = "/gly/cms/cms_list.do?type=11&status=" + status;
//                } else {
//                    flag = 1;
//                    layer.alert("操作失败了:" + jsonobj.msg);
//                }
//            }, "json");

            $("#f1").submit();
        });
    });
</script>

</body>
</html>