package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import service.*;
import java.util.*;
import beans.*;
import db.*;
public class CaluScholarServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CaluScholarServlet() {
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
		Operation op=new Operation();
		DBOperation db=new DBOperation();
		HttpSession session=request.getSession(true);
		String xu=(String)session.getAttribute("xueyuan11");
		ArrayList<StudentBean> al=db.query(xu, "","", "","r");
		ArrayList<StudentCourseBean> al2,al3;
		float f;
		for(StudentBean aa:al){
			al2=db.query("ziyuscore", "sid", aa.getSid(), "", "");
			if(al2.size()!=0){
			f=op.calu(al2);
			op.insert2(aa.getSid(),f);
			op.updateCalucredit(aa.getSid());}
		}
		ArrayList<SdeptBean> a2=db.query("sdept", "","", "","");
		for(SdeptBean ss:a2){
			op.sore(ss.getSdid());
		}
		String info="统计成功！！";
		request.setAttribute("info", info);
		String s="manager/right.jsp";
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
