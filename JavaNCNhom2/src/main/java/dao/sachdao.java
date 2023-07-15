package dao;

import java.util.ArrayList;

import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getsach() throws Exception{
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		ds.add(new sachbean("s1", "Trải nghiệm và khát vọng cuộc sống","Anne Morrow Lindbergh", 10000, 10, "b1.jpg", "vh"));
		ds.add(new sachbean("s2", "Bí mật của may mắn","Lâm", 20000, 20, "b2.jpg", "vh"));
		ds.add(new sachbean("s3", "Chắp cánh tuổi thơ","Sơn", 1000, 50, "b3.jpg", "vh"));
		ds.add(new sachbean("s4", "Hạt giống yêu thương","Kha", 10000, 20, "b4.jpg", "vh"));
		ds.add(new sachbean("s5", "Tư tưởng HCM","Lê Nam", 10000, 20, "b5.jpg", "ct"));
		ds.add(new sachbean("s6", "Triết học","Lê Sơn", 10000, 20, "b6.jpg", "ct"));
		ds.add(new sachbean("s7", "Java","Phan Lâm", 10000, 20, "b7.jpg", "tin"));
		return ds;
	}
}
