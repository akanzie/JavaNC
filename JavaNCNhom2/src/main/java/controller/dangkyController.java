package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.taikhoanbo;

/**
 * Servlet implementation class dangkyController
 */
@WebServlet("/dangky")
public class dangkyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dangkyController() {
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
			String hoten = request.getParameter("hoten");
			String diachi = request.getParameter("diachi");
			String sodt = request.getParameter("sodt");
			String email = request.getParameter("email");
			String tendn = request.getParameter("tendn");
			String pass = request.getParameter("pass");
			String repass = request.getParameter("repass");
			String loi = "";
			if (hoten != null && diachi != null && sodt != null && email != null && tendn != null && pass != null && repass != null) {
				taikhoanbo tkbo = new taikhoanbo();
				if(!pass.equals(repass)) {
					loi = "Mật khẩu không trùng khớp!";
					request.setAttribute("loi", loi);
					RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
					rd.forward(request, response);
				}
				else if (tkbo.kiemtratendn(tendn)) {
					loi = "Tên đăng nhập không hợp lệ!";
					request.setAttribute("loi", loi);
					RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
					rd.forward(request, response);
				} else {
					int makh = tkbo.taotk(hoten, diachi, sodt, email, tendn, pass);
					if (makh == 1) {
						response.sendRedirect("dangnhap");
					} else {
						loi = "Thông tin của bạn không hợp lệ!";
						request.setAttribute("loi", loi);
						RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
						rd.forward(request, response);
					}
				}
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
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
