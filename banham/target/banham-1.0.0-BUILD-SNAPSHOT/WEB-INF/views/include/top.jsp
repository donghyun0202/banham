<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import ="com.project.banham.user.UserVO" %> 
<% 	
	String id;
	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		id = vo.getUser_id();
	}else{
		id = "";
	}
	
%>
<title>반함</title>
<!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="${path}/resources/css/reset.css" rel="stylesheet"/>
    <link href="${path}/resources/css/top.css" rel="stylesheet"/>
    	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- HEADER에 관련된 HTML -->
    <!-- 관련 CSS는 top.CSS 확인 -->
    <header id="mainHeader">
        <div class="headerWrap">
            <div class="header">
                <div class="logo"><a href="/"><img src="${path}/resources/images/logo/logo_black.png" alt=""></a></div>
                <div class="menuWrap">
                    <!-- <div><h3><a href="#">반함</a></h3></div>
                    <div><h3><a href="#">나의 글</a></h3></div>
                    <div><h3><a href="#">너의 글</a></h3></div>
                    <div><h3><a href="/club/club">모임</a></h3></div> -->
                    
                    <div id="banhamoverview" onclick="location.href='#'" style="display:none"><h3>반함</h3></div>
                    <div id="mydiary" onclick="topmenuClick(this.id, '<%=id %>')"><h3>나의 글</h3></div>
                    <div id="yourblog" onclick="topmenuClick(this.id, '<%=id %>')"><h3>너의 글</h3></div>
                    <div id="club" onclick="topmenuClick(this.id, '<%=id %>')"><h3>모임</h3></div>
                </div>
                <!-- 로그인 전, HTML -->
                <% if(id.equals("")){ %> 
                <div class="loginWrap">
                    <div><a href="/user/login">로그인</a></div>
                    <div><a href="/user/join">회원가입</a></div>
                </div>
                <!-- 로그인 후, HTML -->
                <%}else { %>
                <div class="loginSuccessWrap">
                    <div><%=id %> 님,</div>
                    <div class="loginMyPage"><a href="/mypage/mypage">MyPage</a></div>
                    <div><a href="/logout">로그아웃</a></div>
                </div>
                <%} %>
            </div>
        </div>
    </header>
    
    <script src="${path}/resources/js/top.js"></script>
    <!-- HEADER END -->
</body>
</html>