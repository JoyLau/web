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
    <title>专家资源</title>
  </head>

  <body>
  <#include "website/common/header.ftl"/>
              <!--content开始-->
             <div class="content">
                <div class="bread">
                    <a href="javascript:;">${parentJltfispColumn.columnName}</a>&gt;<a href="javascript:;">${jltfispColumn.columnName}</a>&gt;<a href="javascript:;">专家详情</a>
                </div>
                <div class="detail">
                	<img src="${path}/${jltfispExpert.agencylogo}" class="fl" />
                    <div class="ul2 fl ml57">
                    	<h1>${jltfispExpert.userid}</h1>
                        <p style="padding-left:0;">${jltfispExpert.workpost} | ${jltfispExpert.businesaddress}</p>
                        <p class="phone">${jltfispExpert.phone}</p>
                        <p class="email">${jltfispExpert.email}</p>
                    </div>
                    <div class="clear"></div>
                    <div class="resume">
                        <h2>专家简讯</h2>
                        ${jltfispExpert.educationalbackground}
                    </div>
                </div>
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