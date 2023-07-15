package dao;

import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		ds.add(new loaibean("ct", "Chính trị"));
		ds.add(new loaibean("vh", "Văn học"));
		ds.add(new loaibean("tin", "Công nghệ thông tin"));
		ds.add(new loaibean("yk", "Y Khoa"));
		return ds;
	}
}
