package bean;

import java.util.Date;


public class lichsumuabean {
	private long MaHoaDon;
	private long makh;
	private Date NgayMua;
	private boolean damua;
	private long MaChiTietHD;
	private String MaSach;
	private String tensach;
	private long SoLuongMua;
	private long gia;
	private String anh;
	private boolean ctdamua;
	public lichsumuabean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsumuabean(long maHoaDon, long makh, Date ngayMua, boolean damua, long maChiTietHD, String maSach,
			String tensach, long soLuongMua, long gia, String anh, boolean ctdamua) {
		super();
		MaHoaDon = maHoaDon;
		this.makh = makh;
		NgayMua = ngayMua;
		this.damua = damua;
		MaChiTietHD = maChiTietHD;
		MaSach = maSach;
		this.tensach = tensach;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		this.anh = anh;
		this.ctdamua = ctdamua;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public long getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getMaSach() {
		return MaSach;
	}
	public void setMaSach(String maSach) {
		MaSach = maSach;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public boolean isCtdamua() {
		return ctdamua;
	}
	public void setCtdamua(boolean ctdamua) {
		this.ctdamua = ctdamua;
	}	
	
	
}
