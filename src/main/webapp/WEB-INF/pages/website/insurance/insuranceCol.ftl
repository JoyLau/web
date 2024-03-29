<#assign path=request.contextPath />
<div class="infoList">
    <ul class="ul1">
        <#list pm.datas as list>
        <li>
            <h2 class="ellipsis"><a href="javascript:;" onclick="ttPost('${list.id}')">${list.title }</a></h2>
            <p class="tit">
             <#if list.source?length lte 15>
	            	${list.source}
	            <#else>
	            	${list.source[0..15]}...
	            </#if>
            <span>${list.publishTime ? date}</span><span class="eye fr">${list.pv}</span></p>
            <p>
	            <#if list.contentReview?length  lte 40>
	            	${list.contentReview}
	            <#else>
	            	${list.contentReview[0..40]}...
	            </#if>
            </p>
        </li>
        </#list>
    </ul>


    <#--分页开始-->
    <div class="clear"></div>
    <#include "website/common/commonPager.ftl"/>
    <#--分页结束-->
</div>

<script type="text/javascript">
   function  changePage(url){
		var columnId='${columnid}';
		var url=url.split("=");
		var offset=url[1];
		$.ajax({
            type: 'POST',
            url:'${path}/perm/insurance/'+columnId,
            data: {'pager.offset':offset},
            success: function (data) {
            $('.infoList').html(data);
            }
      });
	}
    function ttPost(id) {
    	location.href='${path}/anon/insurance/toDetail?id='+id;
    }
</script>