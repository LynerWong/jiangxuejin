package login;

import java.io.*;
import db.*;
import service.*;
import beans.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet(){
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
			throws ServletException, IOException{
		 request.setCharacterEncoding("utf-8");
		 String name=request.getParameter("username");
         String pass=request.getParameter("password");
         String selected=request.getParameter("loginType");
         String forword="";int l=-1;String xueyuanid="";
         DBOperation db;int length;Operation op;
         String name1="";
         //
         //try{
        // DB d=new DB();
         //d.sc();}catch(Exception e){System.out.println("chaxun"+e);}
         
         if(selected.equals("1")){//学生
        	 db=new DBOperation();
        	 StudentBean ss[]=new StudentBean[10000];
        	 ArrayList al=db.query("student","","","","");al.toArray(ss);
        	 length=al.size();
        	 //System.out.println(ss[0].getSid());
        	 op=new Operation();l=op.search(name, ss, length);
        	 if(l!=-1&&ss[l].getSpassword().equals(pass)){name1=ss[l].getSname(); forword="forward/student.jsp";}
             else  forword="forward/failure.jsp";
        	 
         }
         else if(selected.equals("2")){//教师
        	 db=new DBOperation();
        	 TeacherBean ss[]=new TeacherBean[10000];
        	 ArrayList al=db.query("teacher","","","","");al.toArray(ss);
        	 length=al.size();
        	 op=new Operation();l=op.search2(name, ss, length);
        	 if(l!=-1&&ss[l].getTpassword().equals(pass)){name1=ss[l].getTname(); forword="forward/teacher.jsp";}
             else  forword="forward/failure.jsp";
        	 
         }
         else if(selected.equals("3")){//辅导员
        	 db=new DBOperation();
        	 ManagerBean ss[]=new ManagerBean[10000];
        	 ArrayList al=db.query("manager","","","","");al.toArray(ss);
        	 length=al.size();
        	 op=new Operation();l=op.search3(name, ss, length);
        	 if(l!=-1&&ss[l].getMpassword().equals(pass)){name1=ss[l].getMname();xueyuanid=ss[l].getXueyuanid(); forword="forward/manager.jsp";}
             else  forword="forward/failure.jsp";
         }
         else{                 //教务处
        	 db=new DBOperation();
        	 HmangerBean ss[]=new HmangerBean[10000];
        	 ArrayList al=db.query("hmanager","","","","");al.toArray(ss);
        	 length=al.size();
        	 op=new Operation();l=op.search4(name, ss, length);
        	 if(l!=-1&&ss[l].getHpassword().equals(pass)){name1=ss[l].getHname(); forword="forward/hmanager.jsp";}
             else  forword="forward/failure.jsp";
        	 
         }
         
         HttpSession session=request.getSession(true);
         session.setAttribute("name1",name1);
    	 session.setAttribute("userid", name);
    	 session.setAttribute("xueyuan11", xueyuanid);
    	 session.setAttribute("password",pass);
    	 
         RequestDispatcher rd=request.getRequestDispatcher(forword);	 
         rd.forward(request, response);
	
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
