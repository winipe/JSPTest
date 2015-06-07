package kr.nipa.javabeans.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;

import kr.nipa.javabeans.Member;

public class MemberDAO {
	private String pageNumber;
	private int totalPage;
	
	private static MemberDAO instance = null;

	private MemberDAO() {
	}
	
	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
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

	public boolean insertMember(Member member) throws ServletException
	{
		Connection conn = null;
		PreparedStatement ps = null;
		boolean bSuccess = false;
		
		try {
			String query = "insert into user (id, name, pwd, address, phone1, phone2, phone3, email_id, email_site) values (?,?,?,?,?,?,?,?,?)";

			conn = DBManager.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, member.getId());
			ps.setString(2, member.getName());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getAddress());
			ps.setString(5, member.getPhone1());
			ps.setString(6, member.getPhone2());
			ps.setString(7, member.getPhone3());
			ps.setString(8, member.getEmail_id());
			ps.setString(9, member.getEmail_site());
			
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
	
	public Member getMemberInfo(String id) throws ServletException
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
	
	public boolean deleteMember(String id) throws ServletException
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
	
	public boolean updateMember(Member member) throws ServletException
	{
		Connection conn = null;
		PreparedStatement ps = null;
		boolean bSuccess = false;
		
		try {
			String query = "update user set id=?, name=?, pwd=?, address=?, phone1=?, phone2=?, phone3=?, email_id=?, email_site=? where id=?";

			conn = DBManager.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, member.getId());
			ps.setString(2, member.getName());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getAddress());
			ps.setString(5, member.getPhone1());
			ps.setString(6, member.getPhone2());
			ps.setString(7, member.getPhone3());
			ps.setString(8, member.getEmail_id());
			ps.setString(9, member.getEmail_site());
			ps.setString(10, member.getId());
			
			if (ps.executeUpdate() > 0)
				bSuccess = true;
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				// ignore exception
			}
		}
		
		return bSuccess;
	}
	
	public ArrayList<Member> getMemberList() throws ServletException
	{
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			int pageNum = 1;
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
	
	public boolean checkLogin(String id, String pwd) throws ServletException
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
