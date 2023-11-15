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
<%
	MyDiaryVO detailDiary = (MyDiaryVO)request.getAttribute("detailDiary");
	System.out.println("11111111" + detailDiary);
%>
</head>
<body>
   <!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
    <div class="bannerWrap">
        <h1>나의 반함</h1>
        <p>반함에서 반려동물과의 추억을 들러보세요.</p>
    </div>
    <div class="section">
       <div class="overviewWrap">
           <h2><%=detailDiary.getDiary_title() %></h2>   
        </div>
        <div class=overviewtextwrap>
        	<p class="overview"><%=detailDiary.getDiary_overview()%></p>
        </div>
   </div>

   
   <!-- 공통 footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
   
   <script type="text/javascript">
    $(document).ready(function() {
       $('#return_mydiary').click(function() {
           $.ajax({
               url: 'return_mydiary',
               type: 'GET',
               dataType: 'text',
               success: function(data) {
                  window.location.href = "mydiary";
               },
               error: function() {
                   console.error('데이터를 전송하지 못했습니다.');
               }
           });
       });
       
       
    });
   </script>

</body>
</html>