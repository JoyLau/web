<#assign path=request.contextPath />
<div class="wrap">
    <div class="bg">
        <div class="center">
            <div class="top">
                <img src="${path}/resource/images/logo.png" alt="logo" />
                <div class="topR fr">
                    <div class="searchIcon fl">&nbsp;</div>
                    <div class="search fl">
                        <form method="post" action="${path}/anon/search">
                            <input type="text" name="keyWords" class="searchText" />
                            <input type="submit" class="searchBtn" value="" />
                        </form>
                    </div>
                        <@shiro.user>
                            <div class="person fr">
                                <a href="${path}/main" onclick="setColumnIndex(0)"><@shiro.principal/></a>
                                <ul>
                                    <li class="first"><a href="${path}/user/toResetPass" onclick="setColumnIndex(0)">修改密码</a></li>
                                    <li><a href="${path}/logout" onclick="setColumnIndex(0)">安全退出</a></li>
                                </ul>
                            </div>
                        </@shiro.user>
                        <@shiro.guest>
                            <a href="${path}/login" onclick="setColumnIndex(0)" class="login">登录</a><a href="${path}/anon/regist/toRegistPage" onclick="setColumnIndex(0)" class="register">注册</a>
                        </@shiro.guest>
                </div>
                <div class="clear"></div>
            </div>
            <div class="nav">
                <ul>
                    <@indexTag.indexHeader/>
                </ul>
            </div>
            <div class="clear"></div>

            <!--content开始-->


            <#--<div class="content">
            </div>
            <!--content结束&ndash;&gt;

        </div>
    </div>

    <div class="clear"></div>
    <div class="clearfix"></div>
</div>-->