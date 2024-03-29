/*******************************************************************************
 * Copyright (c) 2016.11.7 by zhangshuxi.
 * Copyright © 2016 Shenzhen GTA Education Tech Ltd. All rights reserved
 ******************************************************************************/

package com.jltfisp.web.loan.service;

import java.util.List;

import com.jltfisp.web.loan.entity.*;
import com.jltfisp.web.news.entity.DictColumnDto;

/**
 * 首页贷款服务功能
 * @author 张舒西 2016年11月24日 下午2:21:47
 */
public interface LoanService {
    /**
     * 
     * @param id
     * @return JltfispCoBase 返回内容对象
     * @author 张舒西 2016年11月24日 下午2:22:22
     */
	JltfispCoBaseDto getCoBaseContext(Integer id);
    /**
     * 
     * @param userid
     * @return List<JltfispCoBase> 返回JltfispCoBase list对象
     * @author 张舒西 2016年11月24日 上午9:12:54
     */
    List<JltfispCoBaseDto> getCoBaseList(Integer userid);
    
    /**
     * 
     * @param userid
     * @return List<JltfispCoBaseDto> 返回JltfispCoBaseDto对象
     * @author 张舒西 2016年11月24日 上午9:12:54
     */
    JltfispCoBaseDto getCoBaseContextByUserIdAndType(int userid,int business_type,int apply_state);
    
    /**
     * 
     * @param coBase 传入对象
     * @author 张舒西 2016年11月24日 上午9:12:54
     */
    int saveCoBase(JltfispCoBaseDto coBase);
    
    /**
     * 保存企业概况
     * @param coProfile
     * @return
     */
    int saveCoProfile(JltfispCoProfile coProfile);
    
    /**
     * 保存资产负债表
     * @param coDebt
     * @return
     */
    int saveCoDebt(JltfispCoDebt coDebt);
    
    /**
     * 保存利润表
     * @param coProfit
     * @return
     */
    int saveCoProfit(JltfispCoProfit coProfit);
    
    /**
     * 保存附加财务表
     * @param coFinancial
     * @return
     */
    int saveCoFinancial(JltfispCoFinancial coFinancial);
    
    /**
     * 保存附件信息
     * @param coFile
     * @return
     */
    int saveCoFile(JltfispCoFile coFile);
    
    /**
     * 保存企业其他信息
     * @param coOther
     * @return
     */
    int saveCoOther(JltfispCoOther coOther);
    
    /**
     * 保存填写申请表格
     * @param coFillInApply
     * @return
     */
    int saveCoFillInApply(JltfispCoFillInApply coFillInApply);
    
    /**
     * 通过userid获取所有的信息
     * @param userid
     * @return
     */
    JltfispCoAll getApplyALL(int userid,int businesstype,int applystate);
    /**
     * 通过企业基本信息id获取所有信息
     * @param infoid
     * @return
     */
    JltfispCoAll getApplyALL(int infoid);
    
    
    /**
     * 通过year获取所有的信息
     * @param year 年费
     * @return
     */
    JltfispCoAll getCoDebtTable(int userid,String year,int businesstype,int applystate);
    
    
    JltfispCoAll getCoDebtTable(String year,int infoId);
    /**
     * 通过userid和business_type获取所有资产负债表
     * @param userid  用户ID
     * @param business_type  业务类型
     * @return
     */
     List<JltfispCoDebt> getCoDebtTableList(int userid,int businesstype,int applystate);
     /**
      * 通过infoId 获取所有资产负债表
      * @param infoId
      * @return
      */
     List<JltfispCoDebt> getCoDebtTableList(int infoId);
     /**
      * 通过infoid获取所有财务信息
      * @param infoId
      * @return
      */
     List<JltfispCoFinancialDto> getCoCoFinancialContextByinfoId(int infoId);
     
     /**
      * 通过业务类型查询DictColumnDto实体
      * @param apptype 业务类型
      * @return
      */
     DictColumnDto getAppName(String apptype);
}
