<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${Path}/resources/css/diary/diary_list.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.banham.diary.MyDiaryVO" %>
<%
	ArrayList<MyDiaryVO> diarylist = (ArrayList<MyDiaryVO>)request.getAttribute("diarylist");
%>
</head>
<body>
	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
	<div class="bannerWrap">
        <h1>너의 반함</h1>
        <p>반함에서 다른 반려동물의 추억에 들려보세요.</p>
    </div>
<!-- board seach area -->
	<section class="notice">
        <div id="board-search">
            <div class="container">
                <div class="search-window">
                    <form action="">
                        <div class="search-wrap">

                            <label for="search" class="blind">공지사항 내용 검색</label>
                            <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                            <button type="button" class="btn btn-dark" onclick="diarySearchButton()">검색</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- board list area -->
        <div id="board-list">
            <div class="container">
                <table class="board-table">
                    <thead>
                    <tr>
                        <th scope="col" class="th-num">번호</th>
                        <th scope="col" class="th-title">제목</th>
                        <th scope="col" class="th-user">작성자</th>
                        <th scope="col" class="th-personnel">장소명</th>
                        <th scope="col" class="th-date">등록일</th>
                    </tr>
                    </thead>
                    <tbody id="diary-search-none">
                    <% for(int i=0; i<diarylist.size(); i++){
                    	MyDiaryVO Item = diarylist.get(i);
                    	String lovation = Item.getDiary_location();
                    	String[] arr = lovation.split(",");%>
                    <tr onclick="searchId('<%= Item.getDiary_id()%>')">
                        <td><%=diarylist.size() - i %></td>
                        <th><%=Item.getDiary_title() %></th>
                        <td><%=Item.getDiary_writer() %></td>
                        <td><%=arr[1] %></td>
                        <td><%=Item.getDiary_date_create() %></td>
                    </tr>
                    <%} %>

                    </tbody>
                    <tbody id="diary-search-result"></tbody>
                </table>
            </div>
        </div>

    </section>
    
      <!-- 공통 footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>
    	function searchId(id){
    		const url = '/diary/diary_detail?data=' + id;

            // 해당 URL로 리다이렉션
            window.location.href = url;
    	}
    	
    	function diarySearchButton(){
    		var keyword = $('.search-wrap #search').val();
    		console.log(keyword);
    		var clubSearchHtml = "";
    		$.ajax({
    			dataType : "JSON",
    			url : "/diarySearchWrap",
    			type : "GET",
    			data : {
    				keyword: keyword,
    			},success : function(result) {
    				console.log(result)
    				if(result.length != 0){
    					for(let i=0; i<result.length; i++){
    						var count  = result.length - i;
    						var loaction = result[i].diary_location;
    						var arr = loaction.split(",");
    					
    						var status = "";
    						clubSearchHtml += '<tr onclick="searchId(\'' + result[i].diary_id + '\')">';
    						clubSearchHtml += '<td>' + count + '</td>';
    						clubSearchHtml += '<th>' + result[i].diary_title + '</th>';
    						clubSearchHtml += '<td>' + result[i].diary_writer + '</td>';
    						clubSearchHtml += '<td>' + arr[1] + '</td>';
    						clubSearchHtml += '<td>' + result[i].diary_date_create + '</td>';
    						clubSearchHtml += '</tr>';
    					}
    				}
    				$('#diary-search-none').css("display", "none");
    				$("#diary-search-result").css("display", "");
    				$('#diary-search-result').html(clubSearchHtml);
    			},error : function(e){
    				alert(e)
    			}
    		});
    		
    		
    	}
    </script>
</body>
</html>