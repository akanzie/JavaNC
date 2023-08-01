package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.khachhangbean;


public class taikhoandao {
	public khachhangbean getkh(String tk, String mk) throws Exception {
		khachhangbean kh = new khachhangbean();
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "select * from KhachHang where tendn=? and pass=?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, tk);
		cmd.setString(2, mk);
		ResultSet rs = cmd.executeQuery();
		kh = null;
		if (rs.next()) {
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodt = rs.getString("sodt");
			String email = rs.getString("email");
			String tendn = rs.getString("tendn");
			String pass = rs.getString("pass");
			kh = new khachhangbean(makh, hoten, diachi, sodt, email, tendn, pass);
		}
		cs.cn.close();
		rs.close();
		return kh;

	}
	public boolean kiemTraTendn(String tendn) throws Exception {
	    ketnoidao cs = new ketnoidao();
	    cs.KetNoi();
	    String sql = "SELECT COUNT(*) AS count FROM KhachHang WHERE tendn = ?";
	    PreparedStatement cmd = cs.cn.prepareStatement(sql);
	    cmd.setString(1, tendn);
	    ResultSet result = cmd.executeQuery();
	    if (result.next() && result.getInt("count") > 0) {
	        return true;
	    }
	    return false;
	}
	public int taokh(String hoten, String diachi, String sodt, String email, String tendn, String pass)
			throws Exception {
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "insert into KhachHang(hoten, diachi, sodt, email, tendn, pass) values (?,?,?,?,?,?)";
		// B2: Tao ra cau lenh: Preparestatement de thuc thi cau lenh sql
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, diachi);
		cmd.setString(3, sodt);
		cmd.setString(4, email);
		cmd.setString(5, tendn);
		cmd.setString(6, pass);
		// b3: Thuc hien cau lenh
		return cmd.executeUpdate();
	}
}
