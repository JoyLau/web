package com.jltfisp.web.loan.controller;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jltfisp.Constants;
import com.jltfisp.login.entity.JltfispUser;
import com.jltfisp.login.service.LoginService;
import com.jltfisp.redis.RedisService;
import com.jltfisp.util.WebUtil;
import com.jltfisp.web.loan.entity.BusinessApplayAudit;
import com.jltfisp.web.loan.entity.FormLabel;
import com.jltfisp.web.loan.entity.JlfispPsBaseDto;
import com.jltfisp.web.loan.entity.JltfispCoBaseDto;
import com.jltfisp.web.loan.entity.JltfispPsInfo;
import com.jltfisp.web.loan.entity.JltfispPsMaterialInfo;
import com.jltfisp.web.loan.entity.JltfispSubsidyCoBaseDto;
import com.jltfisp.web.loan.entity.LoanManageOther;
import com.jltfisp.web.loan.service.IBusinessApplayAuditService;
import com.jltfisp.web.loan.service.ILoanManageOtherService;
import com.jltfisp.web.loan.service.ISubsidyService;
import com.jltfisp.web.loan.service.LoanService;
/**
 * 保费补贴Controller
 * @author cuihong.ge
 *
 */
@Controller
@RequestMapping({"/anon/loan","/loan"})
public class SubsidyApplyController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private ISubsidyService subsidyService;
	@Autowired
	private LoanService loanService;
    @Autowired
    private IBusinessApplayAuditService businessApplayAuditService;

    @Autowired
    private ILoanManageOtherService loanManageOtherService;
    
    @Autowired
    private RedisService<Serializable, String> redisService;
    
    /**
	 * 跳转申请须知页面
	 * @param request
	 * @return mv
	 */
    @RequestMapping("/guidApplyText")
    public ModelAndView guidApplyText(HttpServletRequest request){
     ModelAndView mv=new ModelAndView("/website/loan/subsidy/GuideApplyText");
     //获取申请表单 申请须知及业务说明
     LoanManageOther loanformManage = new LoanManageOther();
     if(redisService.getV("LoanformManage16") != null){
         loanformManage = JSON.toJavaObject((JSON) JSON.parse(redisService.getV("LoanformManage16")),
                 LoanManageOther.class);
     }else{
         LoanManageOther params = new LoanManageOther();
         params.setType(16);
         params.setIstemplate(0);
         loanformManage = loanManageOtherService.selectOneByExample(params);
     }
     mv.addObject("applyGuid", loanformManage != null ? loanformManage.getApplyGuide() : "");
    	mv.addObject("goBackUrl", 1);
    	return mv;
    }
    /**
	 * 跳转申请须知页面
	 * @param request
	 * @return mv
	 */
    @RequestMapping("/guidApplyIndex")
    public ModelAndView guidApplyIndex(HttpServletRequest request){
    	ModelAndView mv=new ModelAndView("/website/loan/subsidy/GuideApplyText");
     //获取申请表单 申请须知及业务说明
     LoanManageOther loanformManage = new LoanManageOther();
     if(redisService.getV("LoanformManage16") != null){
         loanformManage = JSON.toJavaObject((JSON) JSON.parse(redisService.getV("LoanformManage16")),
                 LoanManageOther.class);
     }else{
         LoanManageOther params = new LoanManageOther();
         params.setType(16);
         params.setIstemplate(0);
         loanformManage = loanManageOtherService.selectOneByExample(params);
     }
     mv.addObject("applyGuid", loanformManage != null ? loanformManage.getApplyGuide() : "");
    	mv.addObject("goBackUrl", 2);
    	return mv;
    }
    
    /**
	 * 判断是否已经申请贷款服务
	 * @param request
	 * @return mv
	 */
    @RequestMapping("/judgeIsApplyLoan")
    public ModelAndView judgeIsApplyLoan(HttpServletRequest request){
    	ModelAndView mv=new ModelAndView("/website/loan/subsidy/GuideApply");
        JltfispUser user =loginService.getCurrentUser();
        Integer InfoId=null;
        Integer state=null;
        //如果是企业用户则判断是否申请相应的贷款服务
        if(null !=user && user.getType()==1 ){
        	//第一步先进入申请须知页面
        	mv=new ModelAndView("/website/loan/fail");
    		mv.addObject("failMes", "对不起，个人用户不可以申请保费补贴贷款服务");
    		return mv;
        }else if(null !=user && user.getType()==2){
        	//企业用户如果是申请了贷款服务没有最后一步点击提交下次进入则要回显之前几个页面填写的内容
    		BusinessApplayAudit businessApplayAudit=businessApplayAuditService.getBusinessApplayAuditByUserId(user.getId(), "5");
            if(null !=businessApplayAudit){
            	InfoId=businessApplayAudit.getInfoId();
            	state=businessApplayAudit.getState();
            }
    		//获取申请表单 申请须知及业务说明
            LoanManageOther loanformManage = new LoanManageOther();
            if(redisService.getV("LoanformManage16") != null){
                loanformManage = JSON.toJavaObject((JSON) JSON.parse(redisService.getV("LoanformManage16")),
                        LoanManageOther.class);
            }else{
                LoanManageOther params = new LoanManageOther();
                params.setType(16);
                params.setIstemplate(0);
                loanformManage = loanManageOtherService.selectOneByExample(params);
            }
            mv.addObject("applyGuide", loanformManage != null ? loanformManage.getApplyGuide() : "");
            mv.addObject("userId", user.getId());
            mv.addObject("companyName", user.getUsername());
            mv.addObject("socialCode", user.getSocialCode());
            mv.addObject("bussinessApplyId", InfoId);
            mv.addObject("state", state);
        }
    	return mv;
    }
    /**
	 * 保费补贴在线申请
	 * @return
	 */
	@RequestMapping("/subsidy")
    public ModelAndView subsidy(HttpServletRequest request,Integer userId,String companyName,String socialCode,Integer bussinessApplyId,Integer state ){
		//JltfispUser user =loginService.getCurrentUser();
		ModelAndView mv=new ModelAndView("/website/loan/subsidy/subsidyApply");
		/*//企业用户如果是申请了贷款服务没有最后一步点击提交下次进入则要回显之前几个页面填写的内容
		BusinessApplayAudit businessApplayAudit=businessApplayAuditService.getBusinessApplayAuditByUserId(userId, "5");*/
        	//若是已经申请则判断申请状态(0：申请中；1：申请通过；2：申请不通过 3:未提交)
        	if(null!=bussinessApplyId && state==0){
        		mv=new ModelAndView("/website/loan/fail");
        		mv.addObject("failMes", "对不起，您已经申请了保费补贴贷款");
        		return mv;
        	}else if(null!=bussinessApplyId && state!=0){
        		//下次进入申请页面信息不用重新填
        		JlfispPsBaseDto jlfispPsBaseDto=this.subsidyService.getJlfispPsBaseDtoByUserId(userId,bussinessApplyId);
        		mv.addObject("jlfispPsBaseDto", jlfispPsBaseDto);
    			// 获取保费补贴申请第二部里面的内容
    	    	if(jlfispPsBaseDto !=null){
    	    		JltfispPsMaterialInfo PsMaterialInfo=subsidyService.getJltfispPsMaterialInfoByInfoId(jlfispPsBaseDto.getId());
    	    		mv.addObject("PsMaterialInfo", PsMaterialInfo);
    	    		mv.addObject("jlfispPsBaseDto", jlfispPsBaseDto);
           		    DecimalFormat decimalFormat=new DecimalFormat("0.00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
           		    String capilMoney=decimalFormat.format(jlfispPsBaseDto.getRegisteredCapital());//format 返回的是字符串
           		    mv.addObject("capilMoney", capilMoney);
    	    	}  	
        	}else if(null==bussinessApplyId){
        		//(未提交)下次进入申请页面信息不用重新填
        		JlfispPsBaseDto jlfispPsBaseDto=this.subsidyService.getJlfispPsBaseDtoByUserId(userId,null);
        		mv.addObject("jlfispPsBaseDto", jlfispPsBaseDto);
    			// 获取保费补贴申请第二部里面的内容
    	    	if(null!=jlfispPsBaseDto){
    	    		DecimalFormat decimalFormat=new DecimalFormat("0.00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
               		String capilMoney=decimalFormat.format(jlfispPsBaseDto.getRegisteredCapital());//format 返回的是字符串
               		mv.addObject("capilMoney", capilMoney);
    	    		JltfispPsMaterialInfo PsMaterialInfo=subsidyService.getJltfispPsMaterialInfoByInfoId(jlfispPsBaseDto.getId());
    	    		mv.addObject("PsMaterialInfo", PsMaterialInfo);
    	    	}
        	}
			/*mv.addObject("companyName", user.getUsername());
			mv.addObject("socialCode", user.getSocialCode());*/
        	mv.addObject("companyName", companyName);
			mv.addObject("socialCode", socialCode);
		   //获取申请表单 字段名称
	     LoanManageOther loanformManage = new LoanManageOther();
	     if(redisService.getV("LoanformManage16") != null){
	         loanformManage = JSON.toJavaObject((JSON) JSON.parse(redisService.getV("LoanformManage16")),LoanManageOther.class);
	     }else{
	         LoanManageOther params = new LoanManageOther();
	         params.setType(16);
	         params.setIstemplate(0);
	         loanformManage = loanManageOtherService.selectOneByExample(params);
	     }
	    mv.addObject("loanformManage", JSON.toJavaObject((JSON) JSON.parse(loanformManage.getFormLabelJson()),
	             FormLabel.class));
		return mv;
    }
	/**
	 * 保存申请保费补贴企业信息第一步
	 * @param request
	 * @param jlfispSubsidyBaseDto
	 * @return
	 */
    @RequestMapping("/saveSubsidyCoBase")
    @ResponseBody
    public void saveSubsidyCoBase(HttpServletRequest request,JltfispSubsidyCoBaseDto jlfispSubsidyBaseDto) {
        //首先判断该企业用户的申请信息是否已经存在数据库存在先删除否则直接新增一条信息
    	JltfispUser user =loginService.getCurrentUser();
    	JltfispCoBaseDto jltfispCoBaseDto=new JltfispCoBaseDto();
    	WebUtil.copyBean(jlfispSubsidyBaseDto, jltfispCoBaseDto);
    	//通过USERID获取企业基本信息
    	jltfispCoBaseDto.setBusinesstype(5); //设置申请类型
    	jltfispCoBaseDto.setUserid(user.getId());
    	jltfispCoBaseDto.setCreateTime(new Date());
    	jltfispCoBaseDto.setApplystate(0);//设置为未审核
    	JltfispCoBaseDto jltfispCoBaseDto1=this.subsidyService.addOrUpdatejltfispCoBaseDto(user.getId(),jltfispCoBaseDto);
    	//this.subsidyService.getJlfispPsBaseByUserIdAndName(user.getId(),jlfispSubsidyBaseDto);
    	//获取保费补贴list
    	List<JltfispPsInfo> jltfispPsInfoList=jlfispSubsidyBaseDto.getJltfispPsInfoList();
    	if(jltfispPsInfoList!=null && jltfispPsInfoList.size()>0){
    	  for(int i=0;i<jltfispPsInfoList.size();i++){
    		 jltfispPsInfoList.get(i).setInfoId(jltfispCoBaseDto1.getId());
    	  }
    	     subsidyService.saveJltfispPsInfo(jltfispPsInfoList);
    	}
    	
    }
    /**
     * 保存保费补贴申请第二部里面的内容
     * @param request
     * @param jltfispPsMaterialInfo 
     * @return
     */
    @RequestMapping("/SavePsMaterialInfo")
    public ModelAndView SavePsMaterialInfo(JltfispPsMaterialInfo jltfispPsMaterialInfo){
    	ModelAndView mv=new ModelAndView("/website/loan/subsidy/finishApply");
    	//获取当前用户登录信息
    	JltfispUser user=loginService.getCurrentUser();
    	//通过USERID获取企业基本信息
    	JltfispCoBaseDto jltfispCoBaseDto=loanService.getCoBaseContextByUserIdAndType(user.getId(),5,0);
    	//根据企业id获取保费补贴
    	List<JltfispPsInfo> jltfispPsInfoList=subsidyService.getJltfispPsInfoListByCoBaseId(jltfispCoBaseDto.getId());
    	//保存保费补贴申请信息
    	jltfispPsMaterialInfo.setInfoId(jltfispCoBaseDto.getId());
    	subsidyService.saveJltfispPsMaterialInfo(jltfispPsMaterialInfo);
    	//在保存第二部填写信息的时候就在流程表里面添加一条信息，状态为未提交（贷款金额。。。。。）
    	BusinessApplayAudit businessApplayAudit=businessApplayAuditService.getBusinessApplayAuditByUserId(user.getId(), "5");
    	if(businessApplayAudit ==null){
    		businessApplayAudit=new BusinessApplayAudit();
    		businessApplayAudit.setUserId(user.getId());
    		businessApplayAudit.setState(3);
    		businessApplayAudit.setParentType(Constants.LOAN_BUSINESS);
    		businessApplayAudit.setInfoId(jltfispCoBaseDto.getId());
    		//或者保存为5
    		businessApplayAudit.setType("5");
     		businessApplayAuditService.insertRecord(businessApplayAudit);
    	}
    	
     //获取申请表单 字段名称
     LoanManageOther loanformManage = new LoanManageOther();
     if(redisService.getV("LoanformManage16") != null){
         loanformManage = JSON.toJavaObject((JSON) JSON.parse(redisService.getV("LoanformManage16")),
                 LoanManageOther.class);
     }else{
         LoanManageOther params = new LoanManageOther();
         params.setType(16);
         params.setIstemplate(0);
         loanformManage = loanManageOtherService.selectOneByExample(params);
     }
     mv.addObject("loanformManage", JSON.toJavaObject((JSON) JSON.parse(loanformManage.getFormLabelJson()),
             FormLabel.class));
    	
    	mv.addObject("jltfispCoBaseDto", jltfispCoBaseDto);
    	mv.addObject("jltfispPsInfoList",jltfispPsInfoList);
    	mv.addObject("jltfispPsMaterialInfo",jltfispPsMaterialInfo);
    	return mv ;
    }
    /**
     * 最后一步点击提交
     * @return
     */
     @RequestMapping("/finishApply")
     public ModelAndView finishApply(){
    	//获取当前用户登录信息
    	JltfispUser user=loginService.getCurrentUser();
    	ModelAndView mv=new ModelAndView("/website/loan/success");
    	BusinessApplayAudit businessApplayAudit=businessApplayAuditService.getBusinessApplayAuditByUserId(user.getId(), "5");
    	businessApplayAudit.setState(0);
    	businessApplayAudit.setSubmitDate(new Date());
 		businessApplayAuditService.updateByPK(businessApplayAudit);
 		return mv;
    }
} 
