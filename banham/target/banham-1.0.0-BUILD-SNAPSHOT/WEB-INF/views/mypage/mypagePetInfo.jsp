<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import ="com.project.banham.user.UserVO" %> 
<% 	
	String id;

	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		id = vo.getUser_id();
	}else{
		id = "";
	
	}
	
%>
<title>Insert title here</title>
	  
	
	<link href="${path}/resources/css/mypage/mypagePetInfo.css" rel="stylesheet"/>
	<!-- Swiper JS -->
	<!-- SWIPER -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script>
    $(document).ready(function () {
    	var swiper = new Swiper(".mySwiper", {
            effect: "coverflow",
            grabCursor: true,
            centeredSlides: true,
            slidesPerView: "auto",
            coverflowEffect: {
                rotate: 50,
                stretch: 0,
                depth: 100,
                modifier: 1,
                slideShadows: true,
            },
            pagination: {
                el: ".swiper-pagination",
            },
            });
    });

    
    </script>
</head>
<body>
 	<!-- 동물 추가 PAGE -->
   <div class="addMyPetWrap">
       <!-- 동물이 추가가 안된 경우 START-->
       <div class="nonePetWrap" style="display: none;">
           <div class="textWrap">
               <h3>나의 반려동물을 <font color="#E76161">추가</font>해보세요.</h3>
           </div>
       </div>
       <!-- 동물이 추가가 안된 경우 END-->
       
       <!-- 동물이 추가가 된 경우 START-->
       <div class="addPetWrap">
           <!-- swiper -->
           <div class="swiper mySwiper">
               <div class="swiper-wrapper">
	               <%-- <div class="swiper-slide">
	                   <img src="${path}/resources/images/dog/happy.jpg" />
	                   <div class="petTitleWrap">
	                       <h2>이해피</h2>
	                       <p>14.07.25</p>
	                       <p><font color="#E76161" font-size="10px">[비글]</font></p>
	                   </div> 
	               </div>--%>
               </div>
               <!-- <div class="swiper-pagination"></div> -->
           </div>
       </div>
       <!-- 동물이 추가가 된 경우 END-->
       <div class="addPetButtonWrap">
           <input type="button" value="추가" class="addButton" onclick="petaddMyPetClick()">
       </div>
   </div>
   <!-- 동물 추가 PAGE END -->
   
    <!-- MODAL -->
    <div id="Petmodal" class="petexplainWrap">
        <div class="petexplainBox">
            <div class="petTextWrap">
                <img src="${path}/resources/images/logo/imglogo_pink.png" alt="">
                <h2></h2>
            </div>
            <div class="petInfoWrap">
                <p>이름</p>
                <input name="pet_name" id="pet_name" type="text"  maxlength='20' placeholder="최대 20글자 입력 가능">
                <p>몸무게</p>
                <input name="pet_weight" id="pet_weight" type="text" placeholder="Kg(숫자만 입력해주세요)">
                <p>생년월일</p>
                <input name="pet_birthyear" id="pet_birthyear" type="date">
                <p>견종</p>
                <div class="petBreedBox">
                    <input name="pet_breed" type="text" placeholder="직접입력" id="pet_breed">
                    <select name="breed" id="pet_breed_select">
                    	<option value="none" selected>직접입력</option>
                        <option value="말티즈">말티즈</option>
                        <option value="포메라니안">포메라니안</option>
                        <option value="푸들">푸들</option>
                        <option value="웰시코기">웰시코기</option>
                        <option value="진돗개">진돗개</option>
                        <option value="비글">비글</option>
                        <option value="골든 리트리버">골든 리트리버</option>
                        <option value="사모예드">사모예드</option>
                        <option value="셰퍼드">셰퍼드</option>
                        <option value="코커 스파니엘">코커 스파니엘</option>
                        <option value="요크셔테리어">요크셔테리어</option>
                        <option value="비숑프리제">비숑프리제</option>
                        <option value="치와와">치와와</option>
                        <option value="불독">불독</option>
                    </select>
                </div>
                <p>프로필 이미지 선택</p>
                <div class="petImgWrap">
                    <input name ="pet_imgfile" type="file" name="file" id="file">
                </div>
                
                <p>성격</p>
                <textarea name="pet_personality" id="pet_personality"></textarea>
				
				<input type="hidden" name="owner_id" id="owner_id">
				<div class="petButtonWrap">
					<input class="canclePet" type="button" value="취소하기" onclick="petcancellButton()">
					<input class="addPet" type="button" value="추가하기" onclick="myPetAddButton('<%=id %>')">
				</div>
				
				<div class="petInfoButtonWrap">
					<input class="canclePet" type="button" value="취소" onclick="petcancellButton()">
					<input class="changePetInfo" type="button" value="변경" onclick="changePetInfo()">
				</div>
                
            </div>
        </div>    
    </div>
    
    <!-- 동물 확인 MODAL -->
    <div id="showPetmodal" class="showPetexplainWrap">
        <div class="showPetexplainBox">
            <div class="showPetImgWrap">
                <img id="showPetImgFile" src="${path}/resources/images/logo/noneFile.png" alt="">
            </div>
            <div class="showPetTextWrap">
                <div class="showPetTitleWrap">
                    <h2 id="showPetName"></h2>
                    <p id="showPetBirth"></p>
                    <p id="showPetbAw"></p>
                    <input id="showPetId" type="text">
                </div>
                <div class="showPetTextareaWrap">
                    <textarea id="showPetPer" readonly></textarea>
                </div>
            </div>
            <div class="showPetButtonWrap">
            	<input class="showPetButtonDelete" type="button" value="삭제" onclick="showPetDeleteItem()">
                <input class="showPetButtonchange" type="button" value="변경" onclick="showPetChangeItem()">
                <input class="showPetButtonok" type="button" value="확인" onclick="showPetmodalOff()">
            </div>
        </div>    
    </div>
 
   	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="${path}/resources/js/mypagePetInfo.js"></script>
     
</body>
</html>