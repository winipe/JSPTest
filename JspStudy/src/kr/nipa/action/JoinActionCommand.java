package kr.nipa.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.nipa.javabeans.Member;
import kr.nipa.javabeans.db.MemberDAO;

public class JoinActionCommand implements ActionCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		if (session != null)
			session.removeAttribute("id");
		
		request.setCharacterEncoding("UTF-8");
		
		String url = "main.jsp";
		Member member = new Member();
		
		if (member != null) {
			member.setId(request.getParameter("id"));
			member.setPwd(request.getParameter("pwd"));
			member.setName(request.getParameter("name"));
			member.setName(request.getParameter("address"));
			member.setPhone1(request.getParameter("phone1"));
			member.setPhone1(request.getParameter("phone2"));
			member.setPhone1(request.getParameter("phone3"));
			member.setName(request.getParameter("email_id"));
			member.setName(request.getParameter("email_site"));

			MemberDAO memberDAO = MemberDAO.getInstance();
			
			if (memberDAO != null) {
				boolean bSuccess = memberDAO.insertMember(member);
				if (bSuccess) {
					session.setAttribute("id", member.getId());
				} else {
					url = "joinFailed.jsp";
				}
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
