<#assign path=request.contextPath />
<#setting date_format="yyyy-MM-dd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <#include "website/common/common.ftl" />
    <title>科技金融专员申请</title>
</head>

<body>
<#include "website/common/header.ftl"/>
            <!--content开始-->
                <div class="content">
                    <div class="bread">
                        <a href="${path}/index">首页</a>&gt;<a href="javascript:history.go(-2);">专家资源</a>&gt;<a href="${path}/perm/expert?columnId=${columnId}&isFrontPage=1">${columnName}</a>&gt;<a href="javascript:;">在线申请</a>
                    </div>
                    <div class="calt">
                        <div class="proList nli">
                            <!--企业基本信息-->
                            <div class="nlistCont">
                                <p class="ntit">${columnName}登记注册表</p>
                            <form id="jinRongzy">
                            <input type="hidden" name="columnid" id="columnid" value="20" />
                                <table width="100%" class="tab3">
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label1}</th>
                                        <td><input name="name" value="${jltfispExpert.name}" id="name" type="text" class="txt validate[required,minSize[2],maxSize[20],custom[chineseEnglish]]" placeholder="请输入" /></td>
                                        <th rowspan="4">${finExpertManage.label3}</th>
                                        <td rowspan="4">
                                            <#if jltfispExpert.userlogo?exists>
                                            <img width="110px" id="portrait" name="portrait" height="110px" src="${path}${jltfispExpert.userlogo}" class="fl" />
                                            <#else>
                                            <img width="110px" id="portrait" name="portrait" height="110px" src="${path}/resource/images/blank.png" class="fl" />
                                            </#if>
                                            <span class="notice fr">建议尺寸220px*246px<br />上传大小不超过1M<br/>支持JPG</span>
                                            <div class="clear"></div>
                                            <div class="btnUp fl">
                                                 <input unselectable="on" type="file" style="cursor:pointer;" name="UpFile9" id="UpFile9" onchange="ajaxFileUploadUserLogo(9)"/>
                                                 <input name="userlogo" id="userlogo" type="hidden" value="${jltfispExpert.userlogo}"/>
                                                <a href="javascript:;">上传</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>${finExpertManage.label2}</th>
                                        <td>
                                        <#if jltfispExpert.sex == 1 >
                                        <label><input id="sex" type="radio" name="sex" value="0"  class="validate[required]"/>保密</label><label><input type="radio" checked name="sex" value="1" class="validate[required]"/>男</label><label><input type="radio" name="sex" value="1" class="validate[required]"/>女</label>
                                        <#elseif jltfispExpert.sex == 2>
                                        <label><input id="sex" type="radio" name="sex" value="0" class="validate[required]"/>保密</label><label><input type="radio" name="sex" value="1" class="validate[required]"/>男</label><label><input type="radio" name="sex" value="1" class="validate[required]" checked/>女</label>
                                        <#else>
                                        <label><input id="sex" type="radio" name="sex" value="0" checked class="validate[required]"/>保密</label><label><input type="radio" name="sex" value="1" class="validate[required]"/>男</label><label><input type="radio" name="sex" value="1" class="validate[required]"/>女</label>
                                        </#if>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label4}</th>
                                        <td><input type="text" value="<#if jltfispExpert.birthday?exists>${jltfispExpert.birthday?date}</#if>" id="birthday" onClick="WdatePicker({readOnly:true})" name="birthday" class="txt validate[required]" placeholder="请输入" /></td>
                                    </tr>
                                    <tr>

                                        <th><b class="red">*</b>${finExpertManage.label5}</th>
                                        <td>
                                            <select name="degree" id="degree" class="validate[required]">
                                                <option value="">请选择</option>
                                                <option value="1">博士</option>
                                                <option value="2">硕士</option>
                                                <option value="3">学士</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label6}</th>
                                        <td colspan="3"><input value="${jltfispExpert.businesaddress}" name="businesaddress" id="businesaddress" type="text" class="txt validate[required,maxSize[30]]" placeholder="请输入" /></td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label7}</th>
                                        <td>
                                            <select name="technologydomain" id="technologydomain" class="validate[required]">
                                                <option value="">请选择</option>
                                                <option value="1">信贷</option>
                                                <option value="2">上市辅导</option>
                                                <option value="3">投资咨询</option>
                                                <option value="4">保险</option>
                                                <option value="5">其他</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label8}</th>
                                        <td><input value="${jltfispExpert.workpost}" name="workpost" id="workpost" type="text" class="txt validate[required,maxSize[30]]" placeholder="请输入" /></td>
                                        <th><b class="red">*</b>${finExpertManage.label9}</th>
                                        <td><input value="${jltfispExpert.worktitle}" name="worktitle" id="worktitle"  type="text" class="txt validate[required,maxSize[30]]" placeholder="请输入" /></td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label10}</th>
                                        <td><input value="${jltfispExpert.fax}" name="fax" id="fax" type="text" class="txt validate[required,custom[fax],minSize[6],maxSize[30]]" placeholder="请输入" /></td>
                                        <th><b class="red">*</b>${finExpertManage.label11}</th>
                                        <td><input value="${jltfispExpert.postcode}" name="postcode" id="postcode" type="text" class="txt validate[required,custom[chinaZip]]" placeholder="请输入" /></td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label12}</th>
                                        <td><input value="${jltfispExpert.phone}" name="phone" id="phone" type="text" class="txt validate[custom[mobile]]" placeholder="请输入" /></td>
                                        <th><b class="red">*</b>${finExpertManage.label13}</th>
                                        <td><input value="${jltfispExpert.email}" name="email" id="email" type="text" class="txt validate[required,minSize[2],maxSize[50],custom[email]]" placeholder="请输入" /></td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label14}</th>
                                        <td colspan="3">
                                            <input value="${jltfispExpert.mainaddress}" name="mainaddress" id="mainaddress" type="text" class="txt validate[required,maxSize[100]]" placeholder="请输入" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label15}</th>
                                        <td colspan="3">
                                            <input value="${jltfispExpert.postaladdress}" name="postaladdress" id="postaladdress" type="text" class="txt validate[required,maxSize[100]]" placeholder="请输入" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label16}</th>
                                        <td colspan="3">
                                            <input value="${jltfispExpert.workcompany}" name="workcompany" id="workcompany" type="text" class="txt validate[required,maxSize[100]]" placeholder="请输入" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><b class="red">*</b>${finExpertManage.label17}</th>
                                        <td colspan="3">
                                            <div class="else" style="line-height:24px;">本人工作经历、专业特长、服务业绩</div>
                                            <textarea name="partfull" id="partfull" class="txta validate[required,maxSize[500]]">${jltfispExpert.partfull}</textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>${finExpertManage.label18}</th>
                                        <td colspan="3">
                                            <#if jltfispExpert.agencylogo?exists>
                                            <img width="110px" id="agencylogoimg" name="agencylogoimg" height="110px" src="${path}${jltfispExpert.agencylogo}" class="fl" />
                                            <#else>
                                            <img width="110px" id="agencylogoimg" name="agencylogoimg" height="110px" src="${path}/resource/images/blank.png" class="fl" />
                                            </#if>
                                            <span class="notice fl ml16">建议尺寸220px*246px<br />上传大小不超过1M<br/>支持JPG</span>
                                            <div class="clear"></div>
                                            <div class="btnUp fl">
                                                <input unselectable="on" type="file" style="cursor:pointer;" name="UpFile10" id="UpFile10"  onchange="ajaxFileUpload(10)"/>
                                            <input type="hidden" name="agencylogo" id="agencylogo" value="${jltfispExpert.agencylogo}"/>
                                                <a href="javascript:;">上传</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>${finExpertManage.label19}</th>
                                        <td colspan="3"><textarea name="agencyinfo" id="agencyinfo" class="txta validate[maxSize[500]]">${jltfispExpert.agencyinfo}</textarea></td>
                                    </tr>
                                </table>
                                </form>
                            </div>
                            <div class="btnFld"><a href="#"><input type="button" value="完成注册" class="btnSave" /></a></div>
                        </div>
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

<script type="text/javascript">
    positionNavigation(6);
    var degree="${jltfispExpert.degree}";
    var technologydomain="${jltfispExpert.technologydomain}";
    $(document).ready(function(e) {
       if(null!=degree || ""!=degree){
        $("#degree   option[value='"+degree+"']").attr("selected",true);
       }
       if(null!=technologydomain || ""!=technologydomain){
       $("#technologydomain   option[value='"+technologydomain+"']").attr("selected",true);
       }
       $("#jinRongzy").validationEngine({promptPosition :'bottomRight',focusFirstField:true,showOneMessage:true});
       $('.btnSave').click(function(){
       if(!$('#jinRongzy').validationEngine('validate')){
               return false;
               }
       $.ajax({
            type: "POST",
            url: '${path}/anon/addExpert?xss=true',
            data: $("#jinRongzy").serialize(),
            dateType:"json",
            success: function(msg){
               if( msg != 1){
                     location.href="${path}/anon/successOrFailPage?type=0&columnId=20";
                    }else{
                     location.href="${path}/anon/successOrFailPage?type=1&columnId=20";
                    }
            }
        });
     });
        //增加
        $('.add').click(function(){
            var node = $('.module tr:last').clone(true).removeClass('module');
            $('.module tr:last').after(node);
        });
        //删除
        $('.delete').live('click',function(){
            $(this).parents('tr').remove();
        });
    });
    
     
              <!--上传附件-->
function ajaxFileUpload(index) { 
    var index=index;
    $.ajaxFileUpload({
        type: "POST",
        url: '${path}/anon/uploadImage?pop=1&index='+index, 
        secureuri: false,
        fileElementId: 'UpFile'+index,
        dataType:"text",
        success: function(msg) {
        if(msg!='false'){
                $('#agencylogo').val(msg);
                $("#agencylogoimg").attr("src","${path}"+msg);
            }else{
                alert("图片上传失败,只能上传JPG格式图片！");
            }
        }
    }); 
} 

              <!--用户logo上传附件-->
function ajaxFileUploadUserLogo(index) {
    var index=index;
    $.ajaxFileUpload({
        type: "POST",
        url: '${path}/anon/uploadImage?pop=1&index='+index, 
        secureuri: false,
        fileElementId: 'UpFile'+index,
        dataType:"text",  
        success: function(msg) {
            if(msg!='false'){
                $('#userlogo').val(msg);
                $("#portrait").attr("src","${path}"+msg);
            }else{
                alert("图片上传失败,只能上传JPG格式图片，大小不能大于1M！");
            }
        }
    }); 
}

<!--上传用户logo头像，并剪裁-->
var imgDialog;
function ajaxFileUploadLogo() { 
    if($("#uploadFile").val()==''){
        alert('请选择图片上传');
        return false;
    }
    $.ajaxFileUpload({  
        url: '${path}/imageScreenshot/uploadImage?pop=1', 
        secureuri: false,  
        fileElementId: 'uploadFile',
        dataType: 'json',  
        success: function(json, status) {
            if(json.result=='true'){
                var filePath = json.filePath;
                var width = json.width;
                var height = json.height;
                var url = '${path}/anon/imageCrop?pop=1&filePath='+filePath+"&width="+width+"&height="+height;
                imgDialog = dialog({
					width: 600,
					height : 400,
					padding: 10,
					content: $('#dialogShow').load(url)
				});
               imgDialog.showModal();
            }else{
                alert(json.message);
            }
        },error: function (data, status, e)//服务器响应失败处理函数
        {
            alert(e);
        }
    }  
);
    return false;  
} 
</script>