package kr.nipa.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.nipa.javabeans.Member;
import kr.nipa.javabeans.db.MemberDAO;

public class GetListActionCommand implements ActionCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
			
			String pageNum = request.getParameter("pageNum");
			MemberDAO memberDAO = MemberDAO.getInstance();

			if (memberDAO != null) {
				memberDAO.setPageNumber(pageNum);
				ArrayList<Member> list = memberDAO.getMemberList();
				if (list != null) {
					request.setAttribute("memberList", list);
					request.setAttribute("totalPage", memberDAO.getTotalPage());
				}
				
				String url = "./memberList.jsp?pageNum=" + pageNum;
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
