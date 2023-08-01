package bo;

import java.util.ArrayList;

import bean.sachbean;
import dao.sachdao;

public class sachbo {
	sachdao sdao= new sachdao();	
	ArrayList<sachbean> ds;
	public ArrayList<sachbean> getsach() throws Exception{
		ds=sdao.getsach();
		return ds;
	}
	public ArrayList<sachbean> getsach(int page, int pageSize, String searchValue, String ml) throws Exception{
		ds=sdao.getsach(page, pageSize, searchValue, ml);
		return ds;
	}
	public int count(String searchValue, String ml) throws Exception{
		return sdao.count(searchValue, ml);
	}
	public ArrayList<sachbean> TimMa(String maloai) throws Exception{		
		ArrayList<sachbean> tam= new ArrayList<sachbean>();
		for(sachbean s: ds) {
			if(s.getMaloai().equals(maloai))
				tam.add(s);
		}
		return tam;
	}
	public ArrayList<sachbean> Tim(String key) throws Exception{
		ArrayList<sachbean> tam= new ArrayList<sachbean>();
		for(sachbean s: ds) {
			if(s.getTensach().toLowerCase().contains(key.toLowerCase())
					|| s.getTacgia().toLowerCase().contains(key.toLowerCase()))
				tam.add(s);
		}
		return tam;
	}
}
