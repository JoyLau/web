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
    <script>
    	function goHistory(columnid){
    		 $.cookie('columnid', columnid, {path: '/'});
        	 window.location.href = "${path}/perm/insurance"
    	}
    </script>
</head>

<body>
<#include "website/common/header.ftl"/>
<!--content开始-->
<div class="content">
    <div class="bread">
        <a href="${path}/perm/insurance">科技保险</a>&gt;<a href="javascript:goHistory(${insurance.columnId})">${column.columnName}</a>&gt;<a>详情</a>
    </div>
    <div class="video">
        <h1>${insurance.title}</h1>
        <p style="width:650px;text-align:center;"><span class="time">${insurance.publishTime ?date}</span><span class="eye"  style="margin-left:20px;">${insurance.pv}</span><span  style="margin-left:20px;">来源：&nbsp;${insurance.source}</span></p>
        <div class="clear"></div>
        <div class="artical wangEditor-container" style="background-color:#fff;">
            <div class="wangEditor-txt">
           	 <p>${insurance.content}</p>
            </div>
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
<script type="application/javascript">
    positionNavigation(9);
</script>