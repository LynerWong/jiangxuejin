package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import db.*;
import service.*;
public class AddServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddServlet() {
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
		ArrayList al,al2;
		String info="",forward="";
		DBOperation db=new DBOperation();
		Operation op=new Operation();
		String id=request.getParameter("id");
		if(id.equals("3")){//student
		    al=db.query("xueyuan","","","","");
            al2=db.query("sdept","","","",""); 
            request.setAttribute("xsize",new Integer(al.size()));
            request.setAttribute("ssize",new Integer(al2.size()));
            request.setAttribute("xueyuan", al);
            request.setAttribute("sdept", al2);
            String sdid=request.getParameter("sdept");
            String banji=request.getParameter("banji");
            String s1=request.getParameter("sid");
			String s2=request.getParameter("sname");
			String s3=request.getParameter("password");
			
			if(s1!=null){
				int ss=op.insert("student", "sid", s1, sdid, s3, banji, s2, "3");
				if(ss==1) info=" 添加成功！";
				else info=" 该学生已存在！";
				request.setAttribute("info", info);
			}
            forward="hmanager/addstu.jsp";}
		if(id.equals("1")){//manager
			al=db.query("xueyuan","","","","");
			request.setAttribute("xueyuan", al);
			String s1=request.getParameter("mid");
			String s2=request.getParameter("mname");
			String s3=request.getParameter("password");
			String s4=request.getParameter("xueyuan");
			if(s1!=null){
				int ss=op.insert("manager", "mid", s1, s2, s3, s4, "", "1");
				if(ss==1) info=" 添加成功！";
				else info=" 该管理员已存在！";
				request.setAttribute("info", info);
			}
	        forward="hmanager/addmanager.jsp";}
		if(id.equals("2")){//sdept
			al=db.query("xueyuan","","","","");
	        request.setAttribute("xueyuan", al);
	        String s1=request.getParameter("sdid");
	        String s2=request.getParameter("sdname");
	        String s3=request.getParameter("classcount");
	        String xueyuanid=request.getParameter("xueyuan");
	        if(s1!=null){
				int ss=op.insert("sdept", "sdid", s1, s2, xueyuanid, s3, "", "2");
				if(ss==1) info=" 添加成功！";
				else info=" 该专业已存在！";
				request.setAttribute("info", info);
			}
	        forward="hmanager/addsdept.jsp";}
		if(id.equals("4")){//teacher
	        String s1=request.getParameter("tid");
	        String s2=request.getParameter("tname");
	        String s3=request.getParameter("password");
	        if(s1!=null){
				int ss=op.insert("teacher", "tid", s1, s2, s3,"", "", "4");
				if(ss==1) info=" 添加成功！";
				else info=" 该教师已存在！";
				request.setAttribute("info", info);
			}
	        forward="hmanager/addteacher.jsp";}
		if(id.equals("5")){//xueyuan
			String s1=request.getParameter("xueyuanid");
	        String s2=request.getParameter("xueyuanname");
	        System.out.println(s2);
	        if(s1!=null){
				int ss=op.insert("xueyuan", "xueyuanid", s1, s2, "","", "", "5");
				if(ss==1) info=" 添加成功！";
				else info=" 该学院已存在！";
				request.setAttribute("info", info);
			}
	        forward="hmanager/addxueyuan.jsp";}
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
