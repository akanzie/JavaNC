package bean;

public class chitietgiohangbean {
	private String masach;
	private String tensach;	
	private long gia;
	private long soluong;
	private String anh;	
	private long thanhtien;
	public chitietgiohangbean(String masach, String tensach, long gia, String anh) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.gia = gia;
		this.soluong = 1;
		this.anh = anh;
		this.thanhtien = gia*soluong;
	}
	public chitietgiohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMasach() {
		return masach;
	}
	public void setMasach(String masach) {
		this.masach = masach;
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
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
}
