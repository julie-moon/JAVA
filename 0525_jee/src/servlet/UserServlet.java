package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.User;

public class UserServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("msg", "하하핫");
		
		// UsersService에서 getList()해서 
		
		List<User> list = new ArrayList<>();
		list.add(new User("wingging", "19990529", "윙깅"));
		list.add(new User("sparrow", "12345678", "참새"));
		list.add(new User("babpul", "12345678", "윤리더"));
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/users.jsp");
		
		rd.forward(request, response);
		
	} // service() end
	
}
