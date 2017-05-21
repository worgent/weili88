<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tag.weili88.com" prefix="w" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="/css/list.css" rel="stylesheet" type="text/css">
    <link href="/css/form.css" rel="stylesheet" type="text/css">

    <title>创建贴片广告</title>
</head>

<body>
<div id="Holder">
    <div id="MainPage">
        <jsp:include page="/user/common/head.jsp">
            <jsp:param name="p" value="1"/>
        </jsp:include>
        <div id="MainBody" class="layout-full-width">
            <jsp:include page="ggz_left.jsp">
                <jsp:param name="p" value="0"/>
            </jsp:include>

            <div id="CooperationMain" class="layout-main box clear-fix">
                    <form method="post" action="/user/ad/ggz_tiepian_insert.do" name="f1" id="f1" enctype="multipart/form-data">

                    <input type="hidden" name="industryIds" id="industryIds"/>
                    <input type="hidden" name="areaIds" id="areaIds"/>
                    <input type="hidden" name="type" id="type" value="1"/>
                    <table class="formTable" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td class="tdl">
                                贴片标题
                            </td>
                            <td class="tdr">
                                <input type="text" width="120" size="104" name="title" id="title"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdl">
                                报价(元/千粉)
                            </td>
                            <td class="tdr">
                                <input type="text" width="120" size="104" name="price" id="price" onkeyup="value=value.replace(/[^\d\.]/g,'')"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdl">
                                粉丝数要求
                            </td>
                            <td class="tdr">
                                最低值
                                <select name="minFans" id="minFans">
                                    <option value="1000">1千</option>
                                    <option value="5000">5千</option>
                                    <option value="10000">1万</option>
                                    <option value="50000">5万</option>
                                </select>

                                最高值
                                <select name="maxFans" id="maxFans">
                                    <option value="0">不限</option>
                                    <option value="10000">1万</option>
                                    <option value="50000">5万</option>
                                    <option value="100000">10万</option>
                                    <option value="200000">20万</option>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td class="tdl" valign="top">
                                行业要求
                            </td>
                            <td class="tdr">
                                <span><input type="checkbox" name="all_industry" id="all_industry" value="1"/>全选</span>
                                <w:dictionaryListTag configId="checkbox" name="industryId" type="21"/>
                                <w:dictionaryListTag configId="checkbox" name="industryId" type="22"/>
                                <w:dictionaryListTag configId="checkbox" name="industryId" type="23"/>
                                <w:dictionaryListTag configId="checkbox" name="industryId" type="24"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdl" valign="top">
                                地区要求
                            </td>
                            <td class="tdr">
                                <span><input type="checkbox" name="all_area" id="all_area" value="1"/>全选</span>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="11"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="12"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="13"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="14"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="15"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="16"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="17"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="18"/>
                                <w:dictionaryListTag configId="checkbox" name="areaId" type="19"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdl">
                                上传图片
                            </td>
                            <td class="tdr">
                                <input type="file" name="file" id="file" size="60"/>
                            </td>
                        </tr>
                        <tr style="height:40px;">
                            <td colspan="2" style="text-align: center;">
                                <input id="b1" type="button" value="创建贴片" class="button blue medium"
                                       style="cursor: pointer;"/>
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

function getCheckboxValues(name) {
    var chks = $("input:checkbox[name='" + name + "']");
    var values = "";
    $.each(chks, function(k, v) {
        if (v.checked == true) {
            if (values != "") {
                values += ",";
            }
            values += v.value;
        }
    });
    return $.trim(values);
}

    $(document).ready(function () {
        $("#all_industry").click(function() {
            if ($("#all_industry").attr("checked") == "checked") {
                $("input[name='industryId']").attr("checked", "checked");
            } else {
                $("input[name='industryId']").removeAttr("checked", "checked");
            }
        });
        $("#all_area").click(function() {
            if ($("#all_area").attr("checked") == "checked") {
                $("input[name='areaId']").attr("checked", "checked");
            } else {
                $("input[name='areaId']").removeAttr("checked", "checked");
            }
        });

        var flag = 1;
        var url = '/user/ad/ggz_ajax_insert.do';
        $("#b1").click(function(e) {
            if ($("#title").val() == '') {
                flag = 1;
                layer.msg('标题不能为空!');
                return false;
            }
            if ($("#price").val() == '') {
                flag = 1;
                layer.msg('价格不能为空!');
                return false;
            }
            $("#industryIds").val(getCheckboxValues("industryId"));
            $("#areaIds").val(getCheckboxValues("areaId"));
            if ($("#industryIds").val() == '') {
                flag = 1;
                layer.msg('行业要求不能为空!');
                return false;
            }
            if ($("#areaIds").val() == '') {
                flag = 1;
                layer.msg('地区要求不能为空!');
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
//                    window.location.href = "/user/ad/ggz_list_tiepian.do";
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