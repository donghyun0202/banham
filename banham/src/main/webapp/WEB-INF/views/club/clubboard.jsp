<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/club/club_write_screen.css" rel="stylesheet"/>
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="com.project.banham.user.UserVO" %> 
<%@ page import ="com.project.banham.club.ClubVO" %> 
<%@ page import ="com.project.banham.club.ApplyVO" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.google.gson.Gson" %>
<% 	
	String user_id;
	String board_id;
	String writer_id;
	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		user_id = vo.getUser_id();
	}else{
		user_id = "";
	}
	//게시물 보기
	ClubVO clubSearchId = (ClubVO)request.getAttribute("clubSearchId");
	
	String clubVOJson = new Gson().toJson(clubSearchId);
	board_id = clubSearchId.getClub_id();
	writer_id = clubSearchId.getClub_writer();
	
	ArrayList<ApplyVO> applyList = (ArrayList<ApplyVO>)request.getAttribute("applyList");
	String ApplyVOJson = new Gson().toJson(applyList);
%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var user_id = '<%= user_id%>';
		var board_id = '<%= board_id%>';
		var	writer_id = '<%= writer_id%>';
		
		var clubVOJson = '<%=clubVOJson%>';
		// club_pet 값을 수정합니다. 쉼표로 구분된 문자열을 배열로 변경하고 큰따옴표 추가
		clubVOJson = clubVOJson.replace(/"club_pet":"([^"]+)"/, '"club_pet":["$1"]');

		// club_location 값을 수정합니다. 쉼표로 구분된 문자열을 배열로 변경하고 큰따옴표 추가
		clubVOJson = clubVOJson.replace(/"club_location":"([^"]+)"/, '"club_location":["$1"]');

		// 줄바꿈 문자(\n)을 이스케이프 처리(\n -> \\n)
		clubVOJson = clubVOJson.replace(/\n/g, '\\n');
		
		var clubVO = JSON.parse(clubVOJson);
		var applyVO = JSON.parse('<%= ApplyVOJson %>');
		
		/* pet 추가 */
		var pet_item = clubVO.club_pet[0];
		var petItemHtml = "";
		if(pet_item != ""){
			let petItem = pet_item.split(",");
			console.log(petItem);
			for(let i=0; i<petItem.length; i+=2){
				petItemHtml += '<div class="add-pet-wrap" onclick="searchPetInfo(\'' + writer_id + '\',\'' + petItem[i] + '\')">';
				petItemHtml += '<div class="add-pet">' + petItem[i+1] + '</div>';
				petItemHtml += '</div>';
			}
			$('.clubPetClickWrap').html(petItemHtml);
		}
		/* Location 추가  */
		var location_item = clubVO.club_location[0];
		var locationItemHtml = "";
		if(location_item != ""){
			let locationItem = location_item.split(",");
			for(let i=0; i<locationItem.length; i+=3){
				locationItemHtml += '<div class="add-location-wrap" onclick="DetailLocation(\'' + locationItem[i] + '\')">';
				locationItemHtml += '<div class="add-location">' + locationItem[i+1] + '</div>';
				locationItemHtml += '</div>';
			}
			$('.locationaddwrap').html(locationItemHtml);
		}
		
		var applyItemHtml = "";
		if(applyVO != ""){
			for(let j=0; j<applyVO.length; j++){
				var apply_status = applyVO[j].apply_status;
				applyItemHtml += '<table class="th-apply-table" id=\'' + apply_status + '\'>';
				applyItemHtml += '<tr><th>아이디</th>';
				applyItemHtml += '<td class="td-apply-id">' + applyVO[j].user_id + '</td>';
				applyItemHtml += '<th>반려동물</th><td class="td-apply-pet">';
				var apply_pet = applyVO[j].pet_id;
				let ApplyPetItem = apply_pet.split(",");
				for(let h=0; h<ApplyPetItem.length; h+=2){
					applyItemHtml += '<div class="add-apply-wrap" id=\''+ ApplyPetItem[h]+'\' onclick="searchPetInfo(\''+ applyVO[j].user_id +'\',\'' +ApplyPetItem[h]+'\')">';
					applyItemHtml += '<div class="add-apply">' + ApplyPetItem[h+1] + '</div>';
					applyItemHtml += '</div>';
				}
				applyItemHtml += '</td>';
				var newStatus = "";
				if(apply_status == "waiting"){
					newStatus = "승인 대기중";
				}else if(apply_status == "delete"){
					newStatus = "삭제";
				}else if(apply_status == "refuse"){
					newStatus = "거절";
				}else{
					newStatus = "승인완료";
				}
				applyItemHtml += '<td class="td-apply-result" id=\'' + apply_status + '\' onclick="appylResultChange(\'' + applyVO[j].user_id + '\',\'' + user_id + '\',\'' + writer_id + '\',\'' + board_id + '\',this.id)">' + newStatus + '</td>';
				applyItemHtml += '</table>'; 
				
			}
			$('.th-application .th-apply-is-not-none').html(applyItemHtml);
			$('.th-application .th-apply-is-not-none').css('display', '');
			$('.th-application .th-apply-is-none').css('display', 'none');
		}else{
			var club_status = clubVO.club_status;
			if (club_status == "end"){
				$('.th-application .th-apply-is-none').text('신청자 모집이 마감되었습니다.');
			}else if(club_status == "delete"){
				$('.th-application .th-apply-is-none').text('작성자에 의해 삭제된 게시물입니다.');
			}else{
				$('.th-application .th-apply-is-none').text('신청자를 모집하고 있습니다.');
			}
			$('.th-application .th-apply-is-not-none').css('display', 'none');
			$('.th-application .th-apply-is-none').css('display', '');
		}
		
		if(writer_id == user_id){
			$('#waiting.th-apply-table').css('display', '');
			$('#delete.th-apply-table').css('display', '');
			$('#refuse.th-apply-table').css('display', '');
			$('#apply.th-apply-table').css('display', '');
			 
		}else{
			$('#waiting.th-apply-table').css('display', 'none');
			$('#delete.th-apply-table').css('display', 'none');
			$('#refuse.th-apply-table').css('display', 'none');
			$('#apply.th-apply-table').css('display', '');
			var applytable = $(".th-apply-table:hidden").length;
			if(applytable == applyVO.length){
				$('.th-apply-is-not-none').text("신청자를 모집하고 있습니다.");
			}
		}	
	});

</script>

	<%-- <script src="${path}/resources/js/clubboard.js"></script> --%>
<body>
   
    <!-- 공통 TOP 구조 include -->  
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
    <div class="bannerWrap">
        <h1>반함 모임</h1>
        <p>반함에서 반려동물과 함께 모임을 가지세요.</p>
    </div>

    <section id="register">
        <div class="register-title">
            <div class="container">
                <img src="${path}/resources/images/logo/imglogo_black.png" alt="">
                <h2>반함 모임</h2>
                <p>반려동물과 함께 좋은 추억을 만드세요.</p>
            </div>
        </div>

        <div class="register-table">
            <div class="container">
                <table class="register-board-table">
                    <tbody>
                        <tr class="th-title">
                            <th>제목</th>
                            <td><input type="text" id="club_title" value='${clubSearchId.club_title}' readonly></td>
                        </tr>
                        <tr class="th-user">
                            <th>작성자</th>
                            <td id="club_writer">${clubSearchId.club_writer}</td>
                        </tr>
                        <tr  class="th-date">
                            <th>모임 날짜</th>
                            <td><input type="date" class="input-date" id="input-date-club" value='${clubSearchId.club_date}' readonly></td>
                        </tr>
                        <tr class="th-person">
                            <th>모집 인원</th>
                            <td><input type="text" placeholder="숫자만 입력해주세요" id="club_person" value='${clubSearchId.club_person}' readonly></td>
                        </tr>
                        <tr class="th-person">
                            <th>모집 마감 날짜</th>
                            <td>
                                <input type="date" class="input-date" id="input-date-deadline" value='${clubSearchId.club_deadline}' readonly>
                                <p id="input-date-deadline-p" disabled style="display: none;"> 모임 날짜를 먼저 선택해주세요 </p>
                            </td>
                        </tr>
                        <tr class="th-pet">
                            <th>반려동물</th>
                            <td class="td-pet-clubpetClickAdd">
                                <div class="clubPetClickWrap">
									<!-- pet 추가 -->
                                </div>       
                                <input type="hidden" id="add-pet-id-input" value='${clubSearchId.club_pet}'>
                            </td>
                        </tr>
                        <tr class="th-location">
                            <th>장소</th>
                            <td class="td-location-add-wrap">
                                <div class="locationaddwrap">
                                	<!-- Location 추가  -->
                                </div>
                                <input type="hidden" id="add-location-id-input" value='${clubSearchId.club_location}'>
                            </td>
                        </tr>
                        <tr class="th-overview">
                            <th>설명</th>
                            <td><textarea id="club_overview" readonly>${clubSearchId.club_overview}</textarea></td>
                        </tr>
                        <tr class="th-application">
                            <th>신청현황</th>
                            <!-- 신청자가 있는 경우 -->
                            <td class="th-apply-is-not-none"></td>
                            <!-- 신청자가 없는 경우 -->
                            <td class="th-apply-is-none"> </td>
                        </tr>    
                    </tbody>
                </table>
            </div>
        </div>
		
		<!-- 본인 게시물 확인하는 경우 -->
		<%	String writeId = clubSearchId.getClub_writer();
			if(user_id.equals(writeId)){%>
				<div class="register-button-wrap">
		            <div class="container">
		                <input type="button" value="닫기" onClick="backWindow()">
		                <% if(clubSearchId.getClub_status().equals("end") == false){
		                	if(clubSearchId.getClub_status().equals("delete")== false){%>
		                <input type="button" class="register-click" value="삭제하기" onclick="clubBoardDelete('<%=board_id%>')">
		                <%}} %>
		                
		            </div>
		        </div>
				
			<%}else{%>
		        <!-- 본인 게시물이 아닌 경우 -->
		        <div class="register-button-wrap">
		            <div class="container">
		                <input type="button" value="닫기" onClick="backWindow()">
		                <% if(clubSearchId.getClub_status().equals("end") == false){ %>
		                <input type="button" class="register-click" value="신청하기" onclick="clubBoardApply('<%=board_id%>')">
		            	<%} %>
		            </div>
		        </div>
		     <%} %>
    </section>
  	
    	<!-- 동물 추가 모달 -->
    	<jsp:include page="/WEB-INF/views/club/club_pet_modal.jsp"/>
    	<!-- 장소선택모달 -->
    	<jsp:include page="/WEB-INF/views/club/club_location_modal.jsp"/>
    	<!-- 동물 확인 모달 -->
     	<jsp:include page="/WEB-INF/views/club/show_pet_modal.jsp"/>
     	<!-- 모임 신청 모달 -->
     	<jsp:include page="/WEB-INF/views/club/club_apply_modal.jsp"/>
     
     
     
     	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
   
   	
   	<script>
	  //신청하시 button
		function clubBoardApply(club_id){
			$.ajax({
				url : "/searchApplyId",
				type : "GET",
				data : {
					clubId : club_id,
				},
				success : function(data) {
					if(data >= 1){
						swal("신청 완료!", "신청한 모임입니다.", "warning");
					}else{
						var newhtml = "";
						$.ajax({
							dataType : "JSON",
							url : "/petList",
							type : "GET"
							,success : function(result) {
								if(result.length == 0){
									newhtml = "<h4 style='text-align: center;'>마이페이지에서 반려동물 등록 후 선택해주세요.</h4>"
								}else{
									for(let i=0; i<result.length; i++){
										newhtml += '<div class="pet-item-wrap" id=\'' + result[i].pet_id + '\' onclick="petItemIdAdd(this.id)">';
										newhtml += '<h3 id=\'' + result[i].pet_id + '\'>' + result[i].pet_name + '</h3>';
										newhtml += '<p>' + result[i].pet_breed + '</p>';
										newhtml += '<p>' + result[i].pet_birthyear + '</p>';
										newhtml += '</div>'
									}
									newhtml += '<input type="hidden" id="input-board-id" value=\'' + club_id + '\' />'
								}
								
								console.log(newhtml);
								$(".club-pet-item-wrap").html(newhtml);
								
							},error : function(e){
								alert(e)
							}
						});
						$(".club-pet-button-wrap #club-input-ok").prop("type", "hidden");
						$(".club-pet-button-wrap #club-input-apply").prop("type", "button");
					    clubPetmodalOn(); 
					}
				},error : function(e){
					alert(e)
				}
			});
			
		}
	  
		function petItemIdAdd(id){
		    var divElement = $("#"+id); 
		    if(divElement.hasClass('pet-item-wrap') && divElement.hasClass('pet-item-check')){
		        $("#"+id).removeClass("pet-item-check");
		    }else{
		        $("#"+id).addClass("pet-item-check");
		    }
		}

	  function clubBoardDelete(club_id){
		  $.ajax({
	    		url : '/deleteClub',
	    		type : 'post',
	    		data:{
	    			clubId: club_id,
	    		},
	    		success : function(data) {
	    			swal('모임 삭제!', "모임을 삭제했습니다.",'success')
	    			.then(function(){
	    				location.href="/club";                   
	    			}) 
	    		}
	    	});
		  
	  }
	  
	  function searchPetInfo(owner_id, pet_id){
		  console.log("222222");
			searchpetModalOn(owner_id, pet_id);
		}
	  
	  function backWindow(){
		  window.history.back();
	  }
	  
	  function ApplyModalOn(apply_user_id, board_id){
		  clubApplymodalOn();
	  }
	  
	  
	  function appylResultChange(apply_user, writer_id, user_id, board_id, apply_status){
			if(writer_id == user_id){
				if(apply_status != "apply"){
			    	$('.club-Apply-text-wrap p#applyID').text(apply_user + '님의 모임 참여 여부를 선택하세요.');
			    	$('.club-apply-hidden-wrap #club-apply-user').val(apply_user);
			    	$('.club-apply-hidden-wrap #club-apply-club-id').val(board_id);
					clubApplymodalOn();
				}
			}
		}
	  
	  function clubApplyResult(){
		  	var apply_user_id = $("#club-apply-user").val();
		  	var apply_club_id = $("#club-apply-club-id").val();
			var selectedValue = $("#appltresult").val();
			console.log(apply_user_id, apply_club_id, selectedValue);
			if (selectedValue == 'none'){
				swal('선택사항 없음','모임 참여 여부를 선택하세요.', 'warning');
			}else{
				$.ajax({
		    		url : '/updateclubResult',
		    		type : 'post',
		    		data:{
		    			user_id: apply_user_id,
		    			club_id: apply_club_id,
		    			select_value: selectedValue,
		    		},
		    		success : function(data) {
		    			swal('모임 상태 변경 완료!', "모임을 상태를 선택했습니다.",'success')
		    			.then(function(){
		    				const url = '/club/clubboard?boardID=' + apply_club_id;

		    	            // 해당 URL로 리다이렉션
		    	            window.location.href = url;                   
		    			}) 
		    		}
		    	});
			}
		}
	  
	  function DetailLocation(id){
		  const url = '/detail?data=' +id;

          // 해당 URL로 리다이렉션
          window.location.href = url; 
	  }
	  
	  function clubPetClickApply(){
			const result = clubPetCheckID();
			console.log(result);
			if(result.length == 0){
				swal('신청 실패!', "함께할 반려동물을 선택하세요.",'warning')
			}else{
				const joinedString = result.join(',');
				console.log(joinedString);
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
	  
	  function clubPetCheckID(){
		    const idArray = [];

		    $('.pet-item-check').each(function() {
		        /* const idList = []; */

		        const idValue = $(this).attr('id');
		        const h3Value = $('h3#' + idValue).text()
		        /* idList.push(idValue, h3Value);
		        idArray.push(idList); */
		    
		        idArray.push(idValue, h3Value);
		    });

		    return idArray;
		}



   	</script>
  

</body>
</html>