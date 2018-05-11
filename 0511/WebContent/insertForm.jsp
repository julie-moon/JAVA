<%@page import="com.jbm.mms.vo.Genre"%>
<%@page import="java.util.List"%>
<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	
	List<Genre> list = GenresDAO.genreList();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <title>영화입력폼</title>
	    <%@ include file="/WEB-INF/template/link.jsp" %>
	    <style>
	        #content{
	            width: 1000px;
	            margin: auto;
	            margin-bottom: 20px;
	        }
	        #formBox .row {
	            margin: 20px 0;
	        }
	        #formBox .row>label {
	            display: inline-block;
	            width: 100px;
	            font-size: 22px;
	            text-align: right;
	            font-weight: 700;
	            color: #757575;
	            margin-right: 10px;
	        }
	
	        #content>h2{
	            color: #5542BB;
	            font-size: 28px;
	            font-weight: 900;
	            margin-bottom: 10px;
	            text-align: center;
	        }
	        #formBox{
	            width: 600px;
	            border: 1px solid #5542BB;
	            margin: auto;
	        }
	        #formBox .row{
	            margin: 20px 0;
	        }
	        #formBox input, #formBox select{
	            border: 2px solid #BDBDBD;
	            height: 30px;
	            font-size: 15px;
	            outline: none;
	            font-family: 'Noto Sans KR', sans-serif;
				padding:2px 5px;
	        }
	        #formBox input:focus{
	            border-color: #8373dd;
	        }
	        #formBox select:focus{
	            border-color: #8373dd;
	        }
	
	        #btnBox {
	            padding: 10px 0;
	            text-align: right;
	            margin-right: 10px;
	        }
	
	        .btn {
	            font-family: 'Noto Sans KR', sans-serif;
	            border: none;
	            cursor: pointer;
	            background: #BDBDBD;
	            color: #fff;
	            text-shadow: 1px 1px 1px #212121;
	            font-size: 15px;
	            font-weight: 900;
	            text-decoration: none;
	            padding: 10px 12px;
	            display: inline-block;
	            line-height: 20px;
	            transition: .1s ease;
	            margin-left:2px;
	            margin-top:-4px;
	            outline:none;
	            border-radius: 50px;
	        }
	
	        .btn:hover {
	            color:#fff;
	            background: #5542BB;
	            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12); ;
	        }
	
	    </style>
	</head>
	<body>
		<%@include file="/WEB-INF/template/header.jsp" %>
		<div id="content">
		    <h2>영화 입력</h2>
		    <div id="formBox">
		        <form method="post" action="insertMovie.jsp">
		            <fieldset>
		                <legend class="screen_out">영화 입력폼</legend>
		                <div class="row">
		                    <label for="name">영화명</label>
		                    <input id="name" name="name" title="영화명을 입력해주세요" placeholder="영화명 입력"/>
		                </div><!--//.row -->
		                <div class="row">
		                    <label for="director">감독</label>
		                    <input id="director" name="director" title="감독을 입력해주세요" placeholder="감독 입력"/>
		                </div><!--//.row -->
		                <div class="row">
		                    <label for="release_date">개봉일</label>
		                    <span id="release_date">
		                        <select id="year" name="year">
		                            <% for(int i=year; i>1904; i--) { %>
		                            	<% if(i==(year-18)) { %>
		                            		<option selected value="<%=i%>"><%=i%></option>
		                            	<% } else{ %>
		                            	<option value="<%=i%>"><%=i%></option> 
		                            	<% } %>
		                            <% } %>
		                        </select><em>년</em>
		                        <select id="month" name="month">
		                            <% for(int i=1; i<13; i++) { %>
		                            	<option value="<%=i%>"><%=i %></option>
		                            <% } %>
		                        </select><em>월</em>
		                        <select id="date" name="date">
		                        	<%-- for문 32를 변수로 바꿔야함..! --%>
		                            <% for(int i=1; i<32; i++) { %>
		                            <option value="<%=i%>"><%=i%></option>
		                            <% } %>
		                        </select><em>일</em>
		                    </span>
		                </div><!--//.row -->
		                <div class="row">
		                    <label for="audience_num">관객수</label>
		                    <input id="audience_num" name="audienceNum" title="관객수를 입력해주세요" placeholder="관객수 입력"/>
		                    <em>명</em>
		                </div><!--//.row -->
		                <div class="row">
		                    <label for="genre">장르</label>
		                    <select id="genre" name="genre" title="장르를 선택해주세요">
		                        <%for(Genre genre : list) { %>
		                        <option value="<%=genre.getNo()%>"><%=genre.getName()%></option>
		                        <% } %>
		                    </select>
		                </div><!--//.row -->
		                <div class="row">
		                    <label for="movieRating">관람가</label>
		                    <select id="movieRating" name="rating" title="관람가능 연령을 선택해주세요">
		                        <option value="A">전체관람가</option>
		                        <option value="B">12세 관람가</option>
		                        <option value="C">15세 관람가</option>
		                        <option value="D">19세 관람가</option>
		                    </select>
		                </div><!--//.row -->
		                <div id="btnBox">
		                    <button type="submit" class="btn">
		                        <i class="fa fa-floppy-o"></i> 영화 등록
		                    </button>
		                    <button type="reset" class="btn">
		                        <i class="fa fa-undo"></i> 리 셋
		                    </button>
		                </div>
		            </fieldset>
		        </form>
		    </div><!--//#formBox-->
		</div><!--//#content -->
		<%@include file="/WEB-INF/template/footer.jsp" %>
		<script src="js/jquery.js"></script>
		<script type="text/javascript" src="js/moment-with-locales.js"></script>
		<script>
			var $year = $("#year");
			var $month = $("#month");
			var $date = $("#date");
			
			$year.change(detectLeapYear);
			$month.change(detectLeapYear);
			
			function detectLeapYear() {
				var year = $year.val();
				var month = $month.val();
				var endDate = moment([year,month-1]).endOf("month").date();
				
				//alert(endDate);
				
				$date.empty();
				
				for(var i = 1; i <= endDate; i++) {
					$date.append($("<option>").text(i));
				}
			} // detectLeapYear();
		</script>
	</body>
</html>