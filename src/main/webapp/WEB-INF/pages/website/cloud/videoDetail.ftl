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
      <link rel="stylesheet" type="text/css" href="${path}/resource/plugins/videoJs/css/video-js.min.css" />
      <script type="text/javascript" src="${path}/resource/plugins/videoJs/js/video.min.js"></script>
    <title>吉林省科技金融信息服务平台</title>
  </head>

  <body>
  <#include "website/common/header.ftl"/>
              <!--content开始-->
              <div class="content">
                  <div class="bread">
                      <a href="javascript:;">首页</a>&gt;<a>${colName}</a>&gt;<a>详情</a>
                  </div>
                  <div class="video">
                     <h1>${cloudDetail.title}</h1>
				     <p><span class="time fl">${cloudDetail.publishTime ?date}</span><span class="eye fr">${cloudDetail.pv}</span></p>
				     <div class="clear"></div>
				     <#if columnOne.id == columnid>
				        <div class="media">
                          <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none" width="800" height="500"
                                 poster="${path}${cloudDetail.image}"
                                 data-setup="{}">
                              <source src="${path}${cloudDetail.video}" type='video/mp4' />
                     	 </div>
				     <#else>
				     	<div class="artical" style="background-color:#fff;">
				            <p>${cloudDetail.content}</p>
				        </div>
				     </#if>
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