package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class tam
 */
@WebServlet("/tam")
public class tam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//tao ra doi tuong out
//		PrintWriter out= response.getWriter();
//		out.print("<html><body>Alo</body></html>");
		//tao ra doi tuong session
		HttpSession session= request.getSession();
		session.setAttribute("tam", "Xin chao");
		//tao ra bien request de chuyen ve jsp
		request.setAttribute("a", (long)15);
		request.setAttribute("b", "haha");
		String[] dsht= {"Thu", "Lan", "Diep", "Le"};
		request.setAttribute("ds", dsht);
		//chuyen tiep doi tuong request va response ve trang t.jsp
		RequestDispatcher rd= request.getRequestDispatcher("t1.jsp?kt=1");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
