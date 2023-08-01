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

import bo.giohangbo;
import bean.chitietgiohangbean;
import bean.chitiethoadonbean;
/**
 * Servlet implementation class gioController
 */
@WebServlet("/gio")
public class gioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public gioController() {
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
			String ms = request.getParameter("ms");
			String ts = request.getParameter("ts");
			String gia = request.getParameter("gia");
			String anh = request.getParameter("anh");
			giohangbo ghbo = new giohangbo();
			if (ms != null && ts != null && gia != null && anh != null) {				
				List<chitietgiohangbean> ctgh = new ArrayList<chitietgiohangbean>();
				// Neu mua hang lan dau
				if (session.getAttribute("gh") == null) {
					session.setAttribute("gh", ctgh);// Tao gio
				}
				// Gian session: gh vao bien: g
				ghbo.ds = (List<chitietgiohangbean>) session.getAttribute("gh");
				
				// Them hang vao bien: g
				ghbo.Them(ms, ts, Long.parseLong(gia), anh);
				// Luu bien vao session
				session.setAttribute("gh", ghbo.ds);
				session.setAttribute("tongtien", ghbo.Tongtien());
				response.sendRedirect("gio");
			} else {
				/*
				 * if (ms != null && ts == null) { giohangbo g = (giohangbo)
				 * session.getAttribute("gh"); g.XoaItem(ms); if (g.ds.size() == 0)
				 * session.removeAttribute("gh"); else session.setAttribute("gh", g); }
				 */				
				RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
				rd.forward(request, response);
			}
		}catch (Exception e) {
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
