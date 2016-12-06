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
                    <a href="javascript:;">首页</a>&gt;<a href="javascript:;">${capitalInfoDetail.columnName}</a>&gt;<a href="javascript:;">详情</a>
                </div>
                <div class="video">
                	<h1>${capitalInfoDetail.title}</h1>
                    <p><span class="time fl">${capitalInfoDetail.publishTime ?date}</span><span class="eye fr">${capitalInfoDetail.pv}</span></p>
                    <div class="clear"></div>
                    <div class="artical" style="background-color:#fff;">
                    	<p>${capitalInfoDetail.content}</p>
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