package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.khachhangbean;
import bean.loaibean;
import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getsach() throws Exception {
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "select * from sach";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String masach = rs.getString("masach");
			String tensach = rs.getString("tensach");
			String tacgia = rs.getString("tacgia");
			long gia = rs.getLong("gia");
			long soluong = rs.getLong("soluong");
			String anh = rs.getString("anh");
			String maloai = rs.getString("maloai");
			ds.add(new sachbean(masach, tensach, tacgia, gia, soluong, anh, maloai));
		}
		rs.close();
		return ds;
	}

	public sachbean get1sach(String masach) throws Exception {
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "select * from sach where masach=?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		ResultSet rs = cmd.executeQuery();
		sachbean sach = null;
		if (rs.next()) {
			String tensach = rs.getString("tensach");
			String tacgia = rs.getString("tacgia");
			long gia = rs.getLong("gia");
			long soluong = rs.getLong("gia");
			String anh = rs.getString("anh");
			String maloai = rs.getString("maloai");
			sach = new sachbean(masach, tensach, tacgia, gia, soluong, anh, maloai);
		}
		rs.close();
		return sach;
	}

	public int count(String searchValue, String ml) throws Exception {
		int count = 0;
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		if (!searchValue.isEmpty())
			searchValue = "%" + searchValue + "%";
		String sql = "SELECT COUNT(*) FROM sach WHERE (? = '' OR tensach LIKE ?) and (? = '' or maloai like ?)";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, searchValue);
		cmd.setString(2, searchValue);
		cmd.setString(3, ml);
		cmd.setString(4, ml);
		ResultSet rs = cmd.executeQuery();
		if (rs.next()) {
			count = rs.getInt(1);
		}

		return count;
	}

	public ArrayList<sachbean> getsach(int page, int pageSize, String searchValue, String ml) throws Exception {
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		if (!searchValue.isEmpty())
			searchValue = "%" + searchValue + "%";

		String sql = "SELECT * FROM ( " + "SELECT *, ROW_NUMBER() OVER (ORDER BY tensach) AS RowNumber "
				+ "FROM sach " + "WHERE (? = '' OR tensach LIKE ?) and (? = '' or maloai like ?) " + ") AS t "
				+ "WHERE ? = 0 OR t.RowNumber BETWEEN (? - 1) * ? + 1 AND ? * ?";

		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, searchValue);
		cmd.setString(2, searchValue);
		cmd.setString(3, ml);
		cmd.setString(4, ml);
		cmd.setInt(5, pageSize);
		cmd.setInt(6, page);
		cmd.setInt(7, pageSize);
		cmd.setInt(8, page);
		cmd.setInt(9, pageSize);

		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String masach = rs.getString("masach");
			String tensach = rs.getString("tensach");
			String tacgia = rs.getString("tacgia");
			long gia = rs.getLong("gia");
			long soluong = rs.getLong("soluong");
			String anh = rs.getString("anh");
			String maloai = rs.getString("maloai");
			ds.add(new sachbean(masach, tensach, tacgia, gia, soluong, anh, maloai));
		}
		return ds;
	}
}
