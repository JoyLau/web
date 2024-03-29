package com.jltfisp.web.institution.service;

import java.util.List;

import com.jltfisp.base.service.IBaseService;
import com.jltfisp.web.column.entity.JltfispColumn;
import com.jltfisp.web.institution.entity.JltfispInstitution;

public interface InstitutionService extends IBaseService<JltfispInstitution> {

	public List<JltfispColumn> getJltfispColumnList(Integer parentColumn);

	public List<JltfispInstitution> getInstitutionList(Integer columnId, Integer page);

	public JltfispInstitution getInstitutionDetail(Integer id);

	public int getInstitutionPageCount(Integer columnId);

	/**
	 * 保存合作机构申请详情
	 * @param institution
	 * @return
	 * @author yingying.wang1 2016年12月3日 上午11:10:05
	 */
	public Integer saveInstitution(JltfispInstitution institution);

	   /**
	    * 根据用户id获取曾经申请过的合作机构信息
	    * @param userId
	    * @param columnId 
	    * @return
	    * @author yingying.wang1 2016年12月6日 上午10:50:51
	    */
    public JltfispInstitution getInstitutionByUserIdAndColumnId(Integer userId, Integer columnId);

}
