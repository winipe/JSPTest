package kr.nipa.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.nipa.javabeans.Member;
import kr.nipa.javabeans.db.MemberDAO;

public class GetActionCommand implements ActionCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			MemberDAO memberDAO = MemberDAO.getInstance();
			
			if (memberDAO != null) {
				Member memberInfo = memberDAO.getMemberInfo(id);
				if (memberInfo != null)
					request.setAttribute("memberInfo", memberInfo);
				
				String url = "memberInfo.jsp?id=" + id + "&pageNum=" + request.getParameter("pageNum");;
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
