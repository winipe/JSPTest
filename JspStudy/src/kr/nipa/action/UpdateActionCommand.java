package kr.nipa.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.nipa.javabeans.Member;
import kr.nipa.javabeans.db.MemberDAO;

public class UpdateActionCommand implements ActionCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member member = new Member();
		
		if (member != null) {
			member.setId(request.getParameter("id"));
			member.setPwd(request.getParameter("pwd"));
			member.setName(request.getParameter("name"));
			member.setAddress(request.getParameter("address"));
			member.setPhone1(request.getParameter("phone1"));
			member.setPhone2(request.getParameter("phone2"));
			member.setPhone3(request.getParameter("phone3"));
			member.setEmail_id(request.getParameter("email_id"));
			member.setEmail_site(request.getParameter("email_site"));
			
			MemberDAO memberDAO = MemberDAO.getInstance();
			
			if (memberDAO != null) {
				boolean bSuccess = memberDAO.updateMember(member);
				if (bSuccess)
					request.setAttribute("success", bSuccess);
			}
		}
		
		new GetListActionCommand().execute(request, response);
	}
}
