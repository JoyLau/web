package com.jltfisp.web.message.controller;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jltfisp.base.controller.BaseController;
import com.jltfisp.base.entity.PageInfo;
import com.jltfisp.base.service.IBaseService;
import com.jltfisp.login.entity.JltfispUser;
import com.jltfisp.login.service.LoginService;
import com.jltfisp.web.message.entity.Message;
import com.jltfisp.web.message.service.IMessageService;


/**
 * 数据访问
 * @author freameworkGenerator
 *
 */
@Controller
@RequestMapping("/message")
public class MessageController extends BaseController<Message> {

    private static final Logger logger = LoggerFactory
            .getLogger(MessageController.class);

    @Autowired
    private IMessageService messageService;
    @Autowired
    private LoginService loginService;
    
    @Override
	public IBaseService<Message> getEntityService() {
		return messageService;
	}

	@Override
	public String getFileBasePath() {
		return "website/usercenter/";
	}

	@Override
	public String getPageName() {
		return "Message";
	}

	@Override
	public void getMenuIndex(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}
	@Override
	@RequestMapping(value = "/page")
	public String page(HttpServletRequest request, Message t) throws Exception {
		JltfispUser currentUser = loginService.getCurrentUser();
		t.setUserid(currentUser.getId());
		PageInfo info  = preparePageinfo(request,t);
		info.setBy("push_date");
		String result = handlePage(request, info, t);
		return result;
	}

	@RequestMapping("/showDetail")
	public String showDetail(Integer id,HttpServletRequest request) {
		
		Message message = messageService.selectByPk(id);
		request.setAttribute("message", message);
		return "/website/usercenter/messageDetail";
	}
  
}
