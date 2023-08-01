package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bean.sachbean;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class sachController
 */
@WebServlet("/sach")
public class sachController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sachController() {
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
			HttpSession session = request.getSession();
			loaibo lbo = new loaibo();
			sachbo sbo = new sachbo();
			ArrayList<loaibean> dsloai = lbo.getloai();
			int page = 1, pageSize = 21, rowCount = 0;
			String key = "", ml = "";
			if (request.getParameter("page") == null && request.getParameter("key") == null
					&& request.getParameter("ml") == null) {
				session.setAttribute("key", key);
				session.setAttribute("ml", ml);
			} else {
				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				if (request.getParameter("key") != null)
					key = request.getParameter("key");
				else if (request.getParameter("ml") != null)
					ml = request.getParameter("ml");
				else if (session.getAttribute("ml") != null && session.getAttribute("key") != null) {
					ml = (String) session.getAttribute("ml");
					key = (String) session.getAttribute("key");
				}
				session.setAttribute("key", key);
				session.setAttribute("ml", ml);
			}
			ArrayList<sachbean> dssach = sbo.getsach(page, pageSize, key, ml);

			rowCount = sbo.count(key, ml);
			int pageCount = rowCount / pageSize;
			if (rowCount % pageSize > 0)
				pageCount += 1;

			session.setAttribute("pageCount", pageCount);
			session.setAttribute("page", page);
			request.setAttribute("dsloai", dsloai);
			/*
			 * if (ml != null) { dssach = sbo.TimMa(ml); } else if (key != null) { dssach =
			 * sbo.Tim(key); session.setAttribute("key", key); }
			 */
			request.setAttribute("dssach", dssach);
			RequestDispatcher rd = request.getRequestDispatcher("htsach.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
