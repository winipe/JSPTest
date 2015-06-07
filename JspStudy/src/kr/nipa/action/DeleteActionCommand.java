package kr.nipa.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.nipa.javabeans.Member;
import kr.nipa.javabeans.db.MemberDAO;

public class DeleteActionCommand implements ActionCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		if (memberDAO != null) {
			boolean bSuccess = memberDAO.deleteMember(request.getParameter("id"));
			if (bSuccess)
				request.setAttribute("success", bSuccess);
		}
		
		new GetListActionCommand().execute(request, response);
	}

}
