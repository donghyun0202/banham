<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import ="com.project.banham.user.UserVO" %> 
<% 	
	String userid;
	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		userid = vo.getUser_id();
	}else{
		userid = "";
	}
%>

<title>반함</title>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


   <link href="${Path}/resources/css/diary/diary.css" rel="stylesheet"/>
   
</head>
<body>
	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
    
 	<div class="bannerWrap">
        <h1>나의 반함</h1>
        <p>반려동물과 함께 한 추억을 공유하세요.</p>
    </div>

    <section id="diary">
        <div class="diary-title">
            <div class="container">
                <img src="${path}/resources/images/logo/imglogo_black.png" alt="">
                <h2>반함 글 등록</h2>
                <p>제목과 장소 등을 선택한 후 글을 등록하세요.</p>
            </div>
        </div>

        <div class="diary-table">
            <div class="container">
                <table class="diary-board-table">
                    <tbody>
                        <tr class="th-title">
                            <th>제목</th>
                            <td><input type="text" id="club_title"></td>
                        </tr>
                        <tr class="th-user">
                            <th>작성자</th>
                            <td id="club_writer"><%= userid %></td>
                        </tr>
                        <tr class="th-location">
                            <th>장소</th>
                            <td class="td-location-add-wrap">
                                <div class="locationaddwrap">
                                    <!-- 장소추가 -->
                                </div>
                                <div class="add-location-button" onclick="clubLocationModal()">추가·변경</div>
                                <input type="hidden" id="add-location-id-input">
                            </td>
                        </tr>
                        <tr class="th-overview">
                            <th>설명</th>
                            <td><textarea id="club_overview"></textarea></td>
                        </tr>    
                    </tbody>
                </table>
            </div>
        </div>

        <div class="diary-button-wrap">
            <div class="container">
                <input type="button" value="취소">
                <input type="button" class="diary-click" value="등록" onclick="diaryRegButton()">
            </div>
        </div>
    </section>
    
    <!-- 장소선택모달 -->
    <jsp:include page="/WEB-INF/views/club/club_location_modal.jsp"/>
    
      <!-- 공통 footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>

	    function addLeadingZero(num) {
	      return (num < 10 ? '0' : '') + num;
	    }

    	function diaryRegButton(){
    		var currentDate = new Date();
    	    
    	    var year = currentDate.getFullYear();
    	    var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
    	    var day = currentDate.getDate();
    	    
    		var formattedDate = year + '-' + addLeadingZero(month) + '-' + addLeadingZero(day);
    		var diaryTitle = $('#club_title').val();
    		var diaryLocation =	$('#add-location-id-input').val();
    		var diaryOverview = $('#club_overview').val();
    		var diaryCreateDate = formattedDate
    		if (diaryTitle == "" || diaryLocation == "" || diaryOverview == ""){
    			swal("공백 존재!", "공백이 있습니다. 빈 값을 확인해세요.", "warning");
    		}else{
    			$.ajax({
    	    		url : '/diary/diaryRegSuccess',
    	    		type : 'post',
    	    		data:{
    	    			diaryTitle: diaryTitle,
    	    			diaryLocation: diaryLocation,
    	    			diaryOverview: diaryOverview,
    	    			diaryCreateDate: diaryCreateDate,
    	    		},
    	    		success : function(data) {
    	    			console.log(data);
    	    			swal('글 등록 성공!', "글을 등록했습니다.",'success')
    	    			.then(function(){
    	    				location.href="/diary";                   
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
    	
    	function clubLocationcheckButton() {
    	    var result = clublocationCheckID();
    	    console.log(result);
    	    const idresult = [];
    	    var newhtml = "";
    	    for(let i = 0; i < result.length; i++){
    	    	var locationid = [];
    	        
    	        newhtml += '<div class="add-location-wrap">';
    	        newhtml += '<div class="add-location">' + result[i][1] + '</div>';
    	        newhtml += '</a></div>';
    	        locationid.push(result[i][0],result[i][1],result[i][2]);
    	        idresult.push(locationid);
    	    }

    	    $('.td-location-add-wrap #add-location-id-input').val(idresult);
    	    $('.td-location-add-wrap .locationaddwrap').empty();
    	    $('.td-location-add-wrap .locationaddwrap').html(newhtml);
    	    clubLocationmodalOff();
    	}
    	
    	function clublocationCheckID(){
    	    const locationArray = [];

    	    $('.location-select-item-box').each(function() {
    	        const idList = [];

    	        const idValue = $(this).attr('id');
    	        let id = idValue.toString();
    	        const h4Value = $('#' + id +'.location-select-item-box h4').text()
    	        const pValue = $('#' + id +'.location-select-item-box p').text()
    	        idList.push(id, h4Value, pValue);
    	        locationArray.push(idList);
    	    });

    	    console.log('아이디 배열:', locationArray);
    	    return locationArray;
    	}

    </script>
</body>
</html>