const infomodal = document.getElementById("Infomodal");
    
function infomodalOn() { 
	infomodal.style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function infoisModalOn() {
    return infomodal.style.display === "flex"
}

function infomodalOff() {
	infomodal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

function changeClick(inputID ,user_id, user_email, user_phone) {
	var innerHtml;
    var category;
    console.log(inputID);
    if (inputID == "email"){
        category = "이메일"
    }else if(inputID == "phone"){
        category = "연락처"
    }else if(inputID == "password"){
        category = "비밀번호"
    }
    
    innerHtml = '<h3>'+ category +  ' 수정</h3>' ;
    
    if(category == "비밀번호"){
        innerHtml += '<input id="password_Input" type="password" placeholder="현재 비밀번호">'
        innerHtml += '<input id="newInput" type="password" placeholder="새 ' + category + '">';
        innerHtml += '<input id="checkInput" type="password" placeholder="새 ' + category + ' 확인">';
    }else if(category == "이메일"){
        innerHtml += '<p>'+user_email+'</p>';
        innerHtml += '<input id="newInput" type="text" placeholder="새 ' + category + '">';
        innerHtml += '<input id="checkInput" type="text" placeholder="새 ' + category + ' 확인">';
    }else if(category == "연락처"){
        innerHtml += '<p>'+user_phone+'</p>';
        innerHtml += '<input id="newInput" type="text" placeholder="새 ' + category + '">';
        innerHtml += '<input id="checkInput" type="text" placeholder="새 ' + category + ' 확인">';
    }
    innerHtml += '<input id="changeButtonInput" type="button" value="변경" onclick="changeButton(\'' + inputID + '\',\'' + user_id + '\',\'' + user_email + '\',\'' + user_phone + '\')">';
    innerHtml += '<input id="cancellButtonInput" type="button" value="취소" onclick="infocancellButton()">';
    $(".InfoexplainBox .InfochangeWrap").html(innerHtml);
    infomodalOn()
}

function infocancellButton(){
	infomodalOff()
}

window.addEventListener("keyup", e => {
    if(infoisModalOn() && e.key === "Escape") {
    	infomodalOff()
    }
})

//회원정보수정
function changeButton(id, user_id, user_email, user_phone){
	if(id == "password"){
		console.log(user_id);
		var password = $('#password_Input').val();
		var newPassword = $('#newInput').val();
		var checkNewPassword = $('#checkInput').val();
		let checkPW = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/); //비밀번호 유효성 검사(영문 대소문자, 숫자, 특수문자( !@#$%^&*()_+~ ) 중 3개 이상을 조합하여 8자리 이상 입력해 주세요.)
		if (newPassword == checkNewPassword){
			if(!checkPW.test(newPassword)){
				swal('입력오류!', "영문 대소문자, 숫자, 특수문자( !@#$%^&*()_+~ ) 중 3개 이상을 조합하여 8자리 이상 입력해 주세요.", 'warning');
			}else{
				$.ajax({
					url : '/user/infoCheckPw',
					type : 'post',
					data:{
						userId: user_id,
						userPw: password
					},
					success : function(data) {
						if (data == 0) { //로그인 실패시
							console.log(data);
							 swal('불일치!', "현재 비민번호를 확인하세요.", 'warning');
						} else { //로그인 성공시
							if(password == newPassword){
								swal('입력오류!', "현재 사용중인 비밀번호 입니다. 다시 확인하세요.", 'warning');
							}else{
								console.log(data);
								$('#mypassword').val(newPassword);
								infomodalOff()
							}
						}
					}
				});
			}
		}else{
			swal('비밀번호 불일치!', "비밀번호가 일치하지 않습니다.", 'warning');
		}
	}else if(id == "email"){
		console.log(id);
		let checkEmail = RegExp(/^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$/);
		var newEmail = $('#newInput').val();
		var checkNewEmail = $('#checkInput').val();
		if (newEmail == checkNewEmail){
			if(!checkEmail.test(newEmail)){
				swal('입력오류!', "이메일 형식이 아닙니다. 다시 입력해주세요.", 'warning');
			}else if(newEmail == user_email){
				swal('입력오류!', "현재 이메일과 변경할 이메일이 동일합니다.", 'warning');
			}else{
				$('#myemail').text(newEmail);
				infomodalOff()
			}
		}else{
			swal('이메일 불일치!', "변경할 이메일이 일치하지 않습니다.", 'warning');
		}
	}else if(id == "phone"){
		console.log(id);
        let checkPhone = RegExp(/^[0-9]+$/);// 연락처 유효성 검사 (숫자만 입력해주세요.)     
		var newPhone = $('#newInput').val();
		var checkNewPhone = $('#checkInput').val();
		if (newPhone == checkNewPhone){
			if(!checkPhone.test(newPhone)){
				swal('입력오류!', "숫자만 입력 가능합니다. 다시 입력해주세요.", 'warning');
			}else if(newPhone == user_phone){
				swal('입력오류!', "현재 연락처과 변경할 연락처가 동일합니다.", 'warning');
			}else{
				$('#myphone').text(newPhone);
				infomodalOff()
			}
		}else{
			swal('연락처 불일치!', "변경할 연락처가 일치하지 않습니다.", 'warning');
		}
	}
}