package kr.nipa.javabeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;

import kr.nipa.javabeans.db.DBManager;

public class Member {
	private int num;
	private String id;
	private String pwd;
	private String name;
	private String address;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email_id;
	private String email_site;
	
	private String pageNumber;
	private int totalPage;
	
	ArrayList<Member> list = new ArrayList<Member>();
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public Member getMemberInfo() throws ServletException
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Member member = null;
		
		try {
			conn = DBManager.getConnection();
			
			String sql = "select * from user where id = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);;
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				member = new Member();
				member.setNum(rs.getInt("num"));
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setAddress(rs.getString("address"));
				member.setPhone1(rs.getString("phone1"));
				member.setPhone2(rs.getString("phone2"));
				member.setPhone3(rs.getString("phone3"));
				member.setEmail_id(rs.getString("email_id"));
				member.setEmail_site(rs.getString("email_site"));
			}
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			DBManager.close(conn, ps, rs);
		}
		
		return member;
	}
	
	public boolean deleteMember() throws ServletException
	{
		Connection conn = null;
		PreparedStatement ps = null;
		boolean bSuccess = false;
		
		try {
			conn = DBManager.getConnection();
			
			String sql = "delete from user where id = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);;
			
			int result = ps.executeUpdate();
			
			if (result > 0) {
				bSuccess = true;
			}
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			DBManager.close(conn, ps);
		}
		
		return bSuccess;
	}
	
	public ArrayList<Member> getMemberList() throws ServletException
	{
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			int pageNum = 0;
			if (pageNumber != null)
				pageNum = Integer.parseInt(pageNumber);
			
			conn = DBManager.getConnection();
			
			final int PAGE_SIZE = 3;
			
			String totalList = "select count(*) from user";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(totalList);
			int totalCount = 0;
			if (rs.next())
				totalCount = rs.getInt(1)	;
			
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
	
			int offset = (pageNum - 1) * PAGE_SIZE;
			totalPage = totalCount / PAGE_SIZE + 1;
			
			String query = "select * from user order by num desc limit ? offset ?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, PAGE_SIZE);
			ps.setInt(2, offset);
				
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Member member = new Member();
				
				member.setNum(rs.getInt("num"));
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setAddress(rs.getString("address"));
				member.setPhone1(rs.getString("phone1"));
				member.setPhone2(rs.getString("phone2"));
				member.setPhone3(rs.getString("phone3"));
				member.setEmail_id(rs.getString("email_id"));
				member.setEmail_site(rs.getString("email_site"));
				
				list.add(member);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			DBManager.close(conn, ps, rs);
		}
		
		return list;
	}
}
