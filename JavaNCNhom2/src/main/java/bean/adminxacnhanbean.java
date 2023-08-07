package bean;

public class adminxacnhanbean {
	public long MaChiTietHoaDon;
	public String hoten;
	public String tensach;
	public long gia;
	public long SoLuongMua;
	public long thanhtien;
	public boolean damua;
	public adminxacnhanbean(long maChiTietHoaDon, String hoten, String tensach, long gia, long soLuongMua,
			long thanhtien, boolean damua) {
		super();
		MaChiTietHoaDon = maChiTietHoaDon;
		this.hoten = hoten;
		this.tensach = tensach;
		this.gia = gia;
		SoLuongMua = soLuongMua;
		this.thanhtien = thanhtien;
		this.damua = damua;
	}
	public adminxacnhanbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getMaChiTietHoaDon() {
		return MaChiTietHoaDon;
	}
	public void setMaChiTietHoaDon(long maChiTietHoaDon) {
		MaChiTietHoaDon = maChiTietHoaDon;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
}
