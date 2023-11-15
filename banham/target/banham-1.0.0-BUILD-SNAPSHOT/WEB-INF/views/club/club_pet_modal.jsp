<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/club/club_pet_modal.css" rel="stylesheet"/>
</head>
<body>
	<!-- 동물 추가 모달 modal -->
    <div id="club-pet-modal" class="club-pet-modal-Wrap">
        <div class="club-pet-modal-Box">
            <div class="club-pet-text-wrap">
                <img src="${path}/resources/images/logo/imglogo_black.png" alt="">
                <h2>반려동물과 함께</h2>
                <p>함께 모임에 참여할 반려동물을 선택해주세요.</p>
            </div>
            <div class="club-pet-item-wrap">
                <!-- <div class="pet-item-wrap" id="pet-item-id3" onclick="petItemIdAdd(this.id)">
                    <h3 id="pet-item-id3">해피</h3>
                    <p>[비글]</p>
                    <p>2014.07.25</p>
                </div>
                <div class="pet-item-wrap" id="pet-item-id2" onclick="petItemIdAdd(this.id)">
                    <h3 id="pet-item-id2">루트</h3>
                    <p>[비글]</p>
                    <p>2014.07.25</p>
                </div> -->
            </div>
            <div class="club-pet-button-wrap">
                <input type="button" value="취소" id="club-input-cancle" onclick="clubPetcancellButton()">
                <input type="button" value="확인" id="club-input-ok" onclick="clubPetClickAdd()">
                <input type="button" value="신청" id="club-input-apply" onclick="clubPetClickApply()">
            </div>
        </div>    
    </div>
    
     <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   	<script src="${path}/resources/js/club_pet_modal.js"></script>
</body>
</html>