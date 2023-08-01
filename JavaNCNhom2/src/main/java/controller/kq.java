package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class kq
 */
@WebServlet("/kq")
public class kq extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public kq() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tama = request.getParameter("txta");
		String tamb = request.getParameter("txtb");
		if(tama == null || tamb == null) {
			RequestDispatcher rd= request.getRequestDispatcher("maytinh.jsp");
			rd.forward(request, response);
		}else {
			int a = Integer.parseInt(tama);
			int b = Integer.parseInt(tamb);
			int kq= 0;
			if(request.getParameter("butc")!=null) {
				kq = a + b;
			}
			if(request.getParameter("butt")!=null) {
				kq = a - b;
			}
			if(request.getParameter("butn")!=null) {
				kq = a * b;
			}
			if(request.getParameter("butchia")!=null) {
				kq = a / b;
			}			
			request.setAttribute("a", a);
			request.setAttribute("b", b);			
			request.setAttribute("kq", kq);
			RequestDispatcher rd= request.getRequestDispatcher("maytinh.jsp");
			rd.forward(request, response);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
