<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반함</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="${path}/resources/css/swiper.css"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="swiper mySwiper">
	  <div class="swiper-wrapper" id="swiper-wrapper">
	  
	    <div>
	        <h1>이미지를 불러오고 있습니다.</h1>
	        <p>잠시만 기다려 주세요.</p>
	    </div>
		
	  	<!-- siwper 데이터 출력 -->
	  </div>
	  
	  <div class="swiper-num">
	  	<div class="swiper-pagination">
		  	<!-- siwper 페이징 출력 -->
		</div>
	  </div>
	</div>
	
	
	<script type="text/javascript">
        $(document).ready(function() {
            var listElement = $('#swiper-wrapper');
            
            $.ajax({
                url: '/getdata',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    listElement.empty();
                    //console.log(data);
                    $.each(data, function(index, item) {
                    	if(item.image1) {
                    		var imageSrc = item.image1;
                    	}
                    	else if(item.image2) {
                    		var imageSrc = item.image2;
                    	}
                    	else {
                            var imageSrc = '${Path}/resources/images/dog/dog2.jpg';
                    	}
                        var html = '<div class="swiper-slide">' +
                        	'<a href="detail?data=' + item.contentId + '">' +
                            '<img src="' + imageSrc + '" alt="">' +
                            '<div class="swiper-text-Wrap">' +
                            '<h2>' + item.title + '</h2>' +
                            '<p>' + item.address.split(" ", 2)[0] + " " + item.address.split(" ", 2)[1] + '</p>' +
                            '</div></div>';
                        listElement.append(html);
                    });
                    
                    /* $.getScript("https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js");
                    $.getScript("${path}/resources/js/swiper.js"); */
                    
                    $.getScript("https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js", function() {
                    	
                        $.getScript("${path}/resources/js/swiper.js", function() {
                        	
                        });
                    });
                },
                error: function() {
                    console.error('데이터를 불러오지 못했습니다.');
                }
            });
        });
    </script>
	
	<%-- <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<script src="${path}/resources/js/swiper.js"></script> --%>
</body>
</html>