<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반함</title>
	<!--  home.css가 아닌 search.css 하나 만들어야됨. -->
	<link href="${Path}/resources/css/tour/search.css" rel="stylesheet"/>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div id="search">
	    <div class="searchWrap">
			<div class="searchMenu">
	            <div class="item">
	            	<select id = "search_contenttypeid">
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
				</div>
	            <div class="item">
	            	<select id = "search_area">
						<option value="0">지역명</option>
					</select>
				</div>
	            <div class="item">
	            	<select id = "search_sigungu">
	            		<option value="0">상세지역</option>
					</select>
				</div>
	            <input class="item" id="search_text" type="text" placeholder="필요 시, 검색어를 입력하세요.">
	            
	            <input class="item" type="submit" id="search_button" value="검색하기">
	        </div>
	    </div>
	</div>
	
	<script type="text/javascript">
        $(document).ready(function() {
            var listElement = $('#search_area');

            function updateData() {
                $.ajax({
                    url: '/getsearch_area',
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        listElement.empty();
                        $.each(data, function(index, item) {
                        	var html = '<option value = "' + item.areaCode + '">' +
                        	item.areaName + '</option>';
                        	 listElement.append(html);
                        });
                    },
                    error: function() {
                        console.error('데이터를 불러오지 못했습니다.');
                    }
                });
            }
            
            $('#search_area').change(function() {
    	        var selectedValue = $(this).val();
    	        var listElement = $('#search_sigungu');
    	        
    	        $.ajax({
    	            url: '/getsearch_sigungu',
    	            type: 'POST',
    	            data: {
    	                selectedValue: selectedValue
    	            },
    	            dataType: 'json',
    	            success: function(response) {
    	            	console.log(response);
    	                listElement.empty();
                        $.each(response, function(index, item) {
                        	var html = '<option value = "' + item.sigunguCode + '">' +
                        	item.sigunguName + '</option>';
                        	 listElement.append(html);
                        });
    	            },
    	            error: function() {
    	                console.error('데이터를 전송하지 못했습니다.');
    	            }
    	        });
    	    });
            
            $('#search_button').click(function() {
            	var listElement = $('#swiper-wrapper');
                var contenttypeid = $('#search_contenttypeid').val();
                var areaCode = $('#search_area').val();
                var sigunguCode = $('#search_sigungu').val();
                var searchText = $('#search_text').val();
                
                $.ajax({
                    url: '/getsearch',
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        listElement.empty();
                        //console.log(response);
                        $.each(response, function(index, item) {
                        	if (
                                (contenttypeid == 0 || contenttypeid == item.contentTypeId) &&
                                (areaCode == 0 || areaCode == item.areaCode) &&
                                (sigunguCode == 0 || sigunguCode == item.sigunguCode) &&
                                item.title.includes(searchText)
                            ) {
                                var imageSrc = item.image1 ? item.image1 : '${Path}/resources/images/dog/dog2.jpg';
                                var html = '<div class="swiper-slide">' +
                                	'<a href="detail?data=' + item.contentId + '">' +
                                    '<img src="' + imageSrc + '" alt="">' +
                                    '<div class="swiper-text-Wrap">' +
                                    '<h2>' + item.title + '</h2>' +
                                    '<p>' + item.address.split(" ", 2)[0] + " " + item.address.split(" ", 2)[1] + '</p>' +
                                    '</div></a></div>';
                                listElement.append(html);
                            }
                        });
                        
                        $.getScript("https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js", function() {
                            $.getScript("${path}/resources/js/swiper.js", function() {
                            });
                        });
                    },
                    error: function() {
                        console.error('데이터를 전송하지 못했습니다.');
                    }
                });
            });
            
            updateData();
        });
    </script>
</body>
</html>