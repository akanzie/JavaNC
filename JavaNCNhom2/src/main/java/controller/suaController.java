package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.chitietgiohangbean;
import bo.giohangbo;

/**
 * Servlet implementation class suaController
 */
@WebServlet("/sua")
public class suaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public suaController() {
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
			HttpSession session = request.getSession();
			giohangbo g = new giohangbo();
			g.ds = (List<chitietgiohangbean>) session.getAttribute("gh");
			String ms = request.getParameter("ms");
			if (ms == null) {
				response.sendRedirect("gio");
			}
			String sl = request.getParameter("txtsua".concat(ms));
			if (sl != null) {
				g.CapNhatSL(ms, Integer.parseInt(sl));
				session.setAttribute("gh", g.ds);
			}
			response.sendRedirect("gio");
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
