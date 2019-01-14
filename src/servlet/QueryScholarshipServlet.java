package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import db.*;
import beans.*;

import java.util.*;
public class QueryScholarshipServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public QueryScholarshipServlet() {
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
           String id=request.getParameter("id3");
           String xuenian=request.getParameter("xuenian");//diyixuenian
           String xueyuan=request.getParameter("xueyuan");//id
           String sdept=request.getParameter("sdept");//name
           String banji=request.getParameter("banji");//1°à
           String querystyle=request.getParameter("ra");//1,2
           String text=request.getParameter("id");//id
           DBOperation db=new DBOperation();
           String s="student/queryschoolarship.jsp";
           ArrayList al,al2;String type;
          ///  
           System.out.print(xueyuan);
           System.out.print(sdept);
           System.out.print(banji);
           HttpSession session=request.getSession(true);
           al=db.query("xueyuan","","","","");
           al2=db.query("sdept","","","","");      
           
           
           request.setAttribute("id",id);
           request.setAttribute("xsize",new Integer(al.size()));
           request.setAttribute("ssize",new Integer(al2.size()));
           session.setAttribute("xueyuan", al);
           session.setAttribute("sdept", al2);
           if(sdept!=null){
        	   type="yes";
        	   request.setAttribute("type", type);
        	   if(querystyle.equals("1")){
        		   
        		  al=db.query(xueyuan, sdept, banji, xuenian,"x");
        	   }
        	   else{
        		   al=db.query("student","sid", text,"","");
        	   }
        	   request.setAttribute("xy1", xueyuan);
        	   request.setAttribute("sd", sdept);
        	   request.setAttribute("bj", banji);
        	   session.setAttribute("stu",al);
              // request.setAttribute("currentPage",new Integer(4));
           }
              
           RequestDispatcher dispatcher=request.getRequestDispatcher(s);      
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
