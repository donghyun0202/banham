<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반함</title>
    <link href="${Path}/resources/css/home.css" rel="stylesheet"/>
</head>
<body>

	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>
    
	<!-- MAIN DIV -->
    <div id="section">
        <div class="imgWrap">
            <img src="${Path}/resources/images/dog/dog3.jpg" alt="">
            <!-- search 구조 include  -->
  			<jsp:include page="/WEB-INF/views/tour/search.jsp"/>
        </div>  
    </div>
	
    <!-- BANNER을 제외한 나머지 부분 -->
    <div id="text">
        <div class="textWrap">
            <h2>반려동물과 함께 할 장소를 확인해보세요.</h2>
            <p>검색하거나 목록에서 직접 선택해주세요.</p>
        </div>
    </div>
    
   <!-- swiper 구조 include  -->
   <jsp:include page="/WEB-INF/views/include/swiper.jsp"/>
    
    
    <!-- 공통 footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>