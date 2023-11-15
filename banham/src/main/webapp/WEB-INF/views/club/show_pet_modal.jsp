<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/club/show_pet_modal.css" rel="stylesheet"/>
</head>
<body>
	<div id="showPetmodal" class="showPetexplainWrap">
        <div class="showPetexplainBox">
            <div class="showPetImgWrap">
                <img id="show_pet_img" src="" alt="">
            </div>
            <div class="showPetTextWrap">
                <div class="showPetTitleWrap">
                    <h2 id="showPetName"></h2>
                    <p id="showPetBirth"></p>
                    <p id="showPetbAw"></p>
                </div>
                <div class="showPetTextareaWrap">
                    <textarea id="showPetPer" readonly></textarea>
                </div>
            </div>
            <div class="showPetButtonWrap">
                <input class="showPetButtonok" type="button" value="확인" onclick="modalOff()">
            </div>
        </div>    
    </div>
    
         <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   	<script src="${path}/resources/js/show_pet_modal.js"></script>
</body>
</html>