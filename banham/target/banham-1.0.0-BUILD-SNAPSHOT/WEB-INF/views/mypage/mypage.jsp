<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
	<link href="${path}/resources/css/mypage/mypage.css" rel="stylesheet"/>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
</head>
<body>
	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
    <!-- MYPAGE START -->
    <div class="bannerWrap">
        <h1>MYPAGE</h1>
        <p>나의 정보를 확인 및 수정하세요</p>
    </div>
    
     <div class="mypageWrap">
        <div class="menuWrap">
            <div class="menuLogoWrap">
                <img src="${path}/resources/images/logo/imglogo_pink.png" alt="">
            </div>
            <div class="myMenuWrap">
                <div class="menuItem click" onclick="menuClick(this.id)" id="infoChange">회원정보수정</div>
                <div class="menuItem" onclick="menuClick(this.id)" id="petChange">반려동물</div>
                <div class="menuItem" onclick="menuClick(this.id)" id="clubChange">모임</div>
                <div class="menuItem" onclick="menuClick(this.id)" id="frdChange" style="display:none">친구 목록·추가</div>
            </div>
        </div>
        <div class="mypageMenuWrap">
        	<div class="InfoWrap">
        		<div class="titleWrap">
                    <h2>회원정보수정</h2>
                    <p>안녕하세요. 반함입니다. <br>비밀번호 입력 후, 회원정보를 수정하세요.</p>
                </div>

    			<div class="mypageChagneInfo">
    				<!-- mypage 회원정보 수정 PAGE  -->
    				<jsp:include page="/WEB-INF/views/mypage/mypageChangeInfo.jsp"/>
    			</div>
    			
    			<div class="mypagePetInfo" style="display: none;">
    				<!-- mypage 동물추가 PAGE  -->
    				<jsp:include page="/WEB-INF/views/mypage/mypagePetInfo.jsp"/>
    			</div>
    			
    			<div class="mypageClubInfo" style="display: none;">
    				<!-- mypage 모임 PAGE  -->
    				<jsp:include page="/WEB-INF/views/mypage/mypageClubInfo.jsp"/>
    			</div>
    			
    			<div class="mypageFriendInfo" style="display: none;">
    				<!-- mypage 모임 PAGE  -->
    				<jsp:include page="/WEB-INF/views/mypage/mypageFriendInfo.jsp"/>
    			</div>
        	</div>
        </div>
     </div>
    
     <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
     
     <script src="${path}/resources/js/mypage.js"></script>
</body>
</html>