function topmenuClick(divId, userId){
	console.log(divId);
	if(userId == ""){
		swal("로그인 후 이용 가능", "로그인 후 이용 가능합니다. 회원가입 혹은 로그인 해주세요.", "warning");
		window.location.href='#';
	}else{
		if(divId == "mydiary"){
			location.href='/diary';
		}else if(divId == "yourblog") {
			location.href='/diarylist';
		}else if(divId == "club"){
			location.href='/club';
			
		}
		
	}
}