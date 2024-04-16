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
                <a class="history" href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a>
            </div>
            <div class="static">
                <h1 class="logo">Starbucks® Store</h1>
                <p class="welcome"><span>Welcome!</span>온라인 스토어에 오신 것을 환영합니다.</p>
            </div>
        </header>
        <main>
            <div class="sbComponent statement">
                <h3 class="title">장바구니<!-- <button class="empty">전체삭제</button> --></h3>
                <ul class="basket"></ul>
                <ul class="receipt">
                    <li>
                        <ul>
                            <li><span>상품 금액</span><span class="fee">0원</span></li>
                            <li><span>할인 금액</span><span>0원</span></li>
                            <li><span>배송비</span><span class="shipping">3,000원</span></li>
                        </ul>
                    </li> 
                    <li>
                        <p>
                            <span>총 결제 예정 금액</span>
                            <span class="total">3,000원</span>
                        </p>
                    </li>
                </ul>

                <div class="payment">
                	<form method="post" class="orderForm">
                		<input type="hidden" name="orderCode" value="">
               			<input type="hidden" name="totalPrice" value="">
                		<div class="inner">
                        	<a href="${pageContext.request.contextPath}/order/payment" class="btnb payOrder">주문하기</a>
                    	</div>
                	</form>
                </div>
            </div>
            <div class="caution">
                <dl>
                    <dt>유의사항</dt>
                    <dd>· 장바구니에는 최대 20개까지 담을 수 있으며, 담긴 상품은 최대 2개월간 보관됩니다.</dd>
                    <dd>· 총 결제예정금액은 결제 단계에서 추가 할인 수단 적용으로 달라질 수 있습니다.</dd>
                    <dd>· 가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</dd>
                </dl>
            </div>
        </main>
        <jsp:include page="../includes/footer.jsp" />
        <!-- modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        상품 구매를 하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary">확인</button>
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
    <script>
	    const pageDTO = '${pageDTO.cri.qs}';
	
		getCartList(1);
		
	    function getCartList(page) {
	    	cartService.getCart(page || 1, function(list) {
	    		let str = '';
	    		
	    		if(list == null || list.length == 0) {
	    			str = `
	    				<li class="basket-empty">
	    					장바구니가 비워있습니다.
	    				</li>
	    			`;
	    		} else {
	    			for(let i of list) {
	    				str += `
	    					<li data-index="\${i.cartNo}">
		                        <div class="form-check">
		                            <input class="form-check-input" type="checkbox" id="flexCheckDefault_\${i}">
		                        </div>
		                        <img class="thumb" src="https://semistarbucks.s3.ap-northeast-2.amazonaws.com/\${i.attachs[0].prUuid}" />
		                        <div class="option">
		                            <p class="name"><a href="/order/menu?proNo=\${i.proNo}&\${pageDTO}">\${i.proName}</a></p>
		                            <p class="etc">\${i.cupSize}</p>
		                            <div class="price">
		                                <div class="count">
		                                    <i class="bi bi-dash-circle minus"></i>
		                                    <span>\${i.proAmt}</span>
		                                    <i class="bi bi-plus-circle plus"></i>
		                                </div>
		                                <strong><span>\${i.proPrice}</span>원</strong>
		                            </div>
		                        </div>
		                        <button class="btn_remove"><i class="bi bi-x-square"></i></button>
		                    </li>
	    				`;
	    			}
	    		}
	    		$('.basket').append(str);
	    		menuCart();
	    		
	    		$('.basket li').each(function(i, key) {
        			let no = list[i].cartNo + '';
        			let stmt = list[i].cartStmt;
        			if(no.indexOf($(key).data('index')) != -1 && stmt == 1) {
        				$(key).find('.form-check-input').click();
        			}
        		});
	    	});
	    	
	    	// 삭제
	    	$(document).on('click', '.btn_remove', function() {
	    		const el = $(this).closest('li');
	    		const idx = el.data('index');
	    		if(!window.confirm('삭제 하시겠습니까?')) {
	    			return;        			        			
	    		} else {
					const removeIndex = { cartNo: idx };
	        		
	        		cartService.remove(removeIndex, function(result) {
	        			el.remove();
	        		});
	    		}
	    	});
	    	const menuCart = () => {
	    		
		    	// 수량
		    	$(document).on('click', '.count i', function() {
		    		if($(this).closest('li').find('.form-check-input').is(':checked')) {
		    			$('.modal').modal('show').find('.modal-body').text('상품 선택 해제 후에 수량을 변경해 주세요.');
						return false;
		    		}
		    		const minus = $(this).hasClass('minus');
		    		let volume = Number($(this).siblings('span').text());
		    		(minus) ? (volume <= 1) ? 1 : volume-- : volume++;
		    		$(this).siblings('span').text(volume);
		    		const countPut = {
		   				cartNo: $(this).closest('li').data('index') || 1,
		   				proAmt: volume,
           				cartStmt: 0
		    		}
					cartService.update(countPut);      		
		    	});
		    	
		    	// 계산
		    	let sum = 0;
		    	$(document).on('change', '.form-check input', function() {
		    		const $this = $(this);
		    		const cost = Number($this.closest('li').find('.count').next().children('span').text().replace(/[^0-9]/g, ''));
		    		const amount = Number($this.closest('li').find('.count span').text());
		    		let item = cost * amount;
		    		let select = $this.is(':checked');
		    		(select) ? sum += item : sum -= item;
		    		
		    		let total = (sum < 30000) ? sum + 3000 : sum;
		    		let ship = (sum < 30000) ? '3,000원' : '(무료배송 혜택 적용) 0원'; 
		    		$('.shipping').html(ship);
		    		$('.fee').html(sum.toLocaleString('ko-KR') + '원');
		    		$('.total').html(total.toLocaleString('ko-KR') + '원');
		    		let buy = $('.form-check input:checked').length;
            		(buy > 0) ? $('.payment .btnb').attr('disabled', false) : $('.payment .btnb').attr('disabled', true);
            		$('.buy').text(buy);
            		const countPut = {
           				cartNo: $(this).closest('li').data('index'),
           				proAmt: $(this).closest('li').find('.count span').text() || 1,
           				cartStmt: (select) ? 1 : 0
               		}
       				cartService.update(countPut);
		    	});
	    	}
	    	
	    	$(document).on('click', '.payOrder', function(e) {
        		if(!window.confirm('주문을 진행하시겠습니까?')) {
        			return;        			        			
        		} else {
        			e.preventDefault();
        			$('.orderForm').submit();
        		}
        	});
	    }
        
    </script>
</body>
</html>