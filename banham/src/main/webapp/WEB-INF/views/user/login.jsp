<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BanHam login page</title>
	<!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- style -->
    <link href="${path}/resources/css/reset.css" rel="stylesheet"/>
    <link href="${path}/resources/css/user/login.css" rel="stylesheet"/>
    
    <!-- jquery & swal -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="mainWrap">
        <div class="loginWrap">
            <div class="loginBox">
                <a href="/"><img class="logo" src="${path}/resources/images/logo/logo_pink.png" alt=""></a>
                <div class="idBox">
                    <input id="id" type="text" placeholder="아이디" name="user_id"><br>
                    <img src="${path}/resources/images/icon/user.png" alt="">
                </div>
                <div class="pwBox">
                    <input id="pw" type="password" placeholder="비밀번호" name="user_password"><br>
                    <img src="${path}/resources/images/icon/lock.png" alt="">
                </div>
                <div class="checkBox">
                    <p></p>
                </div>
                <input type="button" id ="login" value="로그인">
                <div class="menuWrap">
                    <ul>
                        <li><a href="/user/idpwfind">아이디 / 비밀번호 찾기</a></li>
                        <!-- <li><a href="#">아이디 찾기</a></li> -->
                        <li><a href="/user/join">회원가입</a></li>
                    </ul>
                </div>
                <div class="footerWrap">
                    <p>copyright © 반함_반려동물과 함께 All Rights Reserved.</p>
                </div>
            </div>
        </div>
        <div class="joinWrap"></div>
    </div>
    
    <script>
 	// 로그인 id / pw 확인
	$('.loginBox #login').click(function() {
		var id = $('#id').val();
		var pw = $('#pw').val();
			$.ajax({
			type : 'post',
			url : '/user/login',
			data : {
				user_id : id,
				user_password : pw
				},
				success : function(data) {
					if (data == 0) { //로그인 실패시
						console.log(data);
						$('.checkBox p').html('아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. </br> 입력하신 내용을 다시 확인해주세요.');
					} else { //로그인 성공시
						console.log(data);
						location.href = '/';
					}
				}
			});
		});
    </script>
</body>
</html>