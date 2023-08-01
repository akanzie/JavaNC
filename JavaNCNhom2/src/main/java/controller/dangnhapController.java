package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.taikhoanbo;

/**
 * Servlet implementation class dangnhapController
 */
@WebServlet("/dangnhap")
public class dangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dangnhapController() {
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
			String tk = request.getParameter("txtun");
			String mk = request.getParameter("txtpass");
			String loi = "";
			HttpSession session = request.getSession();
			if (tk != null && mk != null) {
				taikhoanbo tkbo = new taikhoanbo();
				khachhangbean kh = tkbo.kiemtra(tk, mk);
				if (kh != null) {
					if (session.getAttribute("un") == null)
						session.setAttribute("un", kh);
					response.sendRedirect("sach");
				} else {
					loi = "Thông tin đăng nhập của bạn không hợp lệ!";
					request.setAttribute("tk", tk);
					request.setAttribute("loi", loi);
					RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
					rd.forward(request, response);
				}
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
				rd.forward(request, response);
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
