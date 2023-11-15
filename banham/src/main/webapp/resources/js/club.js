function boardMenuClick(item){
    if(item == "all"){
    	$('#delete').removeClass('menu-action');
        $('#all').addClass('menu-action');
        $('#progress').removeClass( 'menu-action' );
        $('#end').removeClass( 'menu-action' );
        $('.page-title h3').text("전체 모임");
    }else if(item == "progress"){
    	$('#delete').removeClass('menu-action');
        $('#progress').addClass('menu-action');
        $('#all').removeClass( 'menu-action' );
        $('#end').removeClass( 'menu-action' );
        $('.page-title h3').text("진행중인 모임");
    }else if(item == "end"){
    	$('#delete').removeClass('menu-action');
        $('#end').addClass('menu-action');
        $('#all').removeClass( 'menu-action' );
        $('#progress').removeClass( 'menu-action' );
        $('.page-title h3').text("완료된 모임");
    }else{
    	$('#delete').addClass('menu-action');
        $('#end').removeClass('menu-action');
        $('#all').removeClass( 'menu-action' );
        $('#progress').removeClass( 'menu-action' );
        $('.page-title h3').text("삭제된 모임");
    }

    if(item=="all"){
        $("[data-filter]").attr("style", null).show();
    }
    else {
        $("tbody tr").not("[data-filter='"+item+"']").hide();
        $("[data-filter='"+item+"']").attr("style", null).show();
    }
}


function clubSearchButton(){
	var keyword = $('.search-wrap #search').val();
	var clubSearchHtml = "";
	$.ajax({
		dataType : "JSON",
		url : "/SearchResult",
		type : "GET",
		data : {
			keyword: keyword,
		},success : function(result) {
			if(result.length != 0){
				for(let i=0; i<result.length; i++){
					var count  = result.length - i;
					var status = "";
					clubSearchHtml += '<tr data-filter=\'' + result[i].club_status + '\' id=\'' + result[i].club_id + '\' onclick="redirectToClubBoard(\'' + result[i].club_id + '\')">';
					clubSearchHtml += '<td>' + count + '</td>';
					clubSearchHtml += '<th>' + result[i].club_title + '</th>';
					clubSearchHtml += '<td>' + result[i].club_writer + '</td>';
					clubSearchHtml += '<td>' + result[i].club_date_create + '</td>';
					if(result[i].club_status == "end"){
						status = "마감";
					}else if(result[i].club_status == "delete"){
						status = "삭제";
					}else{
						status = result[i].club_person;
					}
					clubSearchHtml += '<td>' + status + '</td>';
					clubSearchHtml += '</tr>'
						
				}
			}
			$('#clubNoSearch').css("display", "none");
			$("#clubSearchResultWrap").css("display", "");
			$('#clubSearchResultWrap').html(clubSearchHtml);
		},error : function(e){
			alert(e)
		}
	});
	
	
}