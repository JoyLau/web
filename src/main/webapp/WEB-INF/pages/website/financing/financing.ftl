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
    <div class="info">
        <ul class="infoTab">
      	<#list colList as list>
      		<#if list_index lt 5>
                <li code="${list.id}" onclick="infoTabClick(${list.id})"><a href="javascript:void(0);">${list.columnName}</a></li>
           	</#if>
            </#list>
            <#if colList?size gt 5>
            	<li>
			       	 <select id="selectId" onchange="getList()">
			       		<option value="0">-选择更多机构-</option>
			       	 	<#list colList as afterFiveList>
			       	 		<#if afterFiveList_index gt 4>
			       	 			<option value="${afterFiveList.id}">${afterFiveList.columnName}</option>
			       	 		</#if>
			       	 	</#list>
			       	 </select>
		       	 </li>
            </#if>
        </ul>
        <div class="clear"></div>
        <a href="${path}/communicate/page" target="_blank" class="apply2" style="width:80px;cursor: pointer;">投资咨询</a>
        <div class="selSearch fr">
        	<select class="selOpt" id="type">
            	<option value="">选择类型</option>
            	<#list dictList as dict>
                <option value="${dict.id}">${dict.value}</option>
                </#list>
            </select>
            <input type="button" onclick="selectPage(${pageInfo.pageNum})" value="搜 索" class="fr" />
        </div>
        <div class="clear"></div>
        <div id="colListDetail"></div>
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

<script type="text/javascript">
	function getList(){
	  var columnId = $('#selectId').val();
	  if(columnId!=0){
	  	 $('#colListDetail').load("${path}/perm/financing/"+columnId,{page :1});
	  }
	}
	
	 function infoTabClick(id){
        $('#colListDetail').load("${path}/perm/financing/"+id,{page :1});
    }

     var infoTab = $("div.info ul.infoTab");
    $(function(){
        infoTab.find("li").eq(0).addClass("active");
        $('#colListDetail').load("${path}/perm/financing/"+infoTab.find("li").eq(0).attr("code"),{page :1});
    });


    function selectPage(page) {
	    if(page==undefined) {
	    	page = $("#currentPage").val();
	    }
        $('#colListDetail').load("${path}/perm/financing/"+infoTab.find('li.active').attr('code'),{page :page,type:$("#type").val()});
    }
</script>