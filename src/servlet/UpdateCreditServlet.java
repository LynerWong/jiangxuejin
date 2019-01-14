package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.Operation;
import db.DBOperation;

public class UpdateCreditServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateCreditServlet() {
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
////////////////////
          DBOperation db=new DBOperation();
          Operation op=new Operation();
          ////////////////////
          String s="ss";String infom="";
          String page=request.getParameter("page");
          String course=request.getParameter("course");
          String classy=request.getParameter("classs");
          String setup=request.getParameter("setup");
  	      HttpSession session=request.getSession(true);
 	      String userid=(String)session.getAttribute("userid");
  	     ///////////////////
 	     ArrayList  al,al1,al2,al3;
		     al1=db.query(userid,"" ,"", "","a");
		     al2=db.query("tc","tid" ,userid, "","");
		     al3=db.query(userid,"" ,"", "","b");
  	         request.setAttribute("al", al1);
		     request.setAttribute("al2", al2);
		     request.setAttribute("al3", al3);//初始化下拉框
          ////////////////////////
		    
		     //////////////////////
		    if(setup!=null){
		    	 System.out.println(s);
		    	 if(setup.equals("ss")){
		     	     String sid[]=request.getParameterValues("sid");
		    		 for(String x:sid){
		    			 float f1,f2;
		    			 String xy[]=request.getParameterValues(x);
		    			 if(!xy[0].equals("")&&!xy[1].equals("")){
		    			 f1=Float.parseFloat(xy[0]);
		    			 f2=Float.parseFloat(xy[1]);
		    			 op.update(course, classy, x, f1, f2,"");
		    			 infom="成功修改";
		    			 System.out.println("更新成功");}
		    			 
		    		 }
		    		 request.setAttribute("infom", infom);
		    	 }
		     }
		    ////////////////
		    if(course!=null){
			    int pa=Integer.parseInt(page);
	  	        al=op.showCredit(course, classy, pa);//分页xiugai
	  	        int pageCount=op.pageCount(course,classy);
	  	        request.setAttribute("pageCount", pageCount);
	  	        request.setAttribute("ss", s);
	  	        request.setAttribute("info", al);//显示学生信息
	  	        request.setAttribute("page", new Integer(pa));
	  	        request.setAttribute("course", course);
	  	        request.setAttribute("classy", classy);
			     }
		    /////
		    String forward="teacher/updatecredit.jsp";
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
