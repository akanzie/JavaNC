package bo;



import java.util.List;

import bean.chitietgiohangbean;
import bean.chitiethoadonbean;
import bean.hoadonbean;
import bean.lichsumuabean;
import dao.hoadondao;

public class hoadonbo {
	public hoadondao hddao = new hoadondao();
	public int taohd(List<chitietgiohangbean> gh, long makh) throws Exception{
		if (gh.size() == 0)
			return 0;
		long millis=System.currentTimeMillis();   
		java.sql.Date ngaylaphd=new java.sql.Date(millis);  
		long mahd = hddao.taohd(makh, ngaylaphd);		
		for(chitietgiohangbean item: gh) {
			hddao.ThemCTHD(mahd, item.getMasach(), item.getSoluong());
		}
		return 1;
	}
	public List<hoadonbean> GetHD(long makh, boolean damua) throws Exception{
		return hddao.GetHD(makh, damua);
	}
	public List<chitiethoadonbean> GetCTHD(long mahoadon) throws Exception{
		return hddao.GetCTHD(mahoadon);
	}
	public List<lichsumuabean> getLSmua(long makh, int damua) throws Exception{
		return hddao.GetLSmua(makh, damua);
	}
}
