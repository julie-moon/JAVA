<%@page import="com.jbm.mms.vo.Movie"%>
<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@page import="com.jbm.mms.vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<Genre> list = GenresDAO.genreList();
	Movie movie = new Movie();
	int year = movie.getReleaseYear();
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>MMS 영화 관리 서비스</title>
        <!-- favicon -->
       	<%@ include file="/WEB-INF/template/link.jsp" %>
        <style>
            #content{
                padding:20px 0;
            }
            #insertBox{
                width:500px;
                /*background-color:#FFF;*/
                margin:auto;
                border:2px solid #999;
            }
            #insertBox h2{
                /*background-color:skyblue;*/
                font-size:30px;
                text-align:center;
                padding:30px;
            }
            .row{
                /*background-color:deepskyblue;*/
                margin:15px;
            }
            .row h3{
                display:inline-block;
                width:70px;
                font-size:20px;
                /*background-color:aquamarine;*/
                text-align: right;
                margin-right:20px;
            }
            #insertBox input, #insertBox select{
                font:20px 'koverwatch', sans-serif;
                padding:10px 10px;
                border:2px solid #9E9E9E;
            }
            #insertBox input:focus,
            #insertBox select:focus{
                border-color:hotpink;
                background-color:pink;
            }
            .btn{
                background-color:lightpink;
                color:#FFF;
                border:none;
                display:inline-block;
                padding:8px 15px;
                font:18px 'koverwatch', sans-serif;
                cursor:pointer;
                text-decoration:none;
                transition:.2s ease;
                outline:none;
            }
            .btn:hover{
                background-color:hotpink;
                box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .box_btn{
                margin:40px 20px 25px 20px;
                text-align:right;
            }
        </style>
    </head>
    <body>
       <%@ include file="/WEB-INF/template/header.jsp" %>
	       <section id="insertBox">
	           <h2>영화 입력</h2>    
	           <form id="form" action="insertMovie.jsp" method="post">
	               <fieldset>
	                   <legend class="screen_out">영화 입력 폼</legend>
	                   <div class="row">
	                       <h3>영화명</h3>
	                       <input type="text" id="name" name="name" title="영화명" placeholder="영화명을 입력해주세요" />
	                   </div>
	                   <div class="row">
	                       <h3>감독</h3>
	                       <input type="text" id="director" name="director" title="감독명" placeholder="감독명을 입력해주세요" />
	                   </div>
	                   <div class="row">
	                       <h3>개봉일</h3>
	                       <select id="year" name="year">
	                       <%for(int i=year; i>1904; i--) { %>
	                       		<% if(i==(year-18)) { %>
	                        	<option selected value="<%=i%>"><%=i%></option>
	                       		<% } else { %>
	                       		<option value="<%=i%>"><%=i%></option>
	                       		<% } %>
	                       <% } %>    
	                       </select>년
	                       <select id="month" name="month">
	                    		<%for(int i=1; i<13; i++) { %>
	                            <option value="<%=i%>"><%=i%></option>
	                       		<% } %>    
	                       </select>월
	                       <select id="date" name="date">
	                       		<%for(int i=1; i<32; i++) { %>
	                            <option value="<%=i%>"><%=i%></option>
	                            <% } %>
	                       </select>일
	                   </div>
	                   <div class="row">
	                       <h3>관객수</h3>
	                       <input type="text" id ="audience" name="audience" title="관객수" placeholder="관객 수를 입력해주세요" />명
	                   </div>
	                   <div class="row">
	                       <h3>장르</h3>
	                       <select id="genre" name="genre">
	                       	   <% for(Genre genre : list) { %>
	                           <option value="<%=genre.getNo()%>"><%=genre.getName()%></option>
	                           <% } %>
	                       </select>
	                   </div>
	                   <div class="row">
	                       <h3>관람가</h3>
	                       <select id="rating" name="rating">
	                           <option value="A">전체 관람가</option>
	                           <option value="B">12세 관람가</option>
	                           <option value="C">15세 관람가</option>
	                           <option value="D">19세 관람가</option>
	                       </select>
	                   </div>
	                   <div class="row box_btn">
	                       <button class="btn"><i class="fa fa-floppy-o"></i> 입력</button>
	                       <button class="btn" type="reset"><i class="fa fa-retweet"></i> 입력 취소</button>
	                       <a class="btn" href="movies.jsp">영화 목록으로</a>
	                   </div>
	               </fieldset>
	           </form>
	       </section>
       <%@ include file="/WEB-INF/template/footer.jsp" %>
       <script src="js/jquery.js"></script>
       <script>
       		$('#form').on('submit', function(e){
       			
       			// id가 name인 input 요소의 name 속성 값을 얻어와서 val 변수에 담아줌
       			var val = $('#name').val().trim();
       			// 영화명을 입력하지 않았을 때 수행되는 구문
       			if(val=="") {
       				alert("영화명을 입력하세요-!");
       				$('#name').val("").focus();
       				return false;
       			} // if() end
       				
       			// id가 director인 input 요소의 name 속성 값을 얻어와서 val 변수에 담아줌
       			val = $('#director').val().trim();
       			// 감독명을 입력하지 않았을 때 수행되는 구문
       			if(val=="") {
       				alert("감독명을 입력하세요-!");	
       				$('#director').val("").focus();
       				return false;
       			} // if() end
       			
       			// id가 audience인 input 요소의 name 속성 값을 얻어와서 val 변수에 담아줌
       			val = $('#audience').val().trim();
       			
       			// 관객 수를 입력하지 않았을 때 수행되는 구문
       			if(val.length==0) {
       				alert("관객 수를 입력하세요-!");
       				$('#audience').val("").focus();
       				return false;
       			} // if() end
       			
       			// 관객 수를 숫자가 아닌 문자로 입력했을 때 수행되는 구문
       			if(isNaN(val)) {
       				alert("관객 수는 숫자로 입력하세요-!");
       				$('#audience').val("").focus();
       				return false;
       			} // if() end
       			
       		});
       </script>
    </body>
</html>