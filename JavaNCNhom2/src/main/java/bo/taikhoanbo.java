package bo;

import bean.khachhangbean;
import dao.taikhoandao;

public class taikhoanbo {
	public taikhoandao tkdao = new taikhoandao();
	public khachhangbean kiemtra(String tk, String mk) throws Exception{
		return tkdao.getkh(tk,mk);
	}
	public int taotk(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception{
		return tkdao.taokh(hoten, diachi, sodt, email, tendn, pass);
	}
	public boolean kiemtratendn(String tendn) throws Exception{
		return tkdao.kiemTraTendn(tendn);
	}
}
