package com.jltfisp.web.cloud.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jltfisp.base.controller.BaseController;
import com.jltfisp.base.service.IBaseService;
import com.jltfisp.web.cloud.entity.Cloud;
import com.jltfisp.web.cloud.service.ICloudService;
import com.jltfisp.web.column.entity.JltfispColumn;
import com.jltfisp.web.column.service.ColumnService;
import com.jltfisp.web.news.entity.DictColumnDto;
import com.jltfisp.web.news.service.IDictColumnService;
import com.jltfisp.web.pager.entity.PagerModel;


/**
 * 数据访问
 * @author freameworkGenerator
 *
 */
@Controller
public class CloudController extends BaseController<Cloud> {

    private static final Logger logger = LoggerFactory
            .getLogger(CloudController.class);

    @Autowired
    private ICloudService cloudService;
    @Autowired
    private ColumnService columnService;
    @Autowired
	private IDictColumnService deictColumnService;
    
    @Override
	public IBaseService<Cloud> getEntityService() {
		return cloudService;
	}

	@Override
	public String getFileBasePath() {
		return "/website/cloud/";
	}

	@Override
	public String getPageName() {
		return "";
	}

	@Override
	public void getMenuIndex(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}
	@RequestMapping("/perm/cloud")
	public String index(HttpServletRequest request) throws Exception {
		
		 List<JltfispColumn> list = columnService.getColumnList(11);
		 request.setAttribute("colList",list);
		
		return getFileBasePath()+"cloud";
	}
	
	@RequestMapping("/perm/cloud/{columnId}")
	public String cloudListDetail(HttpServletRequest request, @PathVariable Integer columnId) throws Exception {
		int rows=Integer.parseInt(request.getParameter("pager.offset")==null ? "0" :request.getParameter("pager.offset"));
		
		Cloud cloud =new Cloud();
		cloud.setColumnId(columnId);
		List<Cloud> list = cloudService.getCloudsList(columnId, rows);
		int total = cloudService.getCloudsCount(columnId);
		PagerModel pm = new PagerModel();
    	pm.setDatas(list);
		pm.setTotal(total);
		request.setAttribute("pm",pm);
		request.setAttribute("url","/perm/financing");
		request.setAttribute("columnid", columnId);
		if (columnId==47) {
			request.setAttribute("pageSize", 9);
		} else {
			request.setAttribute("pageSize", 8);
		}
		
		/*PageInfo info  = preparePageinfo(request,cloud);
		handlePage(request, info, cloud);*/
		JltfispColumn columnOne = columnService.getColumnOne(11, 6);
		request.setAttribute("columnOne", columnOne);
		return getFileBasePath()+"cloudCol";
	}

	 @RequestMapping("/anon/cloud/detail")
	    public String videoDetail(int id,Integer columnid,String colName,HttpServletRequest request){
		 Cloud cloudDetail = cloudService.selectByPk(id);
		 cloudDetail.setPv(cloudDetail.getPv()==null?1:cloudDetail.getPv()+1);
		 request.setAttribute("cloudDetail", cloudDetail);
		 cloudService.updateCloudPv(cloudDetail.getId(), cloudDetail.getPv());
		 JltfispColumn column = columnService.getColumnById(cloudDetail.getColumnId());
		 request.setAttribute("column", column);
		 JltfispColumn columnOne = columnService.getColumnOne(11, 6);
		 request.setAttribute("columnOne", columnOne);
	        return "/website/cloud/videoDetail";
	    }
  
}
