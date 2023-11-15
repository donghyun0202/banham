$(document).ready(function() {
    // 현재 날짜를 구하고, 그 이전의 날짜를 선택할 수 없도록 설정
    const today = new Date().toISOString().split('T')[0];
    $('.input-date').attr('min', today);
    $('#input-date-club').change(function() {
        $('#input-date-deadline').css("display" , "");
        $('#input-date-deadline-p').css("display" , "none");
        updateSecondDateRange();
    });
});

function updateSecondDateRange(){
    const selectedDate = $('#input-date-club').val();
    $('#input-date-deadline').attr('max', selectedDate);
    $('#input-date-deadline').removeAttr("disabled");
}

// 동물 추가 코드

function petItemIdAdd(id){
    var divElement = $("#"+id); 
    if(divElement.hasClass('pet-item-wrap') && divElement.hasClass('pet-item-check')){
        $("#"+id).removeClass("pet-item-check");
    }else{
        $("#"+id).addClass("pet-item-check");
    }
}

function clubPetCheckID(){
    const idArray = [];

    $('.pet-item-check').each(function() {
       /* const idList = [];*/

        const idValue = $(this).attr('id');
        const h3Value = $('h3#' + idValue).text()
        /*idList.push(idValue, h3Value);
        idArray.push(idList);*/
        idArray.push(idValue, h3Value);
    });

    console.log('아이디 배열:', idArray);
    return idArray;
}

function clubPetClickAdd(){
    const result = clubPetCheckID();
    console.log(result);
    const idresult = [];
    var newhtml = "";
    for(let i = 0; i < result.length; i+=2){
    	/*var petid = [];*/
       
        newhtml += '<div class="add-pet-wrap">';
        newhtml += '<div class="add-pet">' + result[i+1] + '</div>';
        newhtml += '</div>';
        /*petid.push(result[i][0],result[i][1])
        idresult.push(petid);*/
        idresult.push(result[i],result[i+1]);
       
    }

    $('.td-pet-clubpetClickAdd #add-pet-id-input').val(idresult);
    $('.td-pet-clubpetClickAdd .clubPetClickWrap').empty();
    $('.td-pet-clubpetClickAdd .clubPetClickWrap').html(newhtml);
    clubPetmodalOff();
}

//장소 추가 코드



function clublocationCheckID(){
    const locationArray = [];

    $('.location-select-item-box').each(function() {
        /*const idList = [];*/

        const idValue = $(this).attr('id');
        let id = idValue.toString();
        const h4Value = $('#' + id +'.location-select-item-box h4').text()
        const pValue = $('#' + id +'.location-select-item-box p').text()
        /*idList.push(id, h4Value, pValue);
        locationArray.push(idList);*/
   
        locationArray.push(id, h4Value, pValue);
    });

    return locationArray;
}

function clubLocationcheckButton() {
    var result = clublocationCheckID();

    const idresult = [];
    var newhtml = "";
    for(let i = 0; i < result.length; i+=3){
    	/*var locationid = [];*/
        
        newhtml += '<div class="add-location-wrap">';
        newhtml += '<div class="add-location">' + result[i+1] + '</div>';
        newhtml += '</a></div>';
        /*locationid.push(result[i][0],result[i][1],result[i][2]);
        idresult.push(locationid);*/
        
        idresult.push(result[i],result[i+1],result[i+2]);
    }

    $('.td-location-add-wrap #add-location-id-input').val(idresult);
    $('.td-location-add-wrap .locationaddwrap').empty();
    $('.td-location-add-wrap .locationaddwrap').html(newhtml);
    clubLocationmodalOff();
}


//등록 버튼
function addLeadingZero(num) {
  return (num < 10 ? '0' : '') + num;
}

function registerSubmit(){
	var currentDate = new Date();
    
    var year = currentDate.getFullYear();
    var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
    var day = currentDate.getDate();
    
    var formattedDate = year + '-' + addLeadingZero(month) + '-' + addLeadingZero(day);
    var club_title = $("#club_title").val();
    var club_writer = $("#club_writer").text();
    var club_date = $("#input-date-club").val();
    var club_person = $("#club_person").val();
    var club_deadline = $("#input-date-deadline").val();
    var club_pet = $("#add-pet-id-input").val();
    var club_location = $("#add-location-id-input").val();
    var club_overview = $("#club_overview").val();
    var club_status = "progress";
    var club_date_create = formattedDate;
    
    let checkNum = RegExp(/^[0-9]+$/);
    
    if(club_title == "" || club_writer == "" || club_date == "" || club_person == "" || club_deadline == "" || club_pet == "" || club_location == "" || club_overview == "" ){
    	swal('모임 등록 실패!', '공백이 있습니다. 공백 값을 확인하여 다시 입력해주세요.', 'warning');
    }else if(!checkNum.test(club_person)){
    	swal('모임 등록 실패!', '모임 인원은 숫자만 입력 가능합니다. 다시 입력해주세요.', 'warning');
    }else{
    	$.ajax({
    		url : '/club/clubApplySuccess',
    		type : 'post',
    		data:{
    			club_title: club_title,
    			club_writer: club_writer,
    			club_date: club_date,
    			club_person: club_person,
    			club_deadline: club_deadline,
    			club_pet : club_pet,
    			club_location : club_location,
    			club_overview : club_overview,
    			club_status: club_status,
    			club_date_create : club_date_create,
    		},
    		success : function(data) {
    			swal('모임 등록 성공!', "모임을 등록했습니다.",'success')
    			.then(function(){
    				location.href="/club";                   
    			}) 
    		}
    	});
    }
    	
    	
}


function LocationItemClick(stringNumber, element){
	let id = stringNumber.toString();
    const clonedContents = $('#'+id).clone(true).addClass('location-select-item-box');
    const classname = element.classList[0];
    console.log(classname);
    if (classname == 'location-result-item-box'){
        const divCount = $('#'+id +'.location-select-item-box').length;
        if(divCount == 0){
            $('.club-location-select-result-wrap').append(clonedContents);
            $('#'+id +'.location-select-item-box').removeClass('location-result-item-box');
        }
    }else if(classname == 'location-select-item-box'){
        $('#'+id +'.location-select-item-box').remove();
    } 
}



