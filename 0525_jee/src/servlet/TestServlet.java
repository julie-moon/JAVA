package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// HttpServlet을 상속받으면 servlet이 됨
public class TestServlet extends HttpServlet{
	
	public TestServlet() {
		System.out.println("생성-!");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("초기화-!");
		
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서비스-!");
		/*
  		    jsp는 HTML 안에 자바 코드 삽입
 
			Servlet은 java 안에 html 삽입
			Servlet은 주소와 맵핑이 반드시 필요함
		*/
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE>");
		out.println("<html lang='ko'>");
		out.println("<head>"); 
		out.println("<meta charset='UTF-8' />");
		out.println("<title>Hello Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello!</h1>");
		out.println("</body>");
		out.println("</html>");
	}
	
	@Override
	public void destroy() {
		System.out.println("죽었어요");
	}
	
} // TestServlet end
