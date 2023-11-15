
function clubCheckId(item){
    if(item == "all"){
    	$('#all').addClass('clubCheck');
    	$('#myclub').removeClass('clubCheck');
        $('#applyclub').removeClass('clubCheck');
        $('.page-title h3').text("전체 모임");
    }else if(item == "myclub"){
    	$('#all').removeClass('clubCheck');
    	$('#myclub').addClass('clubCheck');
        $('#applyclub').removeClass('clubCheck');
        $('.page-title h3').text("나의 모임");
    }else if(item == "applyclub"){
    	$('#all').removeClass('clubCheck');
    	$('#myclub').removeClass('clubCheck');
        $('#applyclub').addClass('clubCheck');
        $('.page-title h3').text("신청한 모임");
    }

    if(item=="all"){
        $("[data-filter]").attr("style", null).show();
    }else{
    	$("tbody tr").not("[data-filter='"+item+"']").hide();
        $("[data-filter='"+item+"']").attr("style", null).show();
    }
}


function myClubSearchButton(){
	var keyword = $('.search-wrap #search').val();
	var clubSearchHtml = "";
	
	$.ajax({
		dataType : "JSON",
		url : "/mySearchResult",
		type : "GET",
		data : {
			keyword: keyword,
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
	        
	        console.log(combinedResults);
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
			$('.myclubaddlist').css("display", "none");
			$(".myClubSearchList").css("display", "");
			$('.myClubSearchList').html(clubListhtml);
		},error : function(e){
			alert(e)
		}
	});
}