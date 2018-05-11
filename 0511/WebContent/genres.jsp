<%@page import="com.jbm.mms.dao.MoviesDAO"%>
<%@page import="com.jbm.mms.vo.Movie"%>
<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@page import="com.jbm.mms.vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Genre> list = GenresDAO.genreList();
	/*
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	*/
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <title>장르 리스트</title>
	    <%@ include file="/WEB-INF/template/link.jsp" %>
	    <style>
	        #genreInputBox{
	            width: 998px;
	            margin: auto;
				border-bottom:1px dotted #5542bb;
	        }
			#content h2 {
				 font-size: 30px;
	            font-weight: 700;
				color: #5542BB;
				margin: 20px;
	            text-align: center;
			}
	        #genreBox{
	            width: 542px;
	            height: 80px;
	            font-size: 20px;
	            position: relative;
	            margin: auto;
	            /*background-color: red;*/
	            overflow: hidden;
	        }
	        #genreBox>input{
	            width: 500px;
	            height: 30px;
	            font-family: 'Noto Sans KR', sans-serif;
	            font-size: 20px;
	            padding: 10px 20px;
	            border: none;
	            border: 1px solid #e0e0e0;
	            border-radius: 100px;
	            position: absolute;
	            left: 0;
	            top: 15px;
	            color: #8373dd;
				transition:.2s ease-out;
	        }
	        #genreBox>button{
	            height: 30px;
	            width: 30px;
	            background-color:#ffffff;
	            outline: 0;
	            border: 0;
	            font-size: 20px;
	            position: absolute;
	            right: 20px;
	            top: 25px;
	            color:#e0e0e0;
	        }
	        #genreBox>button:hover{
	            color: #8373dd ;
	            cursor: pointer;
	        }
	        #genreBox>input:focus+button{
	            color: #8373dd;
	        }
	        #genreBox>input:focus{
	            border: 1px solid #8373dd;
	            outline: none;
	        }
	        #content{
	            width: 1000px;
	            margin: auto;
				padding-bottom:20px;
	        }
	        #content #genreList{
	            overflow: hidden;
	        }
	        #content .genre{
	            width: 235px;
	            height: 80px;
	            background-color: #EEEEEE;
	            font-size: 18px;
	            border: 1px solid #E0E0E0;
	            float: left;
	            margin-left: 10px;
	            margin-bottom: 10px;
	            /*margin-bottom: 10px;*/
	            position: relative;
				text-align:center;
				line-height:80px;
	        }
	        #content .genre:hover{
	            background-color: #EDE8F9;
	            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	        }
	
	        #content .no{
	            padding: 1px 3px;
	            font-size: 20px;
	            font-weight: 600;
	            vertical-align: middle;
	            background-color: #5542bb;
	            color: #ffffff;
	        }
	        #content .genre_title{
	            font-weight: 500;
	            font-size: 30px;
	            color: #424242;
	            /*background-color: yellow;*/
	        }
	        #content .genre_title>.title{
	            vertical-align: middle;
	        }
	        #content .delete{
	           width: 30px;
	            height: 30px;
	            font-size: 18px;
	            text-align: center;
	            line-height: 28px;
	            background-color: #BDBDBD;
	            position: absolute;
	            top: 8px;
	            border-radius: 15px;
				transition:.1s ease-out;
				right:8px;
				opacity:.1;
				cursor: pointer;
	        }
			#content .genre:hover .delete {
				opacity:1;
			}
	        #content .delete:hover{
	            background-color: #5542bb ;
				
	            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	        }
	        #content .delete>a{
	            text-decoration: none;
	            color: #ffffff;
	        }
	
	    </style>
	</head>
	<body>
		<%@include file="/WEB-INF/template/header.jsp" %>
		<div id="content">
		    <div id="genreInputBox">
		        <h2>장르입력</h2>
		        <form id="genreForm" action="insertGenre.jsp" method="post">
		            <div id="genreBox">
		                <input id="search" name="genre" placeholder="장르를 입력하세요" autocomplete="off"/>
		                <button id="searchBtn" title="입력"><i class="fa fa-keyboard-o"></i></button>
		            </div><!--#genreBox -->
		        </form><!--//#genreForm -->
		    </div><!--//#genreInputBox -->
			<h2>장르 목록</h2>
		    <ul id="genreList">
		    	<% if(list.isEmpty()) { %>
		        <li class="genre">
		            <h3 class="genre_title">
		                <span class="title">장르없음</span>
		            </h3><!--//.genre_title -->
		        </li><!--//.genre -->
		        <% } %>
				<% for(Genre genre : list) {
					// genreCount() 인자 값이 변수가 되어야 함..!
					int genreNum = MoviesDAO.genreCount(genre.getNo());
				%>
				<li class="genre">
		            <h3 class="genre_title">
		                <i class="no"><%=genre.getNo()%></i>
		                <span class="title"><%=genre.getName()%></span>
		            </h3><!--//.genre_title -->
		            <%-- 
		            	!!!!!!!장르에 해당하는 영화가 있을 때 삭제 버튼 안뜨게 처리하기!!!!!!!!
		            	MoviesDAO.genreCount() 인자값으로 genre 번호 어떻게 넘겨줘야 하는지 고민해보기!  
		            --%>   
		            <% if(genreNum == 0) { %>
		            	<div class="btn delete"><a href="deleteGenre.jsp?no=<%=genre.getNo()%>" title="삭제"><i class="fa fa-trash"></i></a></div>
		            <% } %>
		        </li><!--//.genre -->
		        <% } %>
		    </ul><!--#genreList -->
		</div><!--//#content -->
		<%@include file="/WEB-INF/template/footer.jsp" %>
		<script src="js/jquery.js"></script>
		<script>
		    var $delete = $(".delete");
		    $delete.click(function () {
		    	confirm("정말로 삭제하시겠습니까?");
		    })
		</script>
	</body>
</html>