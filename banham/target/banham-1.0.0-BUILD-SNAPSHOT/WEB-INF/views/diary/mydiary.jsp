<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반함</title>
	<link href="${Path}/resources/css/diary/diary.css" rel="stylesheet"/>
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.banham.diary.MyDiaryVO" %>
<%@ page import ="com.project.banham.user.UserVO" %> 
<%
	ArrayList<MyDiaryVO> mydiaryList = (ArrayList<MyDiaryVO>)request.getAttribute("myDiaryList");
%>
<% 	
	String userName;
	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		userName = vo.getUser_name();
	}else{
		userName = "";
	}
	
%>
</head>
<body>
   <!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>

   <div class="bannerWrap">
        <h1>나의 반함</h1>
        <p>반함에서 반려동물과의 추억을 기록하세요.</p>
    </div>
   
   <div class="section">
      <div class="overviewWrap" id="diary_option">
           <h2><%=userName %> 의 다이어리</h2>
           <input type="button" value="글 작성하기" onclick="location.href='/diary/diary_write'">
      </div>
        
      <div style=" text-align: center; margin-top: 5px;">
           <p>책의 모서리를 눌러 추억을 둘러보세요.</p>
      </div>
   </div>
   
   	<div id="book">
   		<div style="background-image: url(${Path}/resources/images/diary/diary1.jpg);border: 1px solid black;''display: flex;justify-content: center;align-items: center;height: 100vh;">
           <div>
           		<h2><%=userName %>의 다이어리</h2>
           </div>
        </div>
        <% for(int i=0; i<mydiaryList.size(); i++){ 
        	MyDiaryVO mydiaryBoard = mydiaryList.get(i);%>
        	<div style="background-image: url(${Path}/resources/images/diary/diary2.jpg);border: 1px solid black;"><div id="diary_title">
				<h2><%=mydiaryBoard.getDiary_title() %></h2> 
				<div onclick="searchDiary('<%=mydiaryBoard.getDiary_id()%>')">
					<img src="${Path}/resources/images/diary/diary3.png" alt="" style="width:30px;height:30px;vertical-align: middle;margin-top:10px;margin-right:10px;">
				</div>
			</div>
				<div>
					<br><p><%=mydiaryBoard.getDiary_overview() %></p>
				</div>
			</div>
        <%} %>
   </div>
    
    <!-- 공통 footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    
   <script src="${Path}/resources/js/turn.min.js"></script>
   <script>
        $('#book').turn({gradients: true, acceleration: true});
        
        function searchDiary(id){
	    	const url = '/diary/diary_detail?data=' + id;

            // 해당 URL로 리다이렉션
            window.location.href = url;
    	} 
    </script>
  
</body>
</html>