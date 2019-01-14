package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import db.*;
import beans.*;
public class ModiffyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModiffyServlet() {
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
		   String p1=request.getParameter("first");
		   String type=request.getParameter("type");
		   HttpSession session=request.getSession(true);
		   String userid=(String)session.getAttribute("userid");
		   DBOperation db=new DBOperation();
		  String forward="";
		   if(type.equals("1")&&db.update("student", "password", p1, "sid", userid)==1){
			   String info="密码修改成功";
			  forward="student/modiffypassword.jsp";
			   request.setAttribute("info",info);
		   }
		   else if(type.equals("2")&&db.update("teacher", "password", p1, "tid", userid)==1){
			   String info="密码修改成功";
			   forward="teacher/modifypass.jsp";
			   request.setAttribute("info",info);
		   }
		   else if(type.equals("3")&&db.update("manager", "password", p1, "mid", userid)==1){
			   String info="密码修改成功";
			   forward="manager/modifypass.jsp";
			   request.setAttribute("info",info);
		   }
		   else if(type.equals("4")&&db.update("hmanager", "password", p1, "hid", userid)==1){
			   String info="密码修改成功";
			   forward="hmanager/modifypass.jsp";
			   request.setAttribute("info",info);
		   }
		   else{
			   String info="密码修改出现异常，请重新修改!";
			   request.setAttribute("info",info);
		   }
		   request.setAttribute("id",type);
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
