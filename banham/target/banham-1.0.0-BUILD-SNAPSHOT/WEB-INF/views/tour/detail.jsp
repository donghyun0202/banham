<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반함</title>
	<link href="${Path}/resources/css/detail.css" rel="stylesheet"/>
	
	 <!-- bxslider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ac5b29c614c81c7a85e9677731582c8"></script>
    
	<style>
		.customoverlay {position:relative;bottom:60px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
		.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
		.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	</style>
</head>
<body>
	<!-- 공통 TOP 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/top.jsp"/>

	<div class="section">
        <div class="titleWrap">
            <h1>${detailDTO.title}</h1>
            <p>${detailDTO.address}</p>
        </div>
        <div class="imgSlider">
        
        </div>
        <div class="overviewWrap">
            <h2>상세설명</h2>
        </div>
        <p class="overview" Style="max-height: 500px;overflow: auto;"> ${detailDTO.overview}</p>
        
        <div class="overviewWrap">
            <h2>상세지도</h2>
        </div>
        
		<div style="display: flex; justify-content: center; align-items: center;">
        	<div id="map" style="width: 950px; height: 500px; margin: 20px;"></div>
        </div>
        
        <div class="overviewWrap">
            <h2>반려동물 안전수칙</h2>
        </div>
        <p class="overview" id="detailpet">
        	${detailPetDTO.petTursmInfo}		<br>
        	${detailPetDTO.relaAcdntRiskMtr}	<br>
        	${detailPetDTO.acmpyTypeCd}			<br>
        	${detailPetDTO.relaPosesFclty}		<br>
        	${detailPetDTO.relaFrnshPrdlst}		<br>
        	${detailPetDTO.etcAcmpyInfo}		<br>
        	${detailPetDTO.relaPurcPrdlst}		<br>
        	${detailPetDTO.acmpyPsblCpam}		<br>
        	${detailPetDTO.relaRntlPrdlst}		<br>
        	${detailPetDTO.acmpyNeedMtr}
        </p>
     </div>
     
       <!-- 공통 footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
     
     <script>
        $(document).ready(function(){
            $(".imgSlider").bxSlider();
            slider.find("img").css("width", "100%");
        });
    </script>
     
     <!-- 이미지 로드 -->
     <script type="text/javascript">
        $(document).ready(function() {
           var imageCID = ${detailCID};
            var listElement = $('.imgSlider');
            listElement.empty();
            
            if("${detailDTO.image1}"!="") {
            var iamge1 = '<img src="${detailDTO.image1}" alt="">';
            listElement.append(iamge1);
            }
            
         $.ajax({
                url: '/getdetail_image',
                type: 'POST',
                data: {
                   imageCID: imageCID
               },
                success: function(response) {
                    $.each(response, function(index, item) {
                  var html = '<img src="' + item.imageAddress + '" alt="">';
                  listElement.append(html);
                    });
                },
                error: function() {
                    console.error('데이터를 불러오지 못했습니다.');
                }
            });
        });
    </script>

	<!-- 지도 로드 -->
	<script type="text/javascript">
	
	    var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    mapOption = { 
	        center: new kakao.maps.LatLng(${detailDTO.mapY}, ${detailDTO.mapX}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    }; 
	    
	    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    
		// 지도에 마커를 표시합니다 
	    var marker = new kakao.maps.Marker({
	        map: map, 
	        position: new kakao.maps.LatLng(${detailDTO.mapY}, ${detailDTO.mapX})
	    });
	    
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		marker.setMap(map);
		
		// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var content = '<div class="customoverlay">' +
		    /* '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' + */
		    '  <a href="https://map.kakao.com/link/map/${detailDTO.title},${detailDTO.mapY},${detailDTO.mapX}" target="_blank">' +
		    
		    '    <span class="title">${detailDTO.title}</span>' +
		    '  </a>' +
		    '</div>';

		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(${detailDTO.mapY}, ${detailDTO.mapX});  

		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 1 
		});
		
	</script>
    
</body>
	<!-- swiper width 크기 조절 -->
	<style>
     	 .swiper {
     	 	margin-top: 30px;
            width: 1000px;
        }
     </style>
</html>