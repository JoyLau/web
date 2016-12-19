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
 <input type="hidden" id="columnIdValue" value=""/>
   <div class="content">
      <div class="info">
          <ul class="infoTab">
            <#list columnList as column>
                <li id="Type${column.id}" name="${column.id}"><a href="javascript:void(0);">${column.columnName}</a></li>
             </#list>
          </ul>
          <div class="clear"></div>
          <div class="infoList">
              <#list pm.datas as policy>
                <ul class="ul1">
                   <li>
			        <h2 class="ellipsis"><a href="javascript:void(0);" onclick="policyDetail(${policy.id})">${policy.title }</a></h2>
			        <p class="tit">${policy.source }<span>${policy.publishTime ?date }</span><span class="eye fr">${policy.pv }</span></p>
			        <p>${policy.contentReview }</p>
			     </li>
                </ul>
              </#list>
              <div class="clear"></div>
              <#include "website/common/commonPager.ftl"/>
          </div>
      </div>
   </div>
 <!--content结束-->
 </div>
 </div>
 
 <div class="clear"></div>
 <div class="clearfix"></div>
 <#include "website/common/footer.ftl" />
 </body>
</html>
<script type="text/javascript">
  $(document).ready(function(e) {
    var columnId=${columnId};
    $('#Type'+columnId).addClass('active');
    $("#columnIdValue").val(columnId);
    <!--传当前子栏目ID-->
	$.ajax({
            type: 'POST',
            url:'${path}/perm/policy/'+columnId,
            data: {columnId: columnId,'pager.offset':0},
            success: function (data) {
            $('.infoList').html(data);
            }
      });
    $('.infoTab li').click(function(){
        var columnId=$(this).attr("name");
        $("#columnIdValue").val(columnId);
        $(this).addClass('active').siblings('li').removeClass('active');
		    <!--传当前子栏目ID-->
			$.ajax({
	                type: 'POST',
	                url:'${path}/perm/policy/'+columnId,
	                data: {columnId: columnId,'pager.offset':0},
	                success: function (data) {
	                $('.infoList').html(data);
	                }
	          });
	});
});
  //跳转页面详情
  function policyDetail(id){
  	window.location.href="${path}/anon/policyDetail?policyId="+id;
  }

  function  changePage(url){
	  var columnId=$("#columnIdValue").val();
	  var url=url.split("=");
	  var offset=url[1];
	  $.ajax({
	                  type: 'POST',
	                  url:'${path}/perm/policy/'+columnId,
	                  data: {columnId: columnId,'pager.offset':offset},
	                  success: function (data) {
	                  $('.infoList').html(data);
	                  }
	            });
	  }
</script>