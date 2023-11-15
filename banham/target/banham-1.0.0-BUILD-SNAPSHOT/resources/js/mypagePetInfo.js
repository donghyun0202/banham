const Petmodal = document.getElementById("Petmodal");

function petmodalOn() {
	Petmodal.style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function petisModalOn() {
    return Petmodal.style.display === "flex"
}

function petmodalOff() {
	$('#pet_name').val('');
	$('#pet_weight').val('');
	$('#pet_birthyear').val('');
	$('#pet_breed').val('');
	$('#file').val('');
	$('#pet_personality').val('');
	Petmodal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

function petaddMyPetClick() {
	$('.petexplainBox .petTextWrap h2').text("반려동물을 추가하세요");
	$('.petButtonWrap').css("display", "");
    $('.petInfoButtonWrap').css("display", "none");
	petmodalOn()
}

function petcancellButton(){
	petmodalOff()
}

window.addEventListener("keyup", e => {
    if(petisModalOn() && e.key === "Escape") {
        petmodalOff()
    }
})


$("select[name=breed]").change(function(){
	var pet_breed_val = $("select[name=breed] option:selected").val();
	var pet_breed_select = $("select[name=breed] option:selected").text();
	console.log(pet_breed_val);
	if(pet_breed_val == "none"){
		$("#pet_breed").attr('readonly', false);
		$('#pet_breed').val("");
		
	}else{
		$("#pet_breed").attr('readonly', true);
		$('#pet_breed').val(pet_breed_select);
	}
});

function myPetAddButton(id){
	var pet_name = $('#pet_name').val();
	var pet_weight = $('#pet_weight').val();
	var pet_birthyear = $('#pet_birthyear').val();
	var pet_breed = $('#pet_breed').val();
	var pet_personality = $('#pet_personality').val();
	var owner_id = id;
	var fileInput = document.getElementById('file');
	
    var file = fileInput.files[0];
    var formData = new FormData();
    formData.append('petName', pet_name);
    formData.append('petWeight', pet_weight);
    formData.append('petBirthyear', pet_birthyear);
    formData.append('petBreed', pet_breed);
    formData.append('petPersonality', pet_personality);
    formData.append('ownerId', owner_id);
    formData.append('petFile', file);
    
    let checkNum = RegExp(/^[0-9]+$/);
	let checkEngAKor = RegExp(/^[가-힣]|[A-Z]|[a-z]$/);
	
	if(pet_name == "" || pet_weight == "" || pet_birthyear == "" ||  pet_breed == "" || file == "" || pet_personality == ""){
		swal('반려동물 추가 실패!', '공백을 입력하세요.', 'warning');
	}else if(!checkNum.test(pet_weight) || !checkEngAKor.test(pet_breed)){
		swal('반려동물 추가 실패!', '형식에 맞춰 작성해주세요.', 'warning');
	}else{
		$.ajax({
	        url: '/mypage/addMyPet',
	        type: 'POST',
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(data) {
	        	if (data == 1) { //성공
					petmodalOff();
				 	var newHtml = "";
	 			 	newHtml += '<div class="swiper-slide" id=\'' + owner_id + '\' onclick="showMyPet(this.id)">';
 					newHtml += '<img src="/resources/images/logo/noneFile.png" />';
 					newHtml += '<div class="petTitleWrap">';
 					newHtml += '<h2>' + pet_name + '</h2>';
 					newHtml += '<p>' + pet_birthyear + '</p>';
 					newHtml += '<p><font color="#E76161" font-size="10px">' + '[' + pet_breed + ']' + '</font></p>';
 					newHtml += '</div>';
 					newHtml += '</div>';
	    	 		  
 					$(".addPetWrap .swiper-wrapper").append(newHtml);
 					
 					if($(".nonePetWrap").css("display") == "none") {
 						$('.nonePetWrap').css("display","none");
 					} else{
 						$('.nonePetWrap').css("display","none");
 						$('.addPetWrap').css("display","");
 					}
	        	}
	        },
	        error: function(error) {
	            console.error('오류', error);
	        }
	    });
	}
    
}

const showPetmodal = document.getElementById("showPetmodal");

function showPetmodalOn() {
	showPetmodal.style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function showPetisModalOn() {
    return showPetmodal.style.display === "flex"
}

function showPetmodalOff() {
	showPetmodal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

window.addEventListener("keyup", e => {
    if(showPetisModalOn() && e.key === "Escape") {
    	showPetmodalOff()
    }
})

function showMyPet(id){
	console.log(id);
	$.ajax({
		dataType : "JSON",
		url : "/selectPetID",
		type : "GET",
		data : {
			petID: id,
		},success : function(result) {
			$("#showPetImgFile").attr("src", "/resources/images/logo/noneFile.png");
			$('#showPetName').text(result.pet_name);
			$('#showPetBirth').text(result.pet_birthyear);
			$('#showPetbAw').text("[" + result.pet_breed + "] / " + result.pet_weight);
			$("#showPetPer").val(result.pet_personality);
			$('#showPetId').val(result.pet_id);
		},error : function(e){
			alert(e)
		}
	});
	
	showPetmodalOn();
}


function showPetChangeItem(){
	showPetmodalOff();
	var petID = $('#showPetId').val();
	$('.petexplainBox .petTextWrap h2').text("반려동물 정보를 변경하세요");
	$.ajax({
		dataType : "JSON",
		url : "/selectPetID",
		type : "GET",
		data : {
			petID: petID,
		},success : function(result) {
			$('#pet_name').val(result.pet_name);
	 	  	$('#pet_weight').val(result.pet_weight);
			$('#pet_birthyear').val(result.pet_birthyear);
			$('#pet_breed').val(result.pet_breed);
			$("#pet_personality").val(result.pet_personality);
		},error : function(e){
			alert(e)
		}
	});
	$('.petButtonWrap').css("display", "none");
    $('.petInfoButtonWrap').css("display", "");
	petmodalOn();
}

function changePetInfo() {
	var pet_id = $('#showPetId').val();
	var change_pet_name = $('#pet_name').val();
	var change_pet_weight = $('#pet_weight').val();
	var change_pet_birthyear = $('#pet_birthyear').val();
	var change_pet_breed = $('#pet_breed').val();
	var change_file = $('#file').val();
	var change_pet_personality = $('#pet_personality').val();
	
	let checkNum = RegExp(/^[0-9]+$/);
	let checkEngAKor = RegExp(/^[가-힣]|[A-Z]|[a-z]$/);
	
	if(change_pet_name == "" || change_pet_weight == "" || change_pet_birthyear == "" ||  change_pet_breed == "" || change_pet_personality == ""){
		swal('반려동물 추가 실패!', '공백을 입력하세요.', 'warning');
	}else if(!checkNum.test(change_pet_weight) || !checkEngAKor.test(change_pet_breed)){
		swal('반려동물 추가 실패!', '형식에 맞춰 작성해주세요.', 'warning');
	}else{
		$.ajax({
			url : '/mypage/changePetInfo',
			type : 'post',
			data:{
				ChangepetName: change_pet_name,
				ChangepetWeight: change_pet_weight,
				ChangepetBirthyear: change_pet_birthyear,
				ChangepetBreed: change_pet_breed,
				ChangepetFile: change_file,
				ChangepetPersonality: change_pet_personality,
				petId: pet_id,
			},
			success : function(data) {
				if (data == 1) { //성공
					petmodalOff();
				} 
			}
		});
	}
}

function showPetDeleteItem(){
	var pet_id = $('#showPetId').val();
	showPetmodalOff();
	$.ajax({
		url : '/mypage/deletePetInfo',
		type : 'post',
		data:{
			pet_id: pet_id,
		},
		success : function(data) {
			if (data == 1) { //성공
				$('div').remove("#" + pet_id );
				var numItems = $('.swiper-slide').length
				if (numItems == 0) {
					$('.nonePetWrap').css("display","");
					$('.addPetWrap').css("display","none");
				}
			} 
		}
	});
}

