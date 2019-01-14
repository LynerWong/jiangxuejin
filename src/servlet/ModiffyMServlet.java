package servlet;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import service.*;
import db.DBOperation;
import beans.*;

public class ModiffyMServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModiffyMServlet() {
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
		String forward="manager/updatecredit.jsp";
		String mmm=request.getParameter("modify");
		String xuenian=request.getParameter("xuenian");//diyixuenian
        String sdept=request.getParameter("sdept");//name
        String banji=request.getParameter("banji");//1班
        String querystyle=request.getParameter("ra");//1,2
        String text=request.getParameter("id");//id
		ArrayList al,al2;
		String info="";String type="";
		DBOperation db=new DBOperation();
		Operation op=new Operation();
		HttpSession session=request.getSession(true);
		String xueyuanid=(String)session.getAttribute("xueyuan11");
        al2=db.query("sdept","xueyuanid",xueyuanid,"",""); 
        request.setAttribute("ssize",new Integer(al2.size()));
        request.setAttribute("sdept", al2);
        System.out.println("隐藏"+mmm);
        if(mmm!=null){
        if(!mmm.equals("")){
        	String sss[]=request.getParameterValues("if");
        	for(String ss:sss){
        		String o[]=request.getParameterValues(ss);
        		float f1,f2,f3,f4,f5,f6;
        		f1=Float.parseFloat(o[0]);
        		f2=Float.parseFloat(o[1]);
        		f3=Float.parseFloat(o[2]);
        		f4=Float.parseFloat(o[3]);
        		f5=Float.parseFloat(o[4]);
        		f6=Float.parseFloat(o[5]);
        		if(op.updateFeiziyu(f1, f2, f3, f4, f5, f6, ss, xuenian)==1){
        			info="修改成功！！";
        		}
        		else info="修改异常，请重新修改！！";
        		request.setAttribute("info", info);
        	}
        	
        }
        }
        if(sdept!=null){
      	   type="yes";
      	   request.setAttribute("type", type);
      	   if(querystyle.equals("1")){
      		   
      		  al=db.query("", sdept, banji, xuenian,"x");
      	   }
      	   else{
      		   al=db.query("student","sid", text,"","");
      	   }
      	   
      	   request.setAttribute("sd", sdept);
      	   request.setAttribute("bj", banji);
      	   session.setAttribute("stu",al);
            // request.setAttribute("currentPage",new Integer(4));
         }
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
