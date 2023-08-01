package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.naming.java.javaURLContextFactory;

import bean.chitietgiohangbean;
import bean.chitiethoadonbean;
import bean.hoadonbean;
import bean.lichsumuabean;
import bean.loaibean;

import java.security.AlgorithmParametersSpi;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class hoadondao {
	public int taohd(long makh, Date ngayMua) throws Exception {
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "insert into hoadon(makh, NgayMua, damua) values (?,?,?)";
		// B2: Tao ra cau lenh: Preparestatement de thuc thi cau lenh sql
		PreparedStatement cmd = cs.cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		cmd.setLong(1, makh);
		cmd.setDate(2, new java.sql.Date(ngayMua.getTime()));
		cmd.setBoolean(3, false);
		// b3: Thuc hien cau lenh
		cmd.executeUpdate();
		int mahd = -1;
		ResultSet generatedKeys = cmd.getGeneratedKeys();
		if (generatedKeys.next()) {
			mahd = generatedKeys.getInt(1);
		}
		cs.cn.close();
		return mahd;
	}

	public int ThemCTHD(long MaHoaDon, String MaSach, long SoLuongMua) throws Exception {
		// B1: tao cau lenh sql
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "insert into ChiTietHoaDon(MaSach, SoLuongMua, MaHoaDon, damua) values (?,?,?,?)";
		// B2: Tao ra cau lenh: Preparestatement de thuc thi cau lenh sql
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, MaSach);
		cmd.setLong(2, SoLuongMua);
		cmd.setLong(3, MaHoaDon);
		cmd.setBoolean(4, false);
		// b3: Thuc hien cau lenh
		return cmd.executeUpdate();
	}

	public List<hoadonbean> GetHD(long makh, boolean damua) throws Exception {
		List<hoadonbean> ds = new ArrayList<hoadonbean>();
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "select * from hoadon where makh=? and damua=?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		cmd.setBoolean(2, damua);
		// b3: Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long MaHoaDon = rs.getLong("MaHoaDon");
			Date ngayMua = rs.getDate("NgayMua");
			ds.add(new hoadonbean(MaHoaDon, makh, (java.sql.Date) ngayMua, damua));
		}
		cs.cn.close();
		rs.close();
		return ds;
	}

	public List<chitiethoadonbean> GetCTHD(long mahoadon) throws Exception {
		List<chitiethoadonbean> ds = new ArrayList<chitiethoadonbean>();
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "select * from ChiTietHoaDon where MaHoaDon=?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, mahoadon);
		// b3: Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long MaChiTietHD = rs.getLong("MaChiTietHD");
			String MaSach = rs.getString("MaSach");
			long SoLuongMua = rs.getLong("SoLuongMua");

			Boolean damua = rs.getBoolean("damua");
			ds.add(new chitiethoadonbean(MaChiTietHD, MaSach, SoLuongMua, mahoadon, damua));
		}
		cs.cn.close();
		rs.close();
		return ds;
	}

	public List<lichsumuabean> GetLSmua(long makh, int damua) throws Exception {
		List<lichsumuabean> ds = new ArrayList<lichsumuabean>();
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = null;
		PreparedStatement cmd = null;
		if (damua == 1 || damua == 0) {
			sql = "select h.maHoaDon, makh, ngayMua, h.damua, maChiTietHD, "
					+ "s.MaSach, tensach, soLuongMua, gia, anh, ct.damua as ctdamua "
					+ "from hoadon h inner join ChiTietHoaDon ct on h.MaHoaDon = ct.MaHoaDon "
					+ "inner join sach s on ct.MaSach=s.MaSach where h.makh=? and h.damua=? " + "order by ngayMua desc";
			cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, makh);
			cmd.setInt(2, damua);

		} else {
			sql = "select h.maHoaDon, makh, ngayMua, h.damua, maChiTietHD, "
					+ "s.MaSach, tensach, soLuongMua, gia, anh, ct.damua as ctdamua "
					+ "from hoadon h inner join ChiTietHoaDon ct on h.MaHoaDon = ct.MaHoaDon "
					+ "inner join sach s on ct.MaSach=s.MaSach where h.makh=? " + "order by ngayMua desc";
			cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, makh);
		}
		// b3: Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long maHoaDon = rs.getLong("maHoaDon");
			Date ngayMua = rs.getDate("NgayMua");
			boolean damua2 = rs.getBoolean("damua");
			long maChiTietHD = rs.getLong("MaChiTietHD");
			String MaSach = rs.getString("MaSach");
			String tensach = rs.getString("tensach");
			long soLuongMua = rs.getLong("SoLuongMua");
			long gia = rs.getLong("gia");
			String anh = rs.getString("anh");
			boolean ctdamua = rs.getBoolean("ctdamua");
			ds.add(new lichsumuabean(maHoaDon, makh, ngayMua, damua2, maChiTietHD, MaSach, tensach, soLuongMua, gia,
					anh, ctdamua));
		}
		cs.cn.close();
		rs.close();
		return ds;
	}
}
