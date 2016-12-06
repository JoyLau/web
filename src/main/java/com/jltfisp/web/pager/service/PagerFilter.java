package com.jltfisp.web.pager.service;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

  
public class PagerFilter extends HttpServlet implements Filter {  
	private static final long serialVersionUID = 1L;
	
   public void destroy() {  
	    }  
	  
   public void doFilter(ServletRequest request, ServletResponse response,  
	           FilterChain chain) throws IOException, ServletException {  
	         
	       HttpServletRequest httpRequest = (HttpServletRequest)request;
	       SystemContext.setOffset(getOffset(httpRequest));  
	       SystemContext.setPagesize(getPagesize(httpRequest));  
	         
	       try{  
	           chain.doFilter(request, response);  
	        }finally{  
	            //清空ThreadLocal中的值  
	           SystemContext.removeOffset();  
	           SystemContext.removePagesize();  
	       }  
	          
	   }  
	     
   protected int getOffset(HttpServletRequest request){  
	       int offset = 0;  
	        try {  
	        
	        offset = Integer.parseInt(request.getParameter("pager.offset"));//这里是pager-taglib的一个属性获取当前页  
	 
	      } catch (NumberFormatException ignore) {  
	       }  
	       return offset;  
	    }  
	      
	   protected int getPagesize(HttpServletRequest request){  
	       return 10;//设置每页显示10条数据.这里可以进行更灵活的控制  
	    }  
	 
	    public void init(FilterConfig arg0) throws ServletException {  
	    }
}
