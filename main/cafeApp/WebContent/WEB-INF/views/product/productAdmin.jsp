<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>

<body>
    <div class="wrap">
        <header>
        	<div class="service">
                <!-- <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <a class="cart" href="basket"><i class="fab fa-opencart"></i></a> -->
            </div>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks® Store</a></h1>
                <p class="welcome"><span>상품 주문 관리</span><strong>${member.name}</strong>님 관리자 페이지입니다.</p>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
        	<ul class="tab">
            	<li class="on"><a href="#">전체</a></li>
            	<li><a href="#">진행중</a></li>
            	<li><a href="#">완료</a></li>
            </ul>
            <div class="admin">
            	<div class="table">
            		<div class="table-header"></div>
            		<div class="table-responsive">
						<div class="thead">
	           				<span class="border-gray-200">상태</span>
	           				<span class="border-gray-200">주문번호</span>
	           				<span class="border-gray-200">주문날짜</span>
	           				<span class="border-gray-200">주문자</span>
	           				<span class="border-gray-200">결제은행</span>
	           				<span class="border-gray-200">결제금액</span>
	           				<span class="border-gray-200">배송지</span>
	           			</div>
	           			<ul class="tbody"></ul>            		
            		</div>
           		</div>
            </div>
        </main>
        <jsp:include page="../includes/footer.jsp" />
        <!-- modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                	<div class="modal-header">
                        <h5 class="modal-title">전자 영수증</h5>
                    </div>
                    <div class="modal-body sbComponent">
                    	<img class="admin-kakao" src="${pageContext.request.contextPath}/img/txt_starbucks.png" alt="" />
                    	<ul class="receipt">
	                    	<li>
		                        <p>
		                            <span>구매내역</span>
		                        </p>
	                    		<ul class="receipt-body"></ul>
			            	</li>
			            	<li>
				                <p>
				                    <span>최종 결제 금액</span>
				                    <span class="buy"></span>
				                </p>
	                    	</li>
                    	</ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script>
		moment.locale('ko');
		$('.table-header').html(moment().format('LL') + ' (' + moment().format('dddd') + ')');

		$.getJSON('/payments/', function(data) {
			getOrderList(data);
		});
		
		const getOrderList = (data) => {
			let str = '';
			if(data == null || data.length == 0) {
				str = `
					<li>
                    	<p>주문 내역이 없습니다.</p>
                    </li>
				`;
			} else {
				for(let i of data) {
					/*  상태, 주문번호, 주문날짜, 주문자, 결제은행, 결제금액, 배송지 */
					str += `
						<li data-index="\${i.orderNo}" class="\${i.complete ? '' : 'onair'}">
							<span>
		                    	\${i.complete ? '<span class="badge text-bg-secondary">완료</span>' : '<button class="badge text-bg-success">진행중</button>'}
		                	</span>
		                    <span><a class="accordion" href="#">\${i.orderCode}</a></span>
		                    <span>\${moment(i.orderDate).format('L')}</span>
		                    <span>\${i.id}</span>
		                    <span>\${i.cardBank}</span>
		                    <span class="total">\${i.orderPrice}원</span>
		                    <span>\${i.address}</span>
		                </li>
					`;	
				}
			}
			
			$('.tbody').html(str);
		};
		
		$(document).on('click', '.tab li a', function(e) {
			e.preventDefault();
			const el = $(this).closest('li');
			const idx = el.index();
			el.addClass('on').siblings().removeClass('on');
			$('.tbody li').show();
			switch(idx) {
				case 1: $('.tbody li:not(.onair)').hide();
					break;
				case 2: $('.tbody li.onair').hide();
					break;
			}
		});
		
		$(document).on('click', '.accordion', function(e) {
			e.preventDefault();
			$('.receipt-body').html('');
			const orderCode = $(this).text();
			const total = Number($(this).closest('li').find('.total').text().replace('원', '')).toLocaleString('ko-KR');
			$('.modal-title').text('주문 번호: ' + orderCode);
			$('.buy').html(total + '원');
			$.getJSON('/receipt/' + orderCode, function(data) {
				let str = '';
				for(let i of data) {
					str += `
						<li><span>\${i.proName} \${i.cupSize} \${i.proAmt}개</span><span>\${i.proPrice}원</span></li>
					`;
				}
				$('.receipt-body').append(str);
			});
			$('.modal').modal('show');
		});
		
		$(document).on('click', 'button.badge', function() {
			if(!window.confirm('완료 처리 하시겠습니까?')) {
				return;
			} else {
				const completePut = {
					orderNo: $(this).closest('li').data('index'),
					complete: 1
				}
				$.ajax({
					type: 'put',
					url: '/payments/' + completePut.orderNo,
					data: JSON.stringify(completePut),
					contentType: 'application/json; charset=utf-8',
					success: function(result, status, xhr) {
						if (callback) {
							callback(result);
						}
					},
					error: function(error) {
						if (error) {
							error(err);
						}
					}
				});	
				$(this).closest('li').removeClass('onair');
				$(this).closest('span').empty().html('<span class="badge text-bg-secondary">완료</span>');
			}
		});
    </script>
</body>
</html>