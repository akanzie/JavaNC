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

import bean.chitietgiohangbean;
import bean.khachhangbean;
import bo.giohangbo;
import bo.hoadonbo;

/**
 * Servlet implementation class luuController
 */
@WebServlet("/luu")
public class luuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public luuController() {
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
			khachhangbean kh = (khachhangbean) session.getAttribute("un");
			if (kh != null) {
				hoadonbo hdbo = new hoadonbo();
				if (session.getAttribute("gh") != null) {
					List<chitietgiohangbean> giohang = (List<chitietgiohangbean>) session.getAttribute("gh");
					if (giohang.size() != 0) {
						if (hdbo.taohd(giohang, kh.getMakh()) == 1) {
							session.removeAttribute("gh");
							session.removeAttribute("tongtien");
						}
						String thongbao = "Đặt mua thành công!";
						request.setAttribute("thongbao", thongbao);
						RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
						rd.forward(request, response);
					}
				} else {
					String thongbao = "Giỏ hàng trống!";
					request.setAttribute("thongbao", thongbao);
					RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
					rd.forward(request, response);
				}
			} else {
				String loi = "Vui lòng đăng nhập để có thể mua hàng!";
				request.setAttribute("loi", loi);
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
