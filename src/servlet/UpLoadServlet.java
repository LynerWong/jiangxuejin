package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import service.*;
import java.util.*;
import beans.*;
public class UpLoadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpLoadServlet() {
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
        String filename=request.getParameter("file2");
        System.out.println(filename);
		ArrayList<StudentBean> al;
		Operation op=new Operation();int n=1;String info="";
		String s="manager/upload.jsp";
		al=ImportDataFromExcel.readExcel(filename);
        String xuenian=request.getParameter("xuenian");
        for(StudentBean ss:al){
        int i=op.updateFeiziyu(ss.getSixiangbase(), ss.getSixiangjiafen(), ss.getShenxinbase(),ss.getShenxinjiafen(),ss.getKejibase(), ss.getKejijiafen(), ss.getSid(), xuenian);
        if(i==-1) n=-1;
        }
        if(n==1) info="上传成功！！";
        else info="上传失败！！";
        request.setAttribute("info", info);
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
