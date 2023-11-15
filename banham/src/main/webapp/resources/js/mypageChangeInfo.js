// 회원정보수정 PAGE JS
function deleteinfoChange(email, phone){
	console.log(email,phone);
	$('#mypassword').val("");
	$('#myemail').text(email);
	$('#myphone').text(phone);
    $('.myInfoPwCheckWrap').css("display", "");
    $('.myInfoModifyWrap').css("display", "none");
}

function infoPwButton(){
	var id = $('#id').text();
	var pw = $('#input_password').val();
	$.ajax({
		url : '/user/infoCheckPw',
		type : 'post',
		data:{
			userId: id,
			userPw: pw
		},
		success : function(data) {
			if (data == 0) { //로그인 실패시
				console.log(data);
				 swal('불일치!', "비민번호를 확인하세요.", 'warning');
			} else { //로그인 성공시
				console.log(data);
				$('.myInfoPwCheckWrap').css("display", "none");
			    $('.myInfoModifyWrap').css("display", "block");
			}
		}
	});
}

function modifyInfoClick(id, email, phone){
	// 비밀번호 변경	
	var newPassword = $('#mypassword').val();
	if(!newPassword){
		newPassword = "";
	}else{
		$.ajax({
			url : '/user/infoModifyPassword',
			type : 'post',
			data:{
				userId: id,
				userPassword: newPassword
			},
			success : function(data) {
				if (data == 1) { //수정 성공,
					 window.location.href="/mypage/mypage";
				} 
			}
		});
	}
	
	// 이메일 변경 	
	var newEmail = $('#myemail').text();
	if(newEmail != email){
		$.ajax({
			url : '/user/infoModifyEmail',
			type : 'post',
			data:{
				userId: id,
				userEmail: newEmail
			},
			success : function(data) {
				if (data == 1) { //수정 성공,
					 window.location.href="/mypage/mypage";
				} 
			}
		});
	}
	
	// 핸드폰 번호 변경
	var newPhone = $('#myphone').text();
	if(newPhone != phone){
		$.ajax({
			url : '/user/infoModifyPhone',
			type : 'post',
			data:{
				userId: id,
				userPhone: newPhone
			},
			success : function(data) {
				if (data == 1) { //수정 성공,
					 window.location.href="/mypage/mypage";
				} 
			}
		});
	}
	
}