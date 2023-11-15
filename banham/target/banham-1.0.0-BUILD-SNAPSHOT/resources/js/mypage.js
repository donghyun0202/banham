function isEmptyArr(arr)  {
  if(Array.isArray(arr) && arr.length === 0)  {
    return true;
  }
  
  return false;
}

function menuClick(changeId){
    if(changeId == "infoChange"){
        $('.myMenuWrap #infoChange').addClass("click");
        $('.myMenuWrap #petChange').removeClass("click");
        $('.myMenuWrap #clubChange').removeClass("click");
        $('.myMenuWrap #frdChange').removeClass("click");
        $('.mypageMenuWrap .InfoWrap .titleWrap h2').text("회원정보수정");
        $('.mypageMenuWrap .InfoWrap .titleWrap p').html("안녕하세요. 반함입니다. <br> 비밀번호 입력 후, 회원정보를 수정하세요.");
            
        $('.mypageChagneInfo').css("display","");
        $('.mypagePetInfo').css("display","none");
        $('.mypageClubInfo').css("display","none");
        $('.mypageFriendInfo').css("display","none");
    }else if(changeId == "petChange"){
        $('.myMenuWrap #infoChange').removeClass('click');
        $('.myMenuWrap #petChange').addClass('click');
        $('.myMenuWrap #clubChange').removeClass('click');
        $('.myMenuWrap #frdChange').removeClass("click");
        $('.mypageMenuWrap .InfoWrap .titleWrap h2').text("반려동물");
        $('.mypageMenuWrap .InfoWrap .titleWrap p').html("안녕하세요. 반함입니다. <br> 반려동물을 추가 혹은 수정하세요.");

        $('.mypageChagneInfo').css("display","none");
        $('.mypagePetInfo').css("display","");
        $('.mypageClubInfo').css("display","none");
        $('.mypageFriendInfo').css("display","none");
        $.ajax({
    		dataType : "JSON",
    		url : "/petList",
    		type : "GET",
    		data : {
    		},success : function(result) {
    	 	   if(isEmptyArr(result) == true){
    	 		  $('.nonePetWrap').css("display","");
    	 		  $('.addPetWrap').css("display","none");
    	 	   }else{
    	 		  var newHtml = "";
    	 		  for(let i = 0; i < result.length; i ++){
    	 			  newHtml += '<div class="swiper-slide" id=\'' + result[i].pet_id + '\' onclick="showMyPet(this.id)">';
    	 			 /* newHtml += '<img src= \'' + result[i].pet_imgfile + '\' />';*/
    	 			  newHtml += '<img src="/resources/images/logo/noneFile.png" />';
    	 			  newHtml += '<div class="petTitleWrap">';
    	 			  newHtml += '<h2>' + result[i].pet_name + '</h2>';
    	 			  newHtml += '<p>' + result[i].pet_birthyear + '</p>';
    	 			  newHtml += '<p><font color="#E76161" font-size="10px">' + '[' + result[i].pet_breed + ']' + '</font></p>';
    	 			  newHtml += '</div>';
    	 			  newHtml += '</div>';
    	 		  }
    	 		  
    	 		  $(".addPetWrap .swiper-wrapper").html(newHtml);
		 		  $('.nonePetWrap').css("display","none");
		 		  $('.addPetWrap').css("display","");
    	 	   }
    	 	   
    	 	  $.getScript("https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js", function() {
                  $.getScript("${path}/resources/js/pet_swiper.js", function() {
                  });
              });
			},error : function(e){
				alert(e)
			}
    	});
    }else if(changeId == "clubChange"){
        $('.myMenuWrap #infoChange').removeClass('click');
        $('.myMenuWrap #petChange').removeClass('click');
        $('.myMenuWrap #clubChange').addClass('click');
        $('.myMenuWrap #frdChange').removeClass("click");
        $('.mypageMenuWrap .InfoWrap .titleWrap h2').text("모임");
        $('.mypageMenuWrap .InfoWrap .titleWrap p').html("안녕하세요. 반함입니다. <br> 모임 등록·신청현황 등을 확인하세요.");
        
        $('.mypageChagneInfo').css("display","none");
        $('.mypagePetInfo').css("display","none");
        $('.mypageClubInfo').css("display","");
        $('.mypageFriendInfo').css("display","none");
        $.ajax({
    		dataType : "JSON",
    		url : "/myclubList",
    		type : "GET",
    		data : {
    		},success : function(response) {
    	        const combinedResults = [];// 정렬을 위한 배열 선언

    	        response.myclub.forEach(item => {
    	            const newItem = Object.assign({}, item, { "name": "myclub" });
    	            combinedResults.push(newItem);
    	        });

    	        response.applyclub.forEach(item => {
    	            const newItem = Object.assign({}, item, { "name": "applyclub" });
    	            combinedResults.push(newItem);
    	        });
    	        
    	        // "club_id"로 정렬
    	        combinedResults.sort((a, b) => b.club_id.localeCompare(a.club_id));
    	        
    	        var clubListhtml = "";
    	        
    	        for(let i=0; i<combinedResults.length; i++){
    	        	var item = combinedResults.length - i;
    	        	clubListhtml += '<tr data-filter=\'' + combinedResults[i].name + '\' id=\'' + combinedResults[i].club_id + '\' onclick="redirectToClubBoard(\'' + combinedResults[i].club_id + '\')">';
	        		clubListhtml += '<td>' + item + '</td>';
	        		clubListhtml += '<th>'+ combinedResults[i].club_title +'</th>';
        			clubListhtml += '<td>'+ combinedResults[i].club_writer +'</td>';
        			clubListhtml += '<td>'+ combinedResults[i].club_date_create +'</td>';
        			if(combinedResults[i].name == "myclub"){
        				var club_status = "";
        				if(combinedResults[i].club_status == "end"){
        					club_status = "마감";
        				}else if(combinedResults[i].club_status == "progress"){
        					club_status = "모집중";
        				}else{
        					club_status = "삭제";
        				}
        				clubListhtml += '<td>'+ club_status +'</td>';
        			}else{
        				var apply_status;
        				if(combinedResults[i].apply_status == "apply"){
        					apply_status = "승인완료";
        				}else if(combinedResults[i].apply_status == "waiting"){
        					apply_status = "대기중";
        				}else if(combinedResults[i].apply_status == "delete"){
        					apply_status = "삭제";
        				}else{
        					apply_status = "거절";
        				}
        				clubListhtml += '<td>'+ apply_status +'</td>';
        			}
        			
        			clubListhtml += '</tr>';
    	        }
    	       
    	        $('.myclubaddlist').html(clubListhtml);
			},error : function(e){
				alert(e)
			}
    	});
        
    }else if(changeId == "frdChange"){
        $('.myMenuWrap #infoChange').removeClass('click');
        $('.myMenuWrap #petChange').removeClass('click');
        $('.myMenuWrap #clubChange').removeClass('click');
        $('.myMenuWrap #frdChange').addClass("click");
        $('.mypageMenuWrap .InfoWrap .titleWrap h2').text("친구 목록·추가");
        $('.mypageMenuWrap .InfoWrap .titleWrap p').html("안녕하세요. 반함입니다. <br> 친구 목록·추가 등을 확인하세요.");
        
        $('.mypageChagneInfo').css("display","none");
        $('.mypagePetInfo').css("display","none");
        $('.mypageClubInfo').css("display","none");
        $('.mypageFriendInfo').css("display","");
    }
}


function redirectToClubBoard(boardid){
	const url = '/club/clubboard?boardID=' + boardid;

    // 해당 URL로 리다이렉션
    window.location.href = url;
}



