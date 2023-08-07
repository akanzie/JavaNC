package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception {
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "select * from loai";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new loaibean(maloai, tenloai));
		}
		rs.close();
		return ds;
	}

	public int themloai(String maloai, String tenloai) throws Exception {
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "insert into loai(maloai, tenloai) values(?,?)";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		return cmd.executeUpdate();
	}

	public int sualoai(String maloai, String tenloai) throws Exception {
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "update loai set tenloai = ? where maloai = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, tenloai);
		cmd.setString(2, maloai);
		return cmd.executeUpdate();
	}

	public int xoaloai(String maloai) throws Exception {
		ketnoidao cs = new ketnoidao();
		cs.KetNoi();
		String sql = "delete from loai where maloai = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		return cmd.executeUpdate();
	}
}
