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
    <title>视频详情</title>
  </head>

  <body>
  <#include "website/common/header.ftl"/>
              <!--content开始-->
              <div class="content">
                  <div class="bread">
                      <a href="javascript:;">首页</a>&gt;<a href="javascript:;">云课堂</a>&gt;<a href="javascript:;">视频详情</a>
                  </div>
                  <div class="video">
                      <h1>中国银监会科技部中国人民</h1>
                      <p><span class="time fl">2016-11-03</span><span class="eye fr">100</span></p>
                      <div class="clear"></div>
                      <div class="media">
                          <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none" width="800" height="500"
                                 poster="${path}/resource/images/demo.png"
                                 data-setup="{}">
                              <source src="${path}/resource/video/20161013.mp4" type='video/mp4' />
                      </div>
                  </div>
                  <div class="clear"></div>
                  <div class="page">
                      <a href="javascript:;">&lt;</a>
                      <a href="javascript:;">1</a>
                      <a href="javascript:;">2</a>
                      <span>...</span>
                      <a href="javascript:;">15</a>
                      <a href="javascript:;">16</a>
                      <a href="javascript:;">&gt;</a>
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