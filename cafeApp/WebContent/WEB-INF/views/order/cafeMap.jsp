<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<style>
	#map {
    margin: 0 auto;
}
</style>
</head>
<body>
    <div class="wrap">
        <header class="sticky"> <!-- // 고정 -->
            <div class="service">
                <a class="history" href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a>
                <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <a class="cart" href="${pageContext.request.contextPath}/cart/list"><i class="fab fa-opencart"></i></a>
            </div>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks®</a></h1>
            </div>
            <%-- <jsp:include page="../includes/navLink.jsp" /> --%>
        </header>
        <main>
            <div class="product">
                <div class="detail">
		            <div id="map" style="width:500px;height:400px;"></div>
	        	</div>
            </div>
        </main>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script>
        const scrollPosition = () => {
            const header = document.querySelector('header');
            let scroll = this.scrollY;
            let headheight = header.clientHeight;
            
            if(scroll > headheight) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        }

        window.addEventListener('load', scrollPosition);
        window.addEventListener('scroll', scrollPosition);
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82b1f8b85a0c6cf2fc18d7fccfbf4dd4"></script>
    <script>
    var container = document.getElementById('map');
    var map;
    var marker;
    
    function initMap(list) {
        var userPosition;
        // 위치 추적 시작
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var lat = position.coords.latitude;
                var lng = position.coords.longitude;

                userPosition = new kakao.maps.LatLng(lat, lng);
                var options = {
                    center: userPosition,
                    level: 3
                };

                // 지도를 생성하고 표시
                map = new kakao.maps.Map(container, options);

                // 이전 마커를 제거
                if (marker) {
                    marker.setMap(null);
                }
				console.log(list);
                // 새로운 마커를 생성
                marker = new kakao.maps.Marker({
                    position: userPosition
                });
             	
                /* $.ajax({
                	type: "GET",
                	url: "/cafe/choice",
                	data: {},
                	success: function(response){
                		var location = response["cafe"]["row"];
                		for(let i = 0; i < location.length; i++){
                			let lan = location[i][lan];
                			let lng = location[i][lng];
                			console.log(lan, lng);
                		};
                	};
                }) */
                
                /* $.getJSON("/cafe/choice", function(data){
                	var location = [];
                	$.each(data, function(lat, val){
                		location.push("<li id='" + lat + "'>" + val + "</li>");
                	});
                }); */
             	// 지도에 표시될 객체를 가지고 있을 배열입니다 
               /*  const locations = [
                    { place:"서울 구로구 구로중앙로 152", lat: 37.5011601442131, lng: 126.882773011925 },
                    { place:"서울 구로구 디지털로32길 30", lat: 37.4833895421043, lng: 126.896519918476 },
                    { place:"서울 금천구 벚꽃로 298", lat: 37.4814401689835, lng: 126.883871693415 },
                    { place:"서울 관악구 남부순환로 1419", lat: 37.4809747497557, lng: 126.908418046683 },
                    { place:"서울 구로구 가마산로 232", lat: 37.4937888506208, lng: 126.886762356034 },
                    { place:"서울 금천구 디지털로10길 9", lat: 37.4776190161713, lng: 126.88905533739 },
                    { place:"서울 금천구 벚꽃로 266", lat: 37.4784457675388, lng: 126.885080837326 },
                    { place:"서울 구로구 디지털로32길 30", lat: 37.4807624025755, lng: 126.880678781517 }
                ]; */
                const locations = list;
             
                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

                for (var i = 0; i < locations.length; i++) {
                	
                	var imageSize = new kakao.maps.Size(24, 35); 
                	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
                	
                    var cafeMarker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(locations[i].lat, locations[i].lng),
                        image : markerImage 
                    });
                    kakao.maps.event.addListener(cafeMarker, 'click', clickE(locations[i].cafeNo));
                    
                }
                function clickE(cafeNo) {
                    return function() {
                        //location.href = cafeNo;
                    	location.href = 'detail?cafeNo='+cafeNo;
                    };
                }
                /* for(let c of cafe){
                	
	                var content = '<div class="customoverlay">' +
	                '  <a href="detail?cafeNo=\${c.cafeNo}">' +
	                '    <span class="title">스타벅스</span>' +
	                '  </a>' +
	                '</div>';
                }
                
             	// 커스텀 오버레이가 표시될 위치입니다 
                var position = new kakao.maps.LatLng(37.54699, 127.09598);  

                // 커스텀 오버레이를 생성합니다
                var customOverlay = new kakao.maps.CustomOverlay({
                    map: map,
                    position: position,
                    content: content,
                    yAnchor: 1 
                }); */

                // 마커가 지도 위에 표시되도록 설정
                marker.setMap(map);
                
                // 스타벅스 매장 검색 및 마커 표시
                //searchStarbucks(userPosition);
            });
        } else {
            alert("위치 정보가 불러지지 않습니다.");
        }
    }
    
 	// 주소-좌표 변환 객체를 생성합니다 
    /* var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다 
    geocoder.addressSearch('서울 구로구 구로중앙로 152', function(result, status) {
    	
    	var apiKey = "U01TX0FVVEgyMDIzMDgxNzExMDczMTExNDAyNDU="; // 발급받은 juso API 키
        var url = "https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=1&countPerPage=100&keyword=스타벅스&resultType=json&confmKey=U01TX0FVVEgyMDIzMDgxNzExMDczMTExNDAyNDU=";

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });     */

    //function searchStarbucks(userPosition) {
    	
    	/* var currentPage = 1;
    	var countPerPage = 10;
    	var keyword = "스타벅스";
    	var confmKey = "U01TX0FVVEgyMDIzMDgxNzExMDczMTExNDAyNDU=";
    	var resultType = "json";
		
    	var apiUrl = "https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=" + currentPage
				+ "&countPerPage=" + countPerPage + "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&confmKey="
				+ confmKey + "&resultType=" + resultType;
    	console.log(url); */
    	
        //var apiKey = "U01TX0FVVEgyMDIzMDgxNzExMDczMTExNDAyNDU="; // 발급받은 juso API 키
        //var url = "https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=1&countPerPage=100&keyword=스타벅스&resultType=json&confmKey=U01TX0FVVEgyMDIzMDgxNzExMDczMTExNDAyNDU=";

        /* fetch(url)
            .then(response => response.json())
            .then(data => {
                var starbucksList = data.results.juso;

                // 반경 3km 이내의 스타벅스 매장 필터링 및 마커로 표시
                starbucksList.forEach(function (store) {
                    var storeLat = parseFloat(store.entX);
                    var storeLng = parseFloat(store.entY);
                    var storePosition = new kakao.maps.LatLng(storeLat, storeLng);
                    var distance = kakao.maps.geometry.getDistance(userPosition, storePosition);

                    if (distance <= 3000) {
                        var storeMarker = new kakao.maps.Marker({
                            position: storePosition,
                            map: map,
                            title: "스타벅스 매장"
                        });
                    }
                });
            })
            .catch(error => {
                console.error("주소 검색 에러:", error);
            });
    } */
	$.getJSON("/cafe/map/api/list").done(function(data) {
		//console.log(data);
		initMap(data);
	})
    
    
    
    
    
</script>
</body>
</html>