package servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import db.*;
import java.util.*;
public class QueryScoreServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public QueryScoreServlet() {
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
		ArrayList al,al2,al3;
		HttpSession session=request.getSession(true);
		String sid=(String)session.getAttribute("userid");
		String type=request.getParameter("type");
		DBOperation db=new DBOperation();
		al=db.query(sid, type,"", "", "y");
		al2=db.query(sid, type,"", "", "z");
		al3=db.query("course", "","", "", "");
		request.setAttribute("al", al);
		request.setAttribute("al2", al2);
		request.setAttribute("al3", al3);
		String href="student/querycredit.jsp";
		RequestDispatcher dispatcher=request.getRequestDispatcher(href);
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
