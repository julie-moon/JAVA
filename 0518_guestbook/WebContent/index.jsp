<%@page import="org.jbm.guestbook.vo.Guest"%>
<%@page import="java.util.List"%>
<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Guest> list = GuestbookDAO.selectList();

	// 현재 들어온 사람의 ip 얻기(들어온 사람의 ip와 작성자의 ip가 일치할 때만 수정/삭제 보이게 하려고)
	String nowIp = request.getRemoteAddr();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>방명록</title>
		<%@ include file="/WEB-INF/templete/link.jsp" %>
	 	<style>
	 		#content>h2 {
	 			font-size:38px;
	 			color:#2196F3;;
	 			margin:20px 0;
				font-weight:700;
	 		}
	 		
	 		#content li {
	 			width:658px;
	 			min-height:128px;
	 			border:1px solid #2196F3;;
	 			margin:10px 0;
	 			padding:20px;
	 			position: relative;
	 			color:#424242;
	 			box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	 		}
	 		
	 		#content li.no {
	 			font-size:30px;
	 			font-weight:700;
	 			color:#2196F3;
	 			text-align: center;
	 			line-height:148px;
	 		}
	 		
			#content .update {
				position: absolute;
				top:10px;
				right:100px;
			}

	 		#content .delete {
	 			position: absolute;
	 			right:10px;
	 			top:10px;
	 		}
	 		
	 		#content li>h3{
	 			margin-bottom:10px;
	 		}
	 		
	 		#content li strong {
	 			font-size:25px;
	 			color:#2196F3;;
	 			margin-right:5px;
	 		}
	 		
	 		#content li strong a {
	 			color:#1565C0;
	 			text-decoration: none;
				font-weight:500;
	 		}
	 		
	 		#content li strong a:hover {
	 			text-decoration: underline;
	 		}
	 		
	 		#content li time {
	 			font-size:18px;
	 			color:#90CAF9;
	 		}
	 		
	 		#content li>p {
	 			min-height:110px;
	 			color:#424242;
	 			font-size:19px;
	 			line-height:1.3em;
	 			text-align: justify;
	 			white-space: pre-wrap;
				word-wrap:break-word;
				font-weight:200;
	 		}
	 	</style>
	</head>
	<body>
			<%@ include file="/WEB-INF/templete/header.jsp" %>
				<h2><i class="fa fa-book"></i> 방명록 리스트</h2>
				<ul>
				<%if(list.isEmpty()) { %>
					<li class="no"><i class="fa fa-hand-scissors-o"></i> 방명록 글이 없네요.</li>
				<% } %>
				<%for(Guest guest : list) { %>
					<li>
						<h3>
							<strong>
								<i class="fa fa-commenting-o"></i>
								<a href="http://<%=guest.getIp()%>"><%=guest.getWriter()%></a>
							</strong>
							<time>
								<i class="fa fa-clock-o"></i>
								<%=guest.getRegdate()%>
							</time>
							<% if(nowIp.equals(guest.getIp())) { %>
								<a href="deleteGuestbook.jsp?no=<%=guest.getNo()%>" class="delete btn"><i class="fa fa-remove"></i> 삭제</a>
								<a href="updateForm.jsp?no=<%=guest.getNo()%>" class="update btn"><i class="fa fa-pencil-square-o"></i> 수정</a>
							<% } %>
						</h3>
						<p><%=guest.getContents()%></p>
					</li>
				<% } %>	
				</ul>
				<div class="btn_box">
					<a class="btn" href="writeForm.jsp"><i class="fa fa-pencil"></i> 글쓰기</a>
				</div>
			<%@ include file="/WEB-INF/templete/footer.jsp" %>
	</body>
</html>
    