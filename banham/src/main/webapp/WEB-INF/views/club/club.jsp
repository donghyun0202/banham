<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/club/club.css" rel="stylesheet"/>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.banham.club.ClubVO" %>
<%
	ArrayList<ClubVO> clubboardList = (ArrayList<ClubVO>)request.getAttribute("clubboardList");
%>
<%@ page import ="com.project.banham.user.UserVO" %> 
<% 	
	String userid;
	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		userid = vo.getUser_id();
	}else{
		userid = "";
	}
	
%>
<body>
	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
    
    <div class="bannerWrap">
        <h1>반함 모임</h1>
        <p>반함에서 반려동물과 함께 모임을 가지세요.</p>
    </div>

    
    <section class="notice">
        <div class="page-title">
            <div class="container">
                <h3>전체 모임</h3>
            </div>
        </div>

        <div class="page-button-wrap">
            <div class="container clearfix">
                <input type="button" value="모임등록" onclick="location.href='/club/club_register'">
            </div>
        </div>

        <!-- board seach area -->
        <div id="board-search">
            <div class="container">
                <div class="search-window">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button onclick="clubSearchButton()" class="btn btn-dark">검색</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="board-menu">
            <div class="container">
                <div class="menu-window">
                    <div class="menu-action" id="all" onclick="boardMenuClick(this.id)">전체 모임</div>
                    <div id="progress"  onclick="boardMenuClick(this.id)">진행중인 모임</div>
                    <div id="end" onclick="boardMenuClick(this.id)">완료된 모임</div>
                    <div id="delete" onclick="boardMenuClick(this.id)">삭제된 모임</div>
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
                        <th scope="col" class="th-date">등록일</th>
                        <th scope="col" class="th-personnel">모집인원</th>
                    </tr>
                    </thead>
                    <tbody id="clubNoSearch">
                    <% for (int i = 0 ; i < clubboardList.size(); i++){ 
							ClubVO clubBoard = clubboardList.get(i);
							String club_id = clubBoard.getClub_id();
							String club_title = clubBoard.getClub_title();
							String club_status = clubBoard.getClub_status();
							String club_writer = clubBoard.getClub_writer();
							String club_date_create = clubBoard.getClub_date_create();
							int club_person = clubBoard.getClub_person();
					%>
                    <tr data-filter="<%=club_status%>" id="<%=club_id%>" onclick="redirectToClubBoard('<%=club_id %>')">
                        <td><%=clubboardList.size()-i %></td>
                        <th><%=club_title %></th>
                        <td><%=club_writer %></td>
                        <td><%=club_date_create %></td>
                        <%if(club_status.equals("end")) { %>
                        	<td>마감</td>
                        <%}else if(club_status.equals("delete")){ %>
                        	<td>삭제</td>
                        <%}else{ %>
                        	<td><%=club_person %></td>
                        <%} %>
                    </tr>
                    <% } %>
                    </tbody>
                    <tbody id="clubSearchResultWrap" style="display : none">
                    </tbody>
                </table>
            </div>
        </div>

    </section>
    
    
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>

    <script src="${path}/resources/js/club.js"></script>
    <script>
	    function redirectToClubBoard(boardid){
	    	const url = '/club/clubboard?boardID=' + boardid;

            // 해당 URL로 리다이렉션
            window.location.href = url;
    	} 
    </script>
</body>
</html>