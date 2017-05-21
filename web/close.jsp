<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
</head>

<body>

恭喜您已经成功完成了充值过程,此界面3秒钟后会自动关闭.


<script type="text/javascript">
    var i = 1;
    function cloaseDelay() {
        i--;
        if (i == 0) {
            window.close();
        }
        setTimeout("cloaseDelay()", 1000);
    }
    cloaseDelay();
</script>
</body>
</html>