package kr.nipa.javabeans;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;

import kr.nipa.javabeans.db.DBManager;

public class Join {
	private String id;
	private String name;
	private String pwd;
	private String address;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email_id;
	private String email_site;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail_site() {
		return email_site;
	}
	public void setEmail_site(String email_site) {
		this.email_site = email_site;
	}
	
	public boolean processOfJoin() throws ServletException
	{
		Connection conn = null;
		PreparedStatement ps = null;
		boolean bSuccess = false;
		
		try {
			String query = "insert into user (id, name, pwd, address, phone1, phone2, phone3, email_id, email_site) values (?,?,?,?,?,?,?,?,?)";

			conn = DBManager.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, pwd);
			ps.setString(4, address);
			ps.setString(5, phone1);
			ps.setString(6, phone2);
			ps.setString(7, phone3);
			ps.setString(8, email_id);
			ps.setString(9, email_site);
			
			int result = ps.executeUpdate();
			
			if (result > 0)
				bSuccess = true;
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			DBManager.close(conn, ps);
		}
		
		return bSuccess;
	}
}
