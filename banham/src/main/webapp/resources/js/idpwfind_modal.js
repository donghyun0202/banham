//아이디 찾기 modal
const modal = document.getElementById("modal");
    
function modalOn() {
	modal.style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function isModalOn() {
    return modal.style.display === "flex"
}

function modalOff() {
    modal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

//아이디 & 스토어 값 저장하기 위한 변수
var idV = "";
function  idSearch_click() {
	// 아이디 값 받고 출력하는 ajax
	$.ajax({
		type:"POST",
		url:"/user/userSearch?inputName="
				+$('#input_name').val()+"&inputPhone="+$('#input_phone').val(),
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success:function(data){
			if(data == 0){
				console.log(data);
				$('.idResult').text("아이디 찾기에 실패하셨습니다.");
				$('.overview').html("안녕하세요. 반함을 이용해주셔서 감사합니다.<br>회원정보 확인 후 다시 시도해주시기 바랍니다.")
			} else {
				console.log(data);
				$('.idResult').text("회원님의 아이디는 "+ data + " 입니다.");
				$('.overview').html("안녕하세요. 반함을 이용해주셔서 감사합니다.<br>아이디 찾기에 성공하셨습니다.<br>아이디 확인 후 로그인해주시기 바랍니다.")
				// 아이디값 별도로 저장
				idV = data;
			}
		}
	});
	
    modalOn()
}

function cancellButton(){
    modalOff()
}

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("explainWrap")) {
        modalOff()
    }
})

window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})


//비밀번호 찾기
function pwSearch_click(){
	$.ajax({
		type:"POST",
		url:"/user/searchPassword?inputId="
				+$('#input_id').val()+"&inputEmail="+$('#input_email').val(),
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success:function(data){
			if(data == 0){
				console.log(data);
				alert("회원정보가 일치하지 않습니다. 다시 입력해주세요.")
			} else {
				console.log(data);
				alert("임시비밀번호를 전송했습니다. 확인 후 로그인 해주세요.")
			}
		}
	});
}




