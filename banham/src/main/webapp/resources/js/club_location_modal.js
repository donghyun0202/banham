const clubLocationmodal = document.getElementById("club-location-modal");
    
function clubLocationmodalOn() {
    clubLocationmodal.style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function clubLocationisModalOn() {
    return clubLocationmodal.style.display === "flex"
}

function clubLocationmodalOff() {
    clubLocationmodal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

function clubLocationModal() {
	var listElement = $('#search_area');
	 $.ajax({
         url: '/getsearch_area',
         type: 'GET',
         dataType: 'json',
         success: function(data) {
         	console.log(data);
             listElement.empty();
             $.each(data, function(index, item) {
             	var html = '<option value = "' + item.areaCode + '">' +
             	item.areaName + '</option>';
             	 listElement.append(html);
             });
         },
         error: function() {
             console.error('데이터를 불러오지 못했습니다.');
         }
     });
	 
	
    clubLocationmodalOn()
}

function clubLocationcancellButton(){
    clubLocationmodalOff()
}

clubLocationmodal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("explainWrap")) {
        clubLocationmodalOff()
    }
})

window.addEventListener("keyup", e => {
    if(clubLocationisModalOn() && e.key === "Escape") {
        clubLocationmodalOff()
    }
})


// 검색 버튼
function locationSearchClick(){
    var contenttypeid = $('#search_contenttypeid').val();
    var areaCode = $('#search_area').val();
    var searchText = $('#search_text').val();
    var locationWrap = $('.club-location-search-result-wrap');
	var newhtml = "";
    $.ajax({
		dataType : "JSON",
		url : "/getsearch",
		type : "GET",
		success : function(result) {
			$.each(result, function(index, item) {
            	if (
                    (contenttypeid == 0 || contenttypeid == item.contentTypeId) &&
                    (areaCode == 0 || areaCode == item.areaCode) &&
                    item.title.includes(searchText)
                ) {
            		var address = item.address;
            		const arr = address.split(" ");
                    newhtml += '<div class="location-result-item-box" id=\'' + item.contentId + '\' onclick="LocationItemClick(this.id, this)">' +
                    			'<h4>' + item.title + '</h4>' +
                    			'<p>'+ arr[0]+ " " + arr[1] + '</p>' +
                    			'</div>';
                }
            });
			
			 locationWrap.html(newhtml);
		},error : function(e){
			alert(e)
		}
	});
}
