package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import service.*;
import db.*;
import java.math.*;
import java.util.*;
import beans.*;
public class ScholatSetupServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ScholatSetupServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		request.setCharacterEncoding("utf-8");
		int count=35;//每个班的最大学生数；
		String first=request.getParameter("yideng");
		String second=request.getParameter("erdeng");
		String third=request.getParameter("sandeng");
		float f1=Float.parseFloat(first)/100;
		float f2=Float.parseFloat(second)/100;
		float f3=Float.parseFloat(third)/100;
        DBOperation db=new DBOperation();
        Operation op=new Operation();
        ArrayList  al;String info="成功设置！";
        al=db.query("sdept", "", "", "", "");
        SdeptBean sd[]=new SdeptBean[al.size()];
        al.toArray(sd);int f,s,t;
        for(int i=0;i<al.size();i++){
        	f=Math.round(count*f1*(sd[i].getClasscount()));
        	s=Math.round(count*f2*(sd[i].getClasscount()));
        	t=Math.round(count*f3*(sd[i].getClasscount()));
        	if(op.updateScholarCount(f, s, t, sd[i].getSdid())==-1){
        		info="设置异常，请重新设置！";break;
        	}
        }
        request.setAttribute("info", info);
        String forward="hmanager/setupscholar.jsp";
	    RequestDispatcher dispatcher=request.getRequestDispatcher(forward);
	    dispatcher.forward(request, response);
		
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
