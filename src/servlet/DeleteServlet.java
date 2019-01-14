package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import db.*;
import service.*;
public class DeleteServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteServlet() {
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
		String id=request.getParameter("id");
		String info="",forward="";
		DBOperation db=new DBOperation();
		ArrayList al,al2;
		if(id.equals("1")){//manager
			String m=request.getParameter("m");
			if(m!=null&&!m.equals("")){
				String s1[]=request.getParameterValues("mana");
				for(String s:s1){
					int i=db.delete("manager", "mid", s);
					if(i==1) info="成功删除！";
					else info="删除异常";
				}
				request.setAttribute("info", info);
			}
			al=db.query("manager","","","","");
			request.setAttribute("manager", al);
			forward="hmanager/deletemanager.jsp";
		}
        if(id.equals("2")){//sdept
           	String type=request.getParameter("type1");//searchtype
           	String m=request.getParameter("m");
           	al=db.query("xueyuan","","","","");
			request.setAttribute("xueyuan", al);
			if(type!=null&&type.equals("1")){
			  String xueid=request.getParameter("xueyuan");
			  if(m!=null&&!m.equals("")){
				 String s1[]=request.getParameterValues("mana");
				 for(String s:s1){
					int i=db.delete("sdept", "sdid", s);
					if(i==1) info="成功删除！";
					else info="删除异常";
				 }
				
			    }
			   al2=db.query("sdept","xueyuanid",xueid,"","");
			   request.setAttribute("sdept", al2);}
			if(type!=null&&type.equals("2")){
				Operation op=new Operation();
				String sdid=request.getParameter("sdid");
				if(op.find("sdept", "sdid", sdid)==1){
					int i=db.delete("sdept", "sdid", sdid);
					if(i==1) info="成功删除！";
					else info="删除异常";
				}
				else info="输入的专业号不存在！";
			}
			request.setAttribute("info", info);
        	forward="hmanager/deletesdept.jsp";
		}
        if(id.equals("3")){//student
        	String s1=request.getParameter("sid");
        	Operation op=new Operation();
        	if(s1!=null){
        	if(op.find("student", "sid", s1)==1){
				int i=db.delete("student", "sid", s1);
				if(i==1) info="成功删除！";
				else info="删除异常";
			}
			else info="输入学号不存在！";
        	}
		    request.setAttribute("info", info);
        	forward="hmanager/deletestu.jsp";
         }
        if(id.equals("4")){//teacher
        	String s1=request.getParameter("tid");
        	Operation op=new Operation();
        	if(s1!=null){
        	if(op.find("teacher", "tid", s1)==1){
				int i=db.delete("teacher", "tid", s1);
				if(i==1) info="成功删除！";
				else info="删除异常";
			}
			else info="输入学号不存在！";
        	}
		    request.setAttribute("info", info);
        	forward="hmanager/deleteteacher.jsp";
		}
        if(id.equals("5")){//xueyuan
        	String m=request.getParameter("m");
			if(m!=null&&!m.equals("")){
				String s1[]=request.getParameterValues("mana");
				for(String s:s1){
					int i=db.delete("xueyuan", "xueyuanid", s);
					if(i==1) info="成功删除！";
					else info="删除异常";
				}
				request.setAttribute("info", info);
			}
			al=db.query("xueyuan","","","","");
			request.setAttribute("xueyuan", al);
        	forward="hmanager/deletexueyuan.jsp";
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
