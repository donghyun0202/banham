<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/club/club_register.css" rel="stylesheet"/>
</head>
<%@ page import ="com.project.banham.user.UserVO" %> 
<% 	
	String writer_id;
	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		writer_id = vo.getUser_id();
	}else{
		writer_id = "";
	}
	
%>
<body>
	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
    <div class="bannerWrap">
        <h1>반함 모임</h1>
        <p>반함에서 반려동물과 함께 모임을 가지세요.</p>
    </div>

    <section id="register">
        <div class="register-title">
            <div class="container">
                <img src="${path}/resources/images/logo/imglogo_black.png" alt="">
                <h2>반함 모임 등록</h2>
                <p>제목, 장소, 인원 수 등을 입력하여 반함 모임을 등록하세요.</p>
            </div>
        </div>

        <div class="register-table">
            <div class="container">
                <table class="register-board-table">
                    <tbody>
                        <tr class="th-title">
                            <th>제목</th>
                            <td><input type="text" id="club_title"></td>
                        </tr>
                        <tr class="th-user">
                            <th>작성자</th>
                            <td id="club_writer"><%=writer_id %></td>
                        </tr>
                        <tr  class="th-date">
                            <th>모임 날짜</th>
                            <td><input type="date" class="input-date" id="input-date-club"></td>
                        </tr>
                        <tr class="th-person">
                            <th>모집 인원</th>
                            <td><input type="text" placeholder="숫자만 입력해주세요" id="club_person"></td>
                        </tr>
                        <tr class="th-person">
                            <th>모집 마감 날짜</th>
                            <td>
                                <input type="date" class="input-date" id="input-date-deadline" disabled style="display: none;">
                                <p id="input-date-deadline-p"> 모임 날짜를 먼저 선택해주세요 </p>
                            </td>
                        </tr>
                        <tr class="th-pet">
                            <th>반려동물</th>
                            <td class="td-pet-clubpetClickAdd">
                                <div class="clubPetClickWrap">
									<!-- <div class="add-pet-wrap">
                                    		<div class="add-pet"> 해피 </div>
                                		</div>
                                
                               			 <div class="add-pet-wrap">
                                    		<div class="add-pet"> 루트 </div>
                                		</div> -->
                                </div>
                                
                                <div class="add-pet-button"  onclick="clubPetModal()">추가·변경</div>
                                <input type="hidden" id="add-pet-id-input">
                            </td>
                        </tr>
                        <tr class="th-location">
                            <th>장소</th>
                            <td class="td-location-add-wrap">
                                <div class="locationaddwrap">
                                    <!-- <div class="add-location-wrap">
                                        <div class="add-location"> 강아지공원 </div>
                                    </div>
                                    <div class="add-location-wrap">
                                        <div class="add-location"> 강아지 </div>
                                    </div> -->
                                </div>
                                
                                <div class="add-location-button" onclick="clubLocationModal()">추가·변경</div>
                                <input type="hidden" id="add-location-id-input">
                            </td>
                        </tr>
                        <tr class="th-overview">
                            <th>설명</th>
                            <td><textarea id="club_overview"></textarea></td>
                        </tr>    
                    </tbody>
                </table>
            </div>
        </div>

        <div class="register-button-wrap">
            <div class="container">
                <input type="button" value="취소" onClick="location.href='/club'">
                <input type="button" class="register-click" value="등록" onclick="registerSubmit()">
            </div>
        </div>
    </section>
    
    <!-- 동물 추가 모달 -->
    <jsp:include page="/WEB-INF/views/club/club_pet_modal.jsp"/>
    <!-- 장소선택모달 -->
    <jsp:include page="/WEB-INF/views/club/club_location_modal.jsp"/>
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   	<script src="${path}/resources/js/club_register.js"></script>
</body>
</html>