package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bean.lichsumuabean;
import bo.hoadonbo;

/**
 * Servlet implementation class lichsumuahangController
 */
@WebServlet("/lichsumuahang")
public class lichsumuahangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public lichsumuahangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			hoadonbo hdbo = new hoadonbo();
			HttpSession session = request.getSession();
			if (session.getAttribute("un") != null) {
				int damua = 2;
				if (request.getParameter("damua") != null) {
					 damua = Integer.parseInt(request.getParameter("damua"));					
				}
				khachhangbean kh = (khachhangbean) session.getAttribute("un");
				List<lichsumuabean> ds = hdbo.getLSmua(kh.getMakh(), damua);
				request.setAttribute("dshd", ds);
				RequestDispatcher rd = request.getRequestDispatcher("lichsumuahang.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("dangnhap");
			}

		} catch (Exception e) {
			// TODO: handle exception
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
