package kr.nipa.javabeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;

import kr.nipa.javabeans.db.DBManager;

public class Login {
	private String id;
	private String pwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public boolean processOfLogin() throws ServletException
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bFind = false;
		
		try {
			String query = "select * from user where id = ? and pwd = ?";

			conn = DBManager.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				if (rs.getString("id").equals(id)) {
					if (rs.getString("pwd").equals(pwd))
						bFind = true;
						break;
				}
			}
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			DBManager.close(conn, ps, rs);
		}
		
		return bFind;
	}
}
