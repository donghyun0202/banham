<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/club/club_location_modal.css" rel="stylesheet"/>
</head>
<body>
	<!-- 장소 추가 모달 modal -->
    <div id="club-location-modal" class="club-location-modal-Wrap">
        <div class="club-location-modal-Box">
            <div class="club-location-text-wrap">
                <img src="${path}/resources/images/logo/imglogo_black.png" alt="">
                <h2>반려동물과 함께</h2>
                <p>반려동물과 함께 할 장소를 선택하세요.</p>
            </div>

            <div class="club-location-search-wrap">
                <select id="search_contenttypeid">
                    <option value="0">관광타입</option>
					<option value="12">관광지</option>
					<option value="14">문화시설</option>
					<option value="15">행사/공연/축제</option>
					<option value="25">여행코스</option>
					<option value="28">레포츠</option>
					<option value="32">숙박</option>
					<option value="38">쇼핑</option>
					<option value="39">음식점</option>
                </select>
                <select id="search_area">
                    <option value="0">지역선택</option>
                </select>
                <input id="search_text" type="text" placeholder="검색어를 입력하세요">
                <input type="button" value="검색하기" onclick="locationSearchClick()">
            </div>
            <div class="club-location-search-result-wrap">
                <!-- <div class="location-result-item-box" id="locationid1" onclick="LocationItemClick(this.id, this)">
                    <h3 id="locationid1">장소명1</h3>
                    <p>지역</p>
                </div>
                <div class="location-result-item-box" id="locationid2" onclick="LocationItemClick(this.id, this)">
                    <h3 id="locationid2">장소명2</h3>
                    <p>지역</p>
                </div> -->
            </div>
            <p style="margin-top: 10px;">선택장소</p>
            <div class="club-location-select-result-wrap">
                <!-- 위에 선택된 장소 복사됨 -->
            </div>
            <div class="club-location-button-wrap">
                <input type="button" value="취소" id="club-location-input-cancel" onclick="clubLocationcancellButton()">
                <input type="button" value="확인" id="club-location-input-ok" onclick="clubLocationcheckButton()">
            </div>
        </div>    
    </div>
	
	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   	<script src="${path}/resources/js/club_location_modal.js"></script>
 
</body>
</html>