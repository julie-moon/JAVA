<%@page import="util.PaginateUtil"%>
<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@page import="vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 넘어온 파라미터
	String pageStr = request.getParameter("page");

	// 페이지 번호
	int pageNo = 1;
	
	// 한 페이지 당 보여질 게시물 수
	int numPage = 5;
	
	// numBlock : 한 페이지에 보여질 블록 수
	int numBlock = 5;
	
	// url : 주소 
	String url = "index.jsp";
	
	// param : 파라미터
	String param = "page="; 
	
	// total : 전체 게시물 수
	int total = GroupsDAO.groupCount();

	// 넘어온 페이지가 있으면
	if(pageStr != null) {
		pageNo = Integer.parseInt(pageStr);
	} // if end
	
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
	
	PageVO pageVO = new PageVO(pageNo, numPage);
	List<Group> list = GroupsDAO.groupList(pageVO);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 목록</title>
		<style type="text/css">
			h1{
				font-size:20px;
				margin:10px;
			}
			table{
				border-collapse:collapse;
				width:700px;
			}
			table th, table td{
				border:1px solid #424242;
				padding:5px 10px;
				text-align:center;
			}
			table th{
				background-color:#EEEEEE;
			}
			tfoot a{
				color:#424242;
				text-decoration:none;
			}
		</style>
		<link rel="stylesheet" href="css/paginate.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
	</head>
	<body>
		<h1>그룹 목록</h1>
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>그룹명</th>
					<th>데뷔일</th>
				</tr>
			</thead>
			<tbody>
				<% for(Group group : list) {  %>
				<tr>
					<td><%=group.getNo()%></td>
					<td><%=group.getName()%></td>
					<td><%=group.getDebutDate()%></td>
				</tr>
				<% } %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<div class="">
							<%=paginate%>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>