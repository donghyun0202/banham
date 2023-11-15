<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/club/club_apply_modal.css" rel="stylesheet"/>
</head>
<body>
	<div id="club-Apply-modal" class="club-Apply-modal-Wrap">
        <div class="club-Apply-modal-Box">
            <div class="club-Apply-text-wrap">
                <img src="${path}/resources/images/logo/imglogo_black.png" alt="">
                <h2>반려동물과 함께</h2>
                <p id="applyID"></p>
            </div>
            <div class="club-apply-select-wrap">
                <select id="appltresult">
                	<option value="none" selected>선택</option>
                    <option value="apply">승낙</option>
                    <option value="refuse">거절</option>
                </select>
            </div>
            <div class="club-apply-hidden-wrap">
            	<input type="hidden" id="club-apply-user">
            	<input type="hidden" id="club-apply-club-id">
            </div>

            <div class="club-apply-button-wrap">
                <input type="button" value="확인" class="SubmitApply" onclick="clubApplyResult()">
                <input type="button" value="닫기" onclick="clubApplycancellButton()">
            </div>
        </div>    
    </div>
    
     <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   	<script src="${path}/resources/js/club_apply_modal.js"></script>
</body>
</html>