<%@page import="com.jbm.mms.dao.MoviesDAO"%>
<%@page import="com.jbm.mms.vo.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// q라는 파라미터 받음
	String q = request.getParameter("q");
	// System.out.println(q);
	
	List<Movie> list = null;
	
	if(q!=null) {
		list = MoviesDAO.movieList(q);
	} else{
		list = MoviesDAO.movieList();
	} // if ~ else end
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>영화 목록</title>
        <!-- favicon -->
       	<%@ include file="/WEB-INF/template/link.jsp" %>
        <style>
            #searchBox{
                /*background-color:#FFF;*/
                text-align:center;
                border-bottom:1px dotted #999;
            }
            #searchBox div{
                width:424px;
                height:44px;
                /*background-color:#FFF;*/
                margin:30px auto;
                position:relative;
            }
            #q{
                width:400px;
                height:20px;
                font:20px 'koverwatch', sans-serif;
                padding:10px;
                border-radius:30px;
                border:2px solid #999;
                outline:none;
                color:#BBB;
            }
            #q:focus{
                border-color:hotpink;
            }
            #q:focus+#searchBtn{
                color:hotpink;
            }
            ::placeholder{
                color:#BBB;
            }
            #q:focus::placeholder{
                color:hotpink;
            }
            #searchBtn{
                position:absolute;
                top:9px;
                right:0px;
                width:50px;
                background-color:transparent;
                border:none;
                cursor:pointer;
            }
            #listBox{
            	padding-bottom:20px;
            }
            #listBox h2{
                font-size:30px;
                text-align:center;
                margin:30px;
            }
            .rating_all, .rating_12, .rating_15, .rating_19{
                display:inline-block;
                width:25px;
                height:25px;
                background-color:hotpink;
                vertical-align:middle;
                text-align:center;
                line-height:25px;
                font-size:20px;
                font-weight:bold;
                color:#FFF;
                text-shadow:1px 1px 1px #424242;
            }
            .rating_all{
                background-color:#00CB53;
            }
            .rating_all::before{
                content:"all";
            }
            .rating_12{
                background-color:#00B0FF;
            }
            .rating_12::before{
                content:"12";
            }
            .rating_15{
                background-color:#FFEA00;
            }
            .rating_15::before{
                content:"15";
            }
            .rating_19{
                background-color:#FF1744;
            }
            .rating_19::before{
                content:"19";
            }
            #listBox ul{
                overflow:hidden;
            }
            #listBox li{
                width:538px;
                height:130px;
                background-color:#FFF;
                border:1px solid #999;
                float:left;
                margin: 0 20px 20px 0;
                position:relative;
            }
            #listBox li:nth-child(2n){
                margin-right:0;   
            }
            #listBox li em{
                position:absolute;
                right:15px;
                bottom:15px;
                font-size:22px;
                font-weight:bold;
            }
            #listBox li em>span{
                font-size:18px;
                font-weight:normal;
            }
            #listBox h3{
                /*background-color:pink;*/
                width:400px;
                position:absolute;
                left:15px;
                top:15px;
                /* 글자가 길어졌을 때 ... 처리하기 */
                overflow:hidden;
                white-space:nowrap;
                text-overflow:ellipsis;
            }
            #listBox h3 strong{
                font-size:25px;
                vertical-align:middle;
            }
            #listBox dl{
                /*background-color:skyblue;*/
                width:200px;
                font-size:15px;
                position:absolute;
                left:15px;
                bottom:15px;
            }
            #listBox dt{
                /*background-color:deepskyblue;*/
                float:left;
                width:40px;
                padding:2px;
                font-weight:bold;
            }
            #listBox dd{
                /*background-color:lightgray;*/
                float:left;
                width:150px;
                padding:2px;
            }
            #listBox .btn_round{
                text-align:center;
                position:absolute;
                /*right:10px;*/
                top:15px;
                font-size:20px;
                color:#FFF;
                width:30px;
                height:30px;
                border-radius:30px;
                background-color:lightgray;
                line-height:30px;
                cursor:pointer;
                opacity:.2;
                transition:.2s ease;
            }
            #listBox .btn_round:hover{
                opacity:1;
            }
            .update{
                right:53px;
            }
            .delete{
                right:15px;
            }
            #listBox .box_btn .btn{
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
			#listBox .box_btn .btn:hover{
			    background-color:hotpink;
			    box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
			#listBox .box_btn{
			    /*margin:40px 20px 25px 20px;*/
			    /*background-color:hotpink;*/
			    text-align:right;
			}
			#popup{
                position:fixed;
                width:100%;
                height:100%;
                background-color:rgba(0,0,0,.8);
                left:0;
                top:0;
                display:none;
            }
            #dialogueBox{
                width:400px;
                /*height:80px;*/
                position:absolute;
                padding:30px 30px 0px 30px;
                background-color:#FFF;
                left:50%;
                top:50%;
                margin-left:-230px;
                margin-top:-70px;
            }
            #dialogueBox h3{
                /*background-color:lightgray;*/
                text-align:center;
                font-size:25px;
                /*padding-bottom:-5px;*/
                font-weight:bold;
            }
            #dialogueBox .box_btn{
                text-align:center;
            }
            #dialogueBox .box_btn .btn{
                display:inline-block;
                width:100px;
                height:35px;
                background-color:#424242;
                color:#FFF;
                font:15px 'koverwatch', sans-serif;
                margin:0px 5px;
                font-weight:bold;
                border:none;
            }
        </style>
    </head>
    <body>
       <%@ include file="/WEB-INF/template/header.jsp" %>
       <section id="searchBox">
           <h2 class="screen_out">영화 검색</h2>
           <form action="movies.jsp" method="get">
               <fieldset>
                   <legend class="screen_out">영화 검색 폼</legend>
                   <div>
                       <input id="q" name="q" type="text" autofocus autocomplete="off" title="검색할 영화 입력" placeholder="검색할 영화를 입력하세요." />
                       <button title="영화 입력" id="searchBtn" class="fa fa-search"></button>
                   </div>
               </fieldset>
           </form>
       </section> <!-- // #searchBox -->
       <section id="listBox">
           <h2>영화 목록</h2>
           <ul>
           	   <% for(Movie movie : list) { %>
               <li>
                   <h3>
                       <span class="<%=movie.getRatingClass()%>"></span>
                       <strong><%=movie.getName()%></strong>
                   </h3>
                   <dl>
                       <dt>장르</dt>
                       <dd><%=movie.getGenreName()%></dd>
                       <dt>감독</dt>
                       <dd><%=movie.getDirector()%></dd>
                       <dt>개봉일</dt>
                       <dd><%=movie.getFormatReleaseDate()%></dd>
                   </dl>
                   <em><%=movie.getCommaAudience()%><span>명</span></em>
                   <a href="updateForm.jsp?no=<%=movie.getNo()%>" title="수정 폼으로 이동" class="btn_round update"><i class="fa fa-wrench"></i></a>
                   <a href="deleteMovie.jsp?no=<%=movie.getNo()%>" title="삭제하기" data-name="<%=movie.getName()%>" class="btn_round delete"><i class="fa fa-trash"></i></a>
               </li>
               <% } %>
           </ul>
           <div class="box_btn">
           		<a href="insertForm.jsp" class="btn"><i class="fa fa-floppy-o"></i> 영화 입력</a>
           </div>
       </section>
       <%@ include file="/WEB-INF/template/footer.jsp" %>
       <!-- 삭제, 취소 팝업 -->
       <div id="popup">
           <div id="dialogueBox">
               <h3>영화 '<span id="title"></span>'을(를) 삭제하시겠습니까?</h3>
               <div class="box_btn">
                   <button class="btn cancel"><i class="fa fa-ban"></i> 취소</button>
                   <button class="btn delete"><i class="fa fa-trash"></i> 삭제</button>
               </div>
           </div> <!-- // #dialogueBox end -->
       </div> <!-- // #popup -->
       <script src="js/jquery.js"></script>
       <script>
           var $popup = $("#popup");
           // 확인 버튼 눌렀을 때 실제로 넘어갈 페이지의 주소를 지정할 전역 변수
           var url = "";
           
           $('#listBox li .delete').click(function(e){
               // a 요소가 가진 기본 속성(즉, href로 이동하는 것)을 막아줌
               e.preventDefault();
               
               // 우리가 클릭한 그 delete 버튼이 가지고 있는 data-type속성의 값을 얻어옴
               var name = this.dataset.name;
               // alert(name);
               
               // 우리가 클릭한 그 delete 버튼의 href 속성 값을 얻어와서 url 전역 변수에 대입
               url = $(this).attr("href");
               // alert(url);
               
               // #tilte에 글자를 대입
               $('#title').text(name);
               
               // 팝업창을 띄움 
               $popup.show();
           }); // #listBox li .delete click();
           
           // 팝업 안에 있는 .cancel 버튼
           $("#popup .cancel").click(function(){
               $popup.hide();
           }); // #popup .cancel click();
           
           // 팝업 안에 있는 .delete 버튼
           $('#popup .delete').click(function(){
               // 페이지 이동
               location.href = url;
           }); // #popup .delete click();
       </script>
    </body>
</html>