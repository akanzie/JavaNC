package bo;

import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import bean.loaibean;
import dao.loaidao;

public class loaibo {

	loaidao ldao= new loaidao();
	public ArrayList<loaibean> getloai() throws Exception{
		return ldao.getloai();
	}
	public int themloai(String maloai, String tenloai) throws Exception {
		ArrayList<loaibean> ds = ldao.getloai();
		for(loaibean l: ds) {
			if(maloai.equals(l.getMaloai())){
				return 0;
			}
		}
		return ldao.themloai(maloai, tenloai);
	}
	public String gettenloai(String maloai) throws Exception {
		ArrayList<loaibean> ds = ldao.getloai();
		for(loaibean l: ds) {
			if(maloai.equals(l.getMaloai())){
				return l.getTenloai();
			}
		}
		return null;
	}
	public int sualoai(String maloai, String tenloai) throws Exception {
		return ldao.sualoai(maloai, tenloai);
	}
	public int xoaloai(String maloai) throws Exception {
		return ldao.xoaloai(maloai);
	}
}
