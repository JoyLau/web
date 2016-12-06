package com.jltfisp.web.loan.dao;

import com.jltfisp.base.basedao.BaseMapper;
import com.jltfisp.web.loan.entity.JltfispCoProfitDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CoProfitMapper extends BaseMapper<JltfispCoProfitDto>{
	/**
	 * @param 通过infoid查询JltfispCoProfitDto信息
	 * @return
	 */
	@Select("SELECT * FROM jltfisp_co_profit WHERE info_id = #{infoid}")
	List<JltfispCoProfitDto> getCoProfitContext(int infoid);
	/**
	 * 通过infoid删除jltfisp_co_profit信息
	 * @param infoid
	 */
	@Delete("DELETE  FROM jltfisp_co_profit WHERE info_id = #{infoid}")
	 void deleteCoProfitContext(int infoid);
	
}
