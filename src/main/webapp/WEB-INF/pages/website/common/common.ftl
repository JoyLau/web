<#assign path=request.contextPath />
<#--resources css and js-->
<link rel="stylesheet" type="text/css" href="${path}/resource/css/css.css" />
<link rel="stylesheet" type="text/css" href="${path}/resource/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${path}/resource/css/ui-dialog.css" />
<script type="text/javascript" src="${path}/resource/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${path}/resource/js/dialog-plus.js"></script>
<script type="text/javascript" src="${path}/resource/js/js.js"></script>
<script type="text/javascript" src="${path}/resource/js/js.js"></script>
<!-- 日期选择框start -->
<script type="text/javascript" src="${path}/resource/js/datePicker/WdatePicker.js"></script>
<!-- 日期选择框end -->
<#--validationEngine-->
<link rel="stylesheet" type="text/css" href="${path}/resource/plugins/validationengine/css/validationEngine.jquery.css" />
<script type="text/javascript" src="${path}/resource/plugins/validationengine/js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="${path}/resource/plugins/validationengine/js/jquery.validationEngine-zh_CN.js"></script>

<#--commonjs-->
<script type="text/javascript" src="${path}/resource/js/common.js"></script>

<script>
    $(document).ready(function(e) {
    $('.nav li').click(function(){
        $(this).addClass('active').siblings('li').removeClass('active');
    });
        })
</script>