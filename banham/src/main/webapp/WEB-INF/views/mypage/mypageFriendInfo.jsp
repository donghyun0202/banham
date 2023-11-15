<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/mypage/mypageFriendInfo.css" rel="stylesheet"/>
</head>
<body>
	<div class="friendMenuWrap">
        <div id="friendList" class="friendCheck" onclick="friendCheck(this.id)">나의 친구</div>
        <div id="friendRequest" onclick="friendCheck(this.id)">친구 신청</div>
    </div>

    <section class="notice">
    <div class="page-title">
            <div class="container">
                <h3>친구목록</h3>
            </div>
        </div>
        
    <!-- board list area -->
        <div id="board-list" class="friend-list">
            <div class="container">
                <table class="board-table">
                    <thead>
                    <tr>
                        <th scope="col" class="th-checkbox">선택</th>
                        <th scope="col" class="th-num">번호</th>
                        <th scope="col" class="th-friendId">친구아이디</th>
                        <th scope="col" class="th-date">추가일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th><input type="checkbox" name="friend" value="userID"/></th>
                        <td>3</td>
                        <td>dldmswl98</td>
                        <td>2017.07.13</td>
                    </tr>
    
                    <tr>
                        <th><input type="checkbox" name="friend" value="userID"/></th>
                        <td>2</td>
                        <td>dldmswl98</td>
                        <td>2017.06.15</td>
                    </tr>
    
                    <tr>
                        <th><input type="checkbox" name="friend" value="userID"/></th>
                        <td>1</td>
                        <td>dldmswl98</td>
                        <td>2017.06.15</td>
                    </tr>
                    </tbody>
                </table>

                <div class="buttonWrap">
                    <label><input class="input-checkbox" type="checkbox" value="">전체선택</label>
                    <input class="input-button" type="button" value="삭제">
                </div>
            </div>
        </div>



        <div class="requestBox" style="display : none">
            <div class="menuBox container">
                <div class="requestMenuWrap">
                    <div id="request" class="requestClick" onclick="requestButton(this.id)">받은 요청</div>
                    <div id="sent" onclick="requestButton(this.id)">보낸 요청</div>
                </div>
            </div>
            <div id="board-list" class="friend-request">
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-checkbox">선택</th>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-friendId">신청한 사람</th>
                            <th scope="col" class="th-date">신청일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="friend" value="userID"/></td>
                            <td>3</td>
                            <td>dldmswl98</td>
                            <td>2017.07.13</td>
                        </tr>
        
                        <tr>
                            <td><input type="checkbox" name="friend" value="userID"/></td>
                            <td>2</td>
                            <td>dldmswl98</td>
                            <td>2017.06.15</td>
                        </tr>
        
                        <tr>
                            <td><input type="checkbox" name="friend" value="userID"/></td>
                            <td>1</td>
                            <td>dldmswl98</td>
                            <td>2017.06.15</td>
                        </tr>
                        </tbody>
                    </table>
    
                    <div class="buttonWrap">
                        <label><input class="input-checkbox" type="checkbox" value="">전체선택</label>
                        <input class="input-button" type="button" value="수락">
                        <input class="input-button" type="button" value="거절">
                    </div>
                </div>
            </div>
    
            <div id="board-list" class="friend-sent" style="display: none;">
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-checkbox">선택</th>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-applyId">신청한 사람</th>
                            <th scope="col" class="th-date">신청일</th>
                            <th scope="col" class="th-state">상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox" name="friend" value="userID"/></td>
                            <td>3</td>
                            <td>dldmswl98</td>
                            <td>2017.07.13</td>
                            <td>요청중</td>
                        </tr>
        
                        <tr>
                            <td><input type="checkbox" name="friend" value="userID"/></td>
                            <td>2</td>
                            <td>dldmswl98</td>
                            <td>2017.06.15</td>
                            <td>요청중</td>
                        </tr>
        
                        <tr>
                            <td><input type="checkbox" name="friend" value="userID"/></td>
                            <td>1</td>
                            <td>dldmswl98</td>
                            <td>2017.06.15</td>
                            <td>요청중</td>
                        </tr>
                        </tbody>
                    </table>
    
                    <div class="buttonWrap">
                        <label><input class="input-checkbox" type="checkbox" value="">전체선택</label>
                        <input class="input-button" type="button" value="신청취소">
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${path}/resources/js/mypageFriendInfo.js"></script>
</body>
</html>