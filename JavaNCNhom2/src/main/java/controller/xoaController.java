package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.chitietgiohangbean;
import bo.giohangbo;

/**
 * Servlet implementation class xoaController
 */
@WebServlet("/xoa")
public class xoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public xoaController() {
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
			giohangbo ghbo = new giohangbo();
			if(session.getAttribute("gh")!=null)
				ghbo.ds = (List<chitietgiohangbean>) session.getAttribute("gh"); 			
			String ms = request.getParameter("ms");

			if (ms != null) {
				if (ms.equals("all")) {
					session.removeAttribute("gh");
					session.removeAttribute("tongtien");
				}
				else {
					ghbo.XoaItem(ms);
					if (ghbo.ds.size() == 0) {
						session.removeAttribute("gh");
						session.removeAttribute("tongtien");
						}
					else
						session.setAttribute("gh", ghbo.ds);
				}
			} else {
				String[] selectedIds = request.getParameterValues("selected");
				if (selectedIds != null && selectedIds.length > 0) {
					for (String item : selectedIds) {
						ghbo.XoaItem(item);
					}
					if (ghbo.ds.size() == 0) {
						session.removeAttribute("gh");
						session.removeAttribute("tongtien");
					} else
						session.setAttribute("gh", ghbo);
				}
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
