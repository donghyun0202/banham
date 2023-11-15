<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- style -->
    <link href="${path}/resources/css/reset.css" rel="stylesheet"/>
    <link href="${path}/resources/css/user/idpwfind.css" rel="stylesheet"/>
</head>
<body>
	<div class="mainWrap">
        <div class="logoWrap">
            <img src="${path}/resources/images/logo/logo_pink.png" alt="">
            <h3>아이디 / 비밀번호 찾기</h3>
            <p>회원정보를 입력 후, 아이디 및 비밀번호를 찾으세요.</p>
        </div>
        <div class="radioButton">
            <label><input type='radio' name='findInf' value='findId' onclick="search_check(1)" checked="checked"/>아이디 찾기</label>
            <label><input type='radio' name='findInf' value='findPw' onclick="search_check(2)"/>비밀번호 찾기</label>
        </div>
        <div class="infoWrap" id="searchID">
            <h4>이름</h4>
            <input type="text" name="inputName" id="input_name" style="ime-mode:autt;">
            <h4>휴대폰번호</h4>
            <input type="text" name="inputPhone" id="input_phone">
            <div class="buttonWrap">
                <input type="button" value="찾기" class="find" onClick="idSearch_click()">
                <input type="button" value="취소" class="delete" onClick="location.href='/user/login'">
            </div>
            
        </div>
        <div class="infoWrap" id="searchPW" style="display: none;">
            <h4>아이디</h4>
            <input type="text" name="inputId" id="input_id">
            <h4>이메일</h4>
            <input type="text" name="inputEmail" id=input_email>
            <div class="buttonWrap">
                <input type="button" value="찾기" class="find" onClick="pwSearch_click()">
                <input type="button" value="취소" class="delete" onClick="location.href='/user/login'">
            </div>
        </div>
    </div>
    
    <!-- MODAL -->
    <div id="modal" class="explainWrap">
        <div class="explainBox">
            <div class="changeWrap">
	            <h2>아이디 찾기</h2>
		        <div class="msgBox">
		            <p class="idResult"></p>
		            <p class="overview"></p>
		        </div>
		        
		         <input type="button" value="확인" onClick="cancellButton()">
            </div>
        </div>    
    </div>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${path}/resources/js/idpwfind_modal.js"></script>
    <script>
        function search_check(num){
            if (num == '1') {
                document.getElementById("searchPW").style.display = "none";
                document.getElementById("searchID").style.display = "";	
            } else {
                document.getElementById("searchID").style.display = "none";
                document.getElementById("searchPW").style.display = "";
            }
        }
        
    </script>
</body>
</html>