package bo;

import java.util.ArrayList;
import java.util.List;


import bean.chitietgiohangbean;

public class giohangbo {
	public List<chitietgiohangbean> ds = new ArrayList<chitietgiohangbean>();
	
	public void Them(String masach, String tensach, long gia, String anh) throws Exception{
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if (ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {
				long slt = ds.get(i).getSoluong() + 1;
				ds.get(i).setSoluong(slt);
				long g = ds.get(i).getGia();
				long tt = slt * g;
				ds.get(i).setThanhtien(tt);
				return;
			}
		}
		chitietgiohangbean h = new chitietgiohangbean(masach, tensach, gia, anh);
		ds.add(h);
	}
	public void CapNhatSL(String masach, long soluong) throws Exception{
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if (ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {				
				ds.get(i).setSoluong(soluong);
				long g = ds.get(i).getGia();
				long tt = ds.get(i).getSoluong() * g;
				ds.get(i).setThanhtien(tt);
				return;
			}
		}		
	}
	public long Tongtien() throws Exception{
		int n = ds.size();
		long s = 0;
		for (int i = 0; i < n; i++) {
			s = s + ds.get(i).getThanhtien();
		}
		return s;
	}
	public void XoaItem(String masach) throws Exception{		
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if (ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {				
				ds.remove(i);
				return;
			}
		}					
	}
}
