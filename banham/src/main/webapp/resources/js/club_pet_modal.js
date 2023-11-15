const clubPetmodal = document.getElementById("club-pet-modal");
    
function clubPetmodalOn() {
    clubPetmodal.style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function clubPetisModalOn() {
    return clubPetmodal.style.display === "flex"
}

function clubPetmodalOff() {
    clubPetmodal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

// 추가하기 button
function clubPetModal() {
	var newhtml = "";
	$.ajax({
		dataType : "JSON",
		url : "/petList",
		type : "GET"
		,success : function(result) {
			if(result.length == 0){
				newhtml = "<h4 style='text-align: center;'>마이페이지에 반려동물 등록 후 선택해주세요.</h4>"
			}else{
				for(let i=0; i<result.length; i++){
					newhtml += '<div class="pet-item-wrap" id=\'' + result[i].pet_id + '\' onclick="petItemIdAdd(this.id)">';
					newhtml += '<h3 id=\'' + result[i].pet_id + '\'>' + result[i].pet_name + '</h3>';
					newhtml += '<p>' + result[i].pet_breed + '</p>';
					newhtml += '<p>' + result[i].pet_birthyear + '</p>';
					newhtml += '</div>'
				}
			}
			
			$(".club-pet-item-wrap").html(newhtml);
			
		},error : function(e){
			alert(e)
		}
	});
	$(".club-pet-button-wrap #club-input-ok").prop("type", "button");
	$(".club-pet-button-wrap #club-input-apply").prop("type", "hidden");
    clubPetmodalOn()
}

function clubPetcancellButton(){
    clubPetmodalOff()
}

clubPetmodal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("explainWrap")) {
        clubPetmodalOff()
    }
})

window.addEventListener("keyup", e => {
    if(clubPetisModalOn() && e.key === "Escape") {
        clubPetmodalOff()
    }
})

