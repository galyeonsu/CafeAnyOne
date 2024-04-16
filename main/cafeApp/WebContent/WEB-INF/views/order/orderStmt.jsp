<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<style>
    
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
                    <!-- <button><i class="bi bi-search"></i></button> -->
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
	            <c:if test="${member.admin}">
	            <ul class="add">
            		<li><a class="add-modify" href="${pageContext.request.contextPath}/product/modify?proNo=${product.proNo}&${pageDTO.cri.qs}"><i class="fas fa-tools"></i></a></li>
            		<%-- <li><a class="add-remove" href=""><i class="fas fa-trash-alt"></i></a></li> --%>
            		<li><a class="add-remove" href="#"><i class="fas fa-trash-alt"></i></a></li>
            	</ul>
            	</c:if>
	                <div class="detail">
	                	<c:forEach items="${product.attachs}" var="p">
		                    <div class="image">
		                        <img src="${pageContext.request.contextPath}/upload/${p.prUuid}" />
		                    </div>
		                </c:forEach>
	                    <p class="name mt-5">${product.proName}</p>
	                    <p class="score"><i class="fas fa-star"></i>4.8</p>
	                    <p class="review">리뷰 10,345</p>
	                    <p class="price"><span>${product.proPrice}</span>원</p>
	                </div>
	            </div>
            	<form method="post">
            	<input type="hidden" name="proName" value="${product.proName}">
            	<input type="hidden" name="proPrice" value="${product.proPrice}">
	            <div class="btn-group btn-group-lg d-flex justify-content-center btn-group-toggle mt-5" data-toggle="buttons">
	                <label class="btn btn-outline-primary btnhotice" for="option1">
	                    <input type="radio" class="btn-check" name="stmt" id="option1" value="HOT">HOT</label>
	                <label class="btn btn-outline-primary btnhotice" for="option2">
	                    <input type="radio" class="btn-check" name="stmt" id="option2" value="ICE">ICE</label>
	            </div>
	            <h1 class="cupsize mt-5">사이즈</h1>
	            <div class="btn-group btn-group-lg d-flex justify-content-center btn-group-toggle mt-5" data-toggle="buttons">
	                <label class="btn btn-outline-primary btnsize" for="option2">
	                    <input type="radio" class="btn-check" name="cupSize" id="option2" value="Tall" checked><img class="click-img" src="../img/tallsize.jpg" /></label>
	                <label class="btn btn-outline-primary btnsize" for="option3">
	                    <input type="radio" class="btn-check" name="cupSize" id="option3" value="Grande"><img class="click-img" src="../img/grande.jpg" /></label>
	                <label class="btn btn-outline-primary btnsize" for="option4">
	                    <input type="radio" class="btn-check" name="cupSize" id="option4" value="Venti"><img class="click-img" src="../img/venti.jpg" /></label>
	            </div>
	            <h1 class="cupChoice mt-5">컵 선택</h1>
	            <div class="btn-group btn-group-lg d-flex justify-content-center btn-group-toggle mt-5" data-toggle="buttons">
	                <label class="btn btn-outline-primary btncup" for="option5">
	                    <input type="radio" class="btn-check" name="cupChoice" id="option5" value="0">매장 컵</label>
	                <label class="btn btn-outline-primary btncup" for="option6">
	                    <input type="radio" class="btn-check" name="cupChoice" id="option6" value="1">개인 컵</label>
	                <label class="btn btn-outline-primary btncup" for="option7">
	                    <input type="radio" class="btn-check" name="cupChoice" id="option7" value="2">일회용 컵</label>
	            </div>
	            <div class="btn-group btn-group-lg d-flex justify-content-center btn-group-toggle mt-5" data-toggle="buttons">
	                <label class="btn btn-outline-primary delivery" for="option8">
	                    <input type="radio" class="btn-check" name="cartcate" id="option8" value="1">직접 수령</label>
	                <label class="btn btn-outline-primary delivery" for="option9">
	                    <input type="radio" class="btn-check" name="cartcate" id="option9" value="2">배달</label>
	            </div>
	            <!-- <p><span class="reply-write-cnt mt-5">1수량 적용 전</span></p> -->
	            <div class="d-grid gap-2 mt-5">
	                <%-- <a href="${pageContext.request.contextPath}/cafe/choice" class="btno btn-primary mt-5">주문하기</a> --%>
	                <button class="btno btn-primary" >장바구니에 담기</button>
	            </div>
	        </form>
            
        </main>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script>
      
        // $(".click-img").on('click', function(e){
        //     $(e.target).css({'border':'1px solid blue'});
        // });

        // let selectedSize = null;
        
        // $(".click-img").on('click', function(e) {
        //     if (selectedSize) {
        //         selectedSize.css({'border': 'none'}); // 이전 선택 이미지의 테두리 제거
        //     }
        //     selectedSize = $(e.target); // 현재 선택 이미지로 설정
        //     selectedSize.css({'border': '1px solid blue'}); // 테두리 색상 변경
        // });

        $(function() {
            $('.btnsize').on('click', function() {
                $('.btnsize').removeClass('active'); // 모든 버튼에서 'active' 클래스 제거
                $(this).addClass('active'); // 현재 클릭된 버튼에 'active' 클래스 추가
            });

            $('.btnhotice').on('click', function() {
                $('.btnhotice').removeClass('active'); // 모든 버튼에서 'active' 클래스 제거
                $(this).addClass('active'); // 현재 클릭된 버튼에 'active' 클래스 추가
            });

            $('.btncup').on('click', function() {
                $('.btncup').removeClass('active'); // 모든 버튼에서 'active' 클래스 제거
                $(this).addClass('active'); // 현재 클릭된 버튼에 'active' 클래스 추가
            });
            
            $('.delivery').on('click', function() {
                $('.delivery').removeClass('active'); // 모든 버튼에서 'active' 클래스 제거
                $(this).addClass('active'); // 현재 클릭된 버튼에 'active' 클래스 추가
            });
        });
        
        
        
    </script>
</body>
</html>