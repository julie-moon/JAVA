<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@page import="com.jbm.mms.vo.Genre"%>
<%@page import="com.jbm.mms.dao.MoviesDAO"%>
<%@page import="com.jbm.mms.vo.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	List<Movie> list;
	String q = request.getParameter("q");
	// System.out.println("q : " + q);
	String type = request.getParameter("type"); 
	
	if(q == null) {
		q = " ";
	} // if end
	
	if(type == null) {
		type = "audienceNum";		
	} // if end
	
	list = MoviesDAO.movieList(q, type); 
	
	List<Genre> genreList = GenresDAO.genreList();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <title>영화 리스트</title>
	    <%@ include file="/WEB-INF/template/link.jsp" %>
	    <style>
	        #searchBox{
	            width: 542px;
	            height: 80px;
	            font-size: 20px;
	            position: relative;
	            margin: auto;
	            /*background-color: red;*/
	            overflow: hidden;
	            text-align: center;
	
	        }
	        #searchBox>input{
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
	        }
	        #searchBox>button{
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
	        #searchBox>button:hover{
	            color: #8373dd;
	            cursor: pointer;
	        }
	        #searchBox>input:focus+button{
	            color: #8373dd;
	        }
	        #searchBox>input:focus{
	            border: 1px solid #8373dd;
	            outline: none;
	
	        }
	        #content{
	            width: 1000px;
	            margin: auto;
				position:relative;
				padding-bottom:50px;
	        }
	        #content #movieList{
	            overflow: hidden;
	        }
	        #content .movie{
	            width: 488px;
	            height: 120px;
	            background-color: #EEEEEE;
	            font-size: 15px;
	            border: 1px solid #E0E0E0;
	            float: left;
	            margin-left: 10px;
	            margin-bottom: 10px;
	            position: relative;
	        }
	        #content .movie:hover{
	            background-color: #EDE8F9;
	            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	        }
			.movie strong {
	            font-weight: 700;
	        }
	        .movie_rating{
	            padding: 1px 3px;
	            font-size: 13px;
	            font-weight: 600;
	            vertical-align: middle;
	        }
	        .rating_C{
	            background-color: #FFA726;
	            color: #ffffff;
	        }
	        .rating_C::before{
	            content:"15";
	        }
	
	        .rating_A{
	            background-color: #66BB6A;
	            color: #ffffff;
	        }
	        .rating_A::before{
	            content:"all";
	        }
	        .rating_B{
	            background-color: #29B6F6;
	            color: #ffffff;
	        }
	        .rating_B::before{
	            content:"12";
	        }
	        .rating_D{
	            background-color: #E53935;
	            color: #ffffff;
	        }
	        .rating_D::before{
	            content:"19";
	        }
	        
	        .audience_num{
	            width: 150px;
	            position: absolute;
	            color: #757575;
	            font-size: 21px;
	            font-weight: 700;
	            bottom:15px;
	            right: 15px;
	            text-align: right;
	        }
			.audience_num strong {
				font-size:18px;
			}
	        
	        .section_title{
	            max-width: 350px;
	            font-weight: 700;
	            font-size: 24px;
	            color: #424242;
	            position: absolute;
	            top: 10px;
	            left: 15px;
	            white-space: nowrap;
	            text-overflow: ellipsis;
	            overflow: hidden;
	        }
	        .section_title>.title{
	            vertical-align: middle;
	        }
			.genre{
	            position: absolute;
	            top:50px;
	            left:15px;
	            font-size: 15px;
	            color: #616161;
	        }
	        .director{
	            color:#757575;
	            position: absolute;
	            top: 70px;
	            left: 15px;
	            font-size: 15px;
	            /*background-color: yellow;*/
	        }
			.release_date{
	            position: absolute;
	            color: #757575;
	            top: 90px;
	            left: 15px;
	            font-size: 15px;
	        }
	        
	
			#content .movie:hover .btn {
				opacity:1;
			}
	
	        #content .btn{
	            width: 30px;
	            height: 30px;
	            font-size: 18px;
	            text-align: center;
	            line-height: 28px;
	            background-color: #BDBDBD;
	            position: absolute;
	            top: 8px;
				opacity:.1;
	            border-radius: 15px;
				transition:.1s ease-out;
	        }
	        #content .delete{
	            right: 8px;
	        }
	        #content .modify{
	            right: 42px;
	        }
	
	        #content .btn:hover{
	            cursor: pointer;
	            background-color: #5542bb ;
	            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	        }
	        #content a{
	            text-decoration: none;
	            color: #ffffff;
	        }
	
			#orderBox {
				position:absolute;
				right:0;
				top:30px;
			}
			#orderBox li {
				float:left;
				
				margin-left:5px;
				vertical-align:middle;
			}
			#orderBox li>a{
				display:block;
				padding:10px;
				border:1px solid #666;
				border-radius:30px;
				color:#424242;
				font-size:15px;
			}
			#orderBox li.on>a {
				background:#5542bb;
				color:#fff;
				font-weight:500;
			}
	
			#content #insert {
				position:absolute;
				bottom:10px;
				border:1px solid  #5542BB;
				border-radius:30px;
				padding:10px 12px;
				right:0;
				color:#5542BB;
				font-weight:500;
			}
	
			#content #insert:hover {
				background:#5542BB;
				color:#fff;
			}
	    </style>
	</head>
	<body>
		<%@include file="/WEB-INF/template/header.jsp" %>
		<div id="content">
		        <form id="searchForm" action="movies.jsp" method="get">
		        <input type="hidden" name="type" value=<%=type%> /> 
		            <div id="searchBox">
		                <input id="search" name="q" placeholder="검색할 영화를 입력하세요" autocomplete="off"/>
		                <button id="searchBtn"><i class="fa fa-search"></i></button>
		            </div>
		        </form>
		        <% if(list.isEmpty()) { %>
		        	<img src="img/003.gif" alt="TV 보고 있는 라이언" />
		        <% } else {%>
				<ul id="orderBox">
					<li class="<%if(type.equals("")||type.equals("audienceNum")){%>on<% }%>"><a href="movies.jsp?type=audienceNum">관객수</a></li>
					<li class="<%if(type.equals("releaseDate")){%>on<% }%>"><a href="movies.jsp?type=releaseDate">개봉일</a></li>
				</ul>
		    	<ul id="movieList">
			    	<% for(Movie movie : list) { %>
			        <li class="movie">
						<h2 class="section_title">
			                <i class="movie_rating rating_<%=movie.getRating()%>"></i><!--//.movie_rating -->
			                <span class="title"><%=movie.getName()%></span>
			            </h2><!--//.section_title -->
						<div class="genre">
							<strong>장르</strong>
							<%=movie.getGenreName()%>
						</div><!--//.genre--> 
			            <div class="director">
			                <strong>감독</strong>
			               <%=movie.getDirector()%>
			            </div><!--//.director-->
						<div class="release_date">
							<strong>개봉일</strong>
			                <%=movie.getRealeaseDateStr()%>
			            </div><!--//.release_date -->
			            <div class="audience_num">
			                <%=movie.getAudienceNumStr()%><strong>명</strong>
			            </div>
			            <div class="btn delete"><a href="deleteMovie.jsp?no=<%=movie.getNo()%>" title="삭제"><i class="fa fa-trash"></i></a></div>
			            <div class="btn modify"><a href="updateForm.jsp?no=<%=movie.getNo() %>" title="수정"><i class="fa fa-wrench"></i></a></div>
			        </li><!--//.movie-->
			        <% } %>
		   		 </ul><!--#movieList -->
		    	 <% } %>
				 <% if(!genreList.isEmpty()) { %>
				 	<a id="insert" href="insertForm.jsp"><i class="fa fa-floppy-o"></i> 영화등록</a>
				 <% } %>
		</div><!--//#content -->
		<%@include file="/WEB-INF/template/footer.jsp" %>
		<script src="js/jquery.js"></script>
		<script>
		    var $delete = $(".delete");
		    $delete.click(function () {
		    	if(confirm("영화 를(을) 정말 삭제하시겠습니까?")){
		    		
		    	} else{
		    		return;
		    	}
		    });
		</script>
	</body>
</html>