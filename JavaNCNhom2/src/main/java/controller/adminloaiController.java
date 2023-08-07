package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;
import bo.hoadonbo;
import bo.loaibo;

/**
 * Servlet implementation class adminloaiController
 */
@WebServlet("/adminloai")
public class adminloaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminloaiController() {
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
			loaibo lbo = new loaibo();
			String maloai = request.getParameter("txtmaloai");
			String tenloai = request.getParameter("txttenloai");
			if (maloai != "" && tenloai != "") {
				if (request.getParameter("butadd") != null)
					lbo.themloai(maloai, tenloai);
				else if (request.getParameter("butupdate") != null)
					lbo.sualoai(maloai, tenloai);
			}
			else {
				request.setAttribute("loi", "Vui lòng nhập đầy đủ thông tin.");
			}
			String tab = request.getParameter("tab");
			String ml = request.getParameter("ml");
			if(tab !=null) {
				if(tab.equals("select")) {					
					request.setAttribute("maloai", ml);
					request.setAttribute("tenloai", lbo.gettenloai(ml));
				}
				else if(tab.equals("delete")) {
					lbo.xoaloai(ml);
				}
			}
			request.setAttribute("ds", lbo.getloai());
			RequestDispatcher rd = request.getRequestDispatcher("adminloai.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
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
