<#assign path=request.contextPath />
   <ul class="ul1">
      <#list pm.datas as newsList>
       <li>
        <h2 class="ellipsis"><a href="${path}/anon/getNewsDetail?id=${newsList.id}">${newsList.title }</a></h2>
        <p class="tit">${newsList.source }<span>${newsList.publishTime ?date }</span><span class="eye fr">${newsList.pv }</span></p>
        <p>${newsList.contentReview }</p>
       </li>
      </#list>
   </ul> 
