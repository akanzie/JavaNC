package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoidao {
	public static Connection cn;
	public void KetNoi() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			System.out.println("Ok da nap Driver");
			String st="jdbc:sqlserver://KITHG:1433;databaseName=QlSach;user=sa;password=1";
			cn=DriverManager.getConnection(st);
			//System.out.println("Da ket noi csdl Qlsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}
	public static void main(String[] args) {
			ketnoidao cs=new ketnoidao();
			cs.KetNoi();
		}
}