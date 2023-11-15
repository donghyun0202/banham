<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${path}/resources/css/mypage/mypageClubInfo.css" rel="stylesheet"/>
</head>
<body>
	<!-- 모임PAGE START -->
	<div class="myClubWrap">
	    <div class="clubMenuWrap">
	    	<div class="clubCheck" id="all" onclick="clubCheckId(this.id)">전체 모임</div>
	        <div id="myclub" onclick="clubCheckId(this.id)">나의 모임</div>
	        <div id="applyclub" onclick="clubCheckId(this.id)">신청한 모임</div>
	    </div> 
	    
	    
	    <section class="clubnoticeWrap">
	        <div class="page-title">
	                <div class="container">
	                    <h3>등록</h3>
	                </div>
	            </div>
	        
	            <!-- board seach area -->
	            <div id="board-search">
	                <div class="container">
	                    <div class="search-window">
	                           <div class="search-wrap">
	                               <label for="search" class="blind">공지사항 내용 검색</label>
	                               <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
	                               <button onclick="myClubSearchButton()" class="btn btn-dark">검색</button>
	                           </div>
	                    </div>
	                </div>
	            </div>
	            
	        <!-- board list area -->
	            <div id="board-list">
	                <div class="container">
	                    <table class="board-table">
	                        <thead>
	                        <tr>
	                            <th scope="col" class="th-num">번호</th>
                        		<th scope="col" class="th-title">제목</th>
                        		<th scope="col" class="th-user">작성자</th>
                        		<th scope="col" class="th-date">등록일</th>
                        		<th scope="col" class="th-personnel">상태</th>
	                        </tr>
	                        </thead>
	                        <tbody class="myclubaddlist">
	                        <!-- <tr data-filter="myclub">
	                            <td>3</td>
	                            <th></th>
	                            <td>dldmswl98</td>
	                            <td>2017.07.13</td>
	                            <td>2017.07.13</td>
	                        </tr>
	        
	                        <tr data-filter="myclub">
	                            <td>2</td>
	                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
	                            <td>dldmswl98</td>
	                            <td>2017.06.15</td>
	                            <td>2017.07.13</td>
	                        </tr>
	        
	                        <tr data-filter="applyclub">
	                            <td>1</td>
	                            <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
	                            <td>dldmswl98</td>
	                            <td>2017.06.15</td>
	                            <td>2017.07.13</td>
	                        </tr> -->
	                        </tbody>
	                        <tbody class="myClubSearchList">
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        
	        </section>
	</div>
	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${path}/resources/js/mypageClubInfo.js"></script>
	<!-- 모임PAGE END -->
</body>
</html>