<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
</head>
<body>
    <div class="wrap">
        <header class="sticky"> <!-- // 고정 -->
            <div class="service">
                <a class="history" href="#"><i class="fas fa-chevron-left"></i></a>
                <!-- <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <a class="cart" href="#"><i class="fab fa-opencart"></i></a> -->
            </div>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks®</a></h1>
                <p class="welcome"><span>Welcome!</span>온라인 스토어에 오신 것을 환영합니다.</p>
            </div>
        </header>
        <main>
            <div class="sbComponent statement">
                
                <h3 class="title">결제하기</h3>
                <div class="items">
                    <h4>배송 정보 <!-- <button class="btnb">배송지 변경</button> --></h4>
                    <ul>
                        <li>
                            <p class="addr">${member.addr}</p>
                        </li>
                    </ul>
                    <h4>주문 내역</h4>
                    <ul class="cart-list">
                    	<c:forEach items="${cart}" var="d">
                        <li data-index="${d.cartNo}">
	                        <c:forEach items="${d.attachs}" var="a">
	                        	<img class="thumb" src="${pageContext.request.contextPath}/upload/${a.prUuid}" />
	                        </c:forEach>
	                        <div class="info">
	                            <p class="name"><span class="cart">${d.proName}</span> <span class="num">${d.proAmt}</span>개</p>
	                            <p class="stmt"><span class="cup">${d.cupSize}</span></p>
                        		<p class="price"><strong>${d.proPrice}</strong>원</p>
                        	</div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <ul class="receipt">
                    <li>
                        <p>
                            <span>쿠폰 및 선물</span>
                        </p>
                        <ul>
                            <li><span>쿠폰</span><span>없음</span></li>
                            <li><span>선물</span><span>없음</span></li>
                        </ul>
                    </li>
                    <li>
                        <p class="cashReceipt">
                            <span>현금영수증</span>
                            <span><i class="fas fa-chevron-right"></i></span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <span>주문 금액</span>
                            <span class="total">0원</span>
                        </p>
                        <ul>
                            <li><span>상품금액</span><span class="cost">0원</span></li>
                            <li><span>배송비</span><span class="shipping">(무료배송 혜택 적용) 0원</span></li>
                        </ul>
                    </li> 
                    <li>
                        <p>
                            <span>결제 금액</span>
                            <span class="total">0원</span>
                        </p>
                    </li> 
                    <li>
                        <p>
                            <span>최종 결제 금액</span>
                            <span class="total">0원</span>
                        </p>
                    </li>
                </ul>
                <div class="payment">
                    <div class="inner">
                        <a href="#" class="btnb" id="payment"><span class="total">0원</span>&nbsp; 결제하기</a>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../includes/footer.jsp" />
        <!-- modal -->
        <div class="modal fade paper" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">전자 영수증</h5>
                    </div>
                    <div class="modal-body">
                        <p class="title">
                        	<img src="${pageContext.request.contextPath}/img/kakao.png" alt="" />
                        	<img src="${pageContext.request.contextPath}/img/txt_starbucks.png" alt="" />
                        	<span>결제가 완료 되었습니다. 이용해 주셔서 감사합니다.</span>
                        </p>
                        <div class="sbComponent">
                            <ul class="receipt">
                                <li>
                                    <ul>
                                    	<c:forEach items="${cart}" var="p">
                                        <li><span>${p.proName} ${p.proAmt}개</span><span>${p.proPrice}원</span></li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li>
                                	<ul>
                                    	<li><span>배송비</span><span class="shipping">0원</span></li>
                                    </ul>
                                    <p>
                                        <span>결제 금액</span>
                                        <span class="total">160,000원</span>
                                    </p>
                                </li> 
                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                    	<form method="post" class="paymentForm">
                    		<input type="hidden" name="orderCode" value="">
                    		<button type="button" class="btn product-complete">확인</button>
                    	</form>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
    </div>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="${pageContext.request.contextPath}/js/menu.js"></script>
    <script src="${pageContext.request.contextPath}/js/payment.js"></script>
    <script>
    const today = new Date();
	const orderCode = 'IMP' + today.getHours() + today.getMinutes() + today.getSeconds() + today.getMilliseconds();
	
	let money = 0;
	$('.cart-list li').each(function(i, key) {
		let price = Number($(key).find('.price strong').text().replace(',', ''));
		let num = Number($(key).find('.num').text());
		money += (price * num);
	});
	
	$('.total, .cost').text(money.toLocaleString('ko-KR') + '원');
	if((money - 3000) < 30000) {
		$('.shipping').text('3,000원');
		$('.cost').text((money - 3000).toLocaleString('ko-KR') + '원');
	}
	
	const user = {
    	uid: orderCode,
    	name: '${member.id}',
    	phone: '${member.phone}',
    	addr: '${member.addr}',
  		email: '${member.email}',
  		money: money,
    };

	//kakaoPay(user);
    $('#payment').on('click', function(e) {
    	e.preventDefault();
    	kakaoPay(user);
    });
    
    $('.product-complete').on('click', function(e) {
    	e.preventDefault();
    	$('.cart-list li').each(function(i, key) {
    		const countPut = {
  				cartNo: $(key).data('index'),
  				proAmt: $(key).find('.num').text(),
  				cartStmt: 2,
      		}
				cartService.update(countPut);
    		
    		const data = {
    			orderCode: orderCode,
        		proName: $(key).find('.cart').text(),
        		proPrice: $(key).find('.price strong').text(),
        		proAmt: $(key).find('.num').text(),
        		cupSize: $(key).find('.cup').text(),
        		cartNo: $(key).data('index'),
    		};
    		
    		$.ajax({
				url: '/receipt/',
				type: 'post',
				data: JSON.stringify(data),
				contentType: 'application/json; charset=utf-8',
				success: function(data) {
					console.log(data);
				}
			});
    	});
    	$('.paymentForm').submit();
    });
    </script>
</body>
</html>