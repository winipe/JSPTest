package kr.nipa.javabeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.sql.DataSource;

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
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

			String query = "select * from user where id = ? and pwd = ?";

			conn = ds.getConnection();
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
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				// ingnored
			}
		}
		
		return bFind;
	}
}
