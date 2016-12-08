<#assign path=request.contextPath />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
<#include "website/common/common.ftl" />
    <title>吉林省科技金融信息服务平台</title>
</head>

<body>
<#include "website/common/header.ftl"/>
<!--content开始-->
<div class="content">
    <div class="bread">
        <a href="${path}/perm/financing">股权融资</a>&gt;<a>${colName}</a>&gt;<a>详情</a>
    </div>
    <div class="video">
        <h1>${fincing.title}</h1>
        <p><span class="time fl">${fincing.publishtime ?date}</span><span class="eye fr">${fincing.pv}</span></p>
        <div class="clear"></div>
        <div class="artical" style="background-color:#fff;">
            <p>${fincing.content}</p>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--content结束-->

</div>
</div>

<div class="clear"></div>
<div class="clearfix"></div>
</div>
<#include "website/common/footer.ftl" />
</body>
</html>