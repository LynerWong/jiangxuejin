package servlet;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import db.*;
import service.*;
public class InputScoreServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public InputScoreServlet() {
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
             Date da=new Date();
             String date=da.toString();
             date=date.substring(24);
             int dd2=Integer.parseInt(date);
             
             System.out.println(String.valueOf(dd2));
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
		     if(course!=null){
		    	int pa=Integer.parseInt(page);
     	        al=op.sc(course, classy, pa);//分页
     	        int pageCount=op.pageCount(course,classy);
     	        request.setAttribute("pageCount", pageCount);
     	        request.setAttribute("ss", s);
     	        request.setAttribute("info", al);//显示学生信息
     	        request.setAttribute("page", new Integer(pa));
     	        request.setAttribute("course", course);
     	        request.setAttribute("classy", classy);
		     }
		     //////////////////////
		     if(setup!=null){
		    	 System.out.println(s);
		    	 if(setup.equals("ss")){
		     	     String sid[]=request.getParameterValues("sid");
		    		 for(String x:sid){
		    			 float f1,f2;
		    			 int dd=Integer.parseInt(x.substring(0, 4));
		    			 if(dd2-dd>0){
		    			 String xy[]=request.getParameterValues(x);
		    			 if(!xy[0].equals("")&&!xy[1].equals("")){
		    			 f1=Float.parseFloat(xy[0]);
		    			 f2=Float.parseFloat(xy[1]);
		    			 op.update(course, classy, x, f1, f2,String.valueOf(dd2-dd));
		    			 infom="成功录入";
		    			 System.out.println("更新成功");}
		    			 }
		    			 else infom="对不起，现在还不能录入成绩！";
		    		 }
		    		 request.setAttribute("infom", infom);
		    	 }
		     }
		    ////////////////
		    
		    String forward="teacher/inputscore.jsp";
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
