const modal = document.getElementById("showPetmodal");
    
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

function searchpetModalOn(owner_id, pet_id) {
	$.ajax({
		dataType : "JSON",
		url : "/selectPetIDandOwnerId",
		type : "GET",
		data : {
			ownerID : owner_id,
			petID: pet_id,
		},success : function(result) {
			$("#show_pet_img").attr("src", "/resources/images/logo/noneFile.png");
			$('#showPetName').text(result.pet_name);
			$('#showPetBirth').text(result.pet_birthyear);
			$('#showPetbAw').text("[" + result.pet_breed + "] / " + result.pet_weight);
			$("#showPetPer").val(result.pet_personality);
//			$('#showPetId').val(result.pet_id);
		},error : function(e){
			alert(e)
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