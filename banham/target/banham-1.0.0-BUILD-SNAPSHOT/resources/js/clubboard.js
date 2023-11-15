function clubPetClickApply(){
	const result = clubPetCheckID();
	if(result.length == 0){
		swal('신청 실패!', "함께할 반려동물을 선택하세요.",'warning')
	}else{
		const joinedString = result.join(', ');
		var club_id = $('#input-board-id').val();
		$.ajax({
			url : '/club/clubApply',
			type : 'post',
			data:{
				select_pet: joinedString,
				clubID : club_id,
			},
			success : function(data) {
				console.log(data)
				swal('신청 성공!', "모임을 신청했습니다.",'success')
				.then(function(){
					location.href="/club";                   
				}) 
			}
		});
	}
	
}
