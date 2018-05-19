<%@page import="com.jbm.mms.dao.MoviesDAO"%>
<%@page import="com.jbm.mms.dao.GenresDAO"%>
<%@page import="com.jbm.mms.vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Genre> list = GenresDAO.genreList();
%>    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>장르 관리 페이지</title>
        <!-- favicon -->
       	<%@ include file="/WEB-INF/template/link.jsp" %>
        <style>
            #content{
            	text-align:center;
            }
            #genreInsertBox{
                /*background-color:hotpink;*/
                padding:30px;
                border-bottom:1px dotted #999;
            }
            #content h2{
                font-size:30px;
                margin-bottom:20px;
            }
            #genreInsertBox div{
                width:424px;
                height:44px;
                /*background-color:#FFF;*/
                margin:auto;
                position:relative;
            }
            #name{
                width:400px;
                height:20px;
                font:20px 'Koverwatch', sans-serif;
                padding:10px;
                border-radius:30px;
                border:2px solid #999;
                outline:none;
                color:#BBB;
            }
            #name:focus{
                border-color:hotpink;
            }
            #name:focus+#insertBtn{
                color:hotpink;
            }
            ::placeholder{
                color:#BBB;
            }
            #name:focus::placeholder{
                color:hotpink;
            }
            #insertBtn{
                position:absolute;
                width:50px;
                right:10px;
                top:4px;
                background-color:transparent;
                border:none;
                cursor:pointer;
                font-size:30px;
                color:#999;
            }
            #genreListBox{
                padding:30px;
                /*background-color:lightgray;*/
            }
            #genreListBox ul{
                /* float의 높이 */
                overflow:hidden;
                padding-top:5px;
            }
            #genreListBox li{
                background-color:#E0E0E0;
                width:243px;
                height:70px;
                border:1px solid #BDBDBD;
                margin:0 20px 20px 0;
                float:left;
                transition:.2s ease;
                font-size:25px;
                position:relative;
                line-height:70px;
            }
            .btn_delete{
                position:absolute;
                right:10px;
                top:5px;
                font-size:20px;
                color:#FFF;
                width:30px;
                height:30px;
                border-radius:30px;
                background-color:lightgray;
                line-height:30px;
                cursor:pointer;
                opacity:.1;
            }
            .btn_delete:hover{
                background-color:darkgray;
                color:#FFF;
            }
            #genreListBox li:hover .btn_delete{
                opacity:1;
            }
            #genreListBox li:hover{
                transform:translateY(-5px);
                box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            /* 4n번째 li에 적용 */
            #genreListBox li:nth-child(4n){
                margin-right:0;
            }
        </style>
    </head>
    <body>
       <%@ include file="/WEB-INF/template/header.jsp" %>
       		<section id="genreInsertBox">
                    <h2>장르 입력</h2>
                    <form action="insertGenre.jsp" method="get">
                        <fieldset>
                            <legend class="screen_out">장르 입력 폼</legend>
                            <div>
                                <input type="text" id="name" name="name" autofocus autocomplete="off" placeholder="장르를 입력하세요." />
                                <button title="장르 입력" id="insertBtn" class="fa fa-keyboard-o"></button>
                            </div>
                        </fieldset>
                    </form>
       		    </section> <!-- // #genreInsertBox -->
                <section id="genreListBox">
                    <h2>장르 목록</h2>
                    <ul>
                    	<% for(Genre genre : list) {
                    	   int count = MoviesDAO.countMovieNum(genre.getNo());	
                    	%>
                        <li>
                            <h3><%=genre.getName()%></h3>
                            <% if(count == 0) { %>
                            	<a class="btn_delete" href="deleteGenre.jsp?no=<%=genre.getNo()%>" title="삭제"><i class="fa fa-trash"></i></a>
                            <% } %>
                        </li>
                        <% } %>
                    </ul>       
                </section> <!-- // #genreListBox -->
       <%@ include file="/WEB-INF/template/footer.jsp" %>
       <script src="js/jquery.js"></script>
       <script>
       		/*
       		var $btnDelete = $(".btn_delete");
       		function deleteGenre() {
       			if(confirm("정말 삭제하시겠습니까?")) {
       				location.href="deleteGenre.jsp?no=";
       			}
       		} // deleteGenre() end
       		
       		$btnDelete.click(function(){
       			deleteGenre();
       		});
       		*/
       </script>
    </body>
</html>