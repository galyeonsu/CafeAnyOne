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
    	<header class="sticky"> <!-- // 고정 -->
            <div class="service">
                <a class="history" href="list?category=${pageDTO.cri.category}"><i class="fas fa-chevron-left"></i></a>
                <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <a class="cart" href="basket"><i class="fab fa-opencart"></i></a>
            </div>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks® Store</a></h1>
            </div>
            <%-- <jsp:include page="../includes/navLink.jsp" /> --%>
        </header>
        <main>
            <div class="product">
            	<c:if test="${member.admin}">
            	<ul class="add">
            		<li><a class="add-modify" href="modify?proNo=${list.proNo}&${pageDTO.cri.qs}"><i class="fas fa-tools"></i></a></li>
            		<li><a class="add-remove" href="#"><i class="fas fa-trash-alt"></i></a></li>
            	</ul>
            	</c:if>
                <div class="detail">
                	<c:forEach items="${list.attachs}" var="a">
                    <div class="image">
                        <img src="${pageContext.request.contextPath}/upload/${a.prUuid}" />
                    </div>
                    </c:forEach>
                    <div class="info">
                        <h3 class="title">
                        <c:forEach items="${proCategories}" var="c">   					
							<c:if test="${c.pcNo == pageDTO.cri.category}">${c.pcName}</c:if>
						</c:forEach>
                        </h3>
                        <p class="name">${list.proName}</p>
                        <p class="desc">${list.proDetail}</p>
                        <p class="price mt-5"><span>${list.proPrice}</span>원</p>
                    </div>
                    <div class="payment">
                    	<form method="post">
                    		<div class="inner">
	                            <%-- <a href="/product/basket?proNo=${p.proNo}&${pageDTO.cri.qs}" class="btnb">구매하기</a> --%>
	                            <button class="btnb">장바구니 담기</button>
	                        </div>
                    		<input type="hidden" name="proNo" value="${list.proNo}">
                    		<input type="hidden" name="proName" value="${list.proName}">
	               			<input type="hidden" name="proPrice" value="${list.proPrice}">
	               			<input type="hidden" name="proSize" value="${list.proSize}">
	               			<input type="hidden" name="category" value="${pageDTO.cri.category}">
				   			<input type="hidden" name="amount" value="${pageDTO.cri.amount}">
				   			<input type="hidden" name="pageNum" value="${pageDTO.cri.pageNum}">
                    	</form>
                    </div>
                </div>
                <div class="replies">
                	<h3 class="replies-start">리뷰 <span class="replies-cnt"></span></h3>
                	<div class="replies-write">
                		<c:if test="${empty member}">
                		<div class="replies-input">
                			<button class="replies-login">리뷰를 작성하려면 로그인 해주세요.</button>
               			</div>
                		</c:if>
                		<c:if test="${not empty member}">
                		<form>
	                		<div class="replies-input">
								<textarea required name="rvContent" minlength="5" placeholder="리뷰를 작성해주세요." ></textarea>
	                		</div>
	                		<div class="replies-star">
						        <input type="radio" name="rvScore" id="rate-5" value="5">
						        <label for="rate-5" class="fas fa-star"></label>
						        <input type="radio" name="rvScore" id="rate-4" value="4">
						        <label for="rate-4" class="fas fa-star"></label>
						        <input type="radio" name="rvScore" id="rate-3" value="3">
						        <label for="rate-3" class="fas fa-star"></label>
						        <input type="radio" name="rvScore" id="rate-2" value="2">
						        <label for="rate-2" class="fas fa-star"></label>
						        <input type="radio" name="rvScore" id="rate-1" value="1" checked>
						        <label for="rate-1" class="fas fa-star"></label>
					        </div>
	               			<button class="btn-replies"><i class="bi bi-arrow-up-square"></i></button>
               			</form>
               			</c:if>
                	</div>
                	<ul class="replies-list"></ul>
                	<div id="observer"></div>
                </div>
                <div class="caution">
                    <!-- 배송 안내 -->
                    <dl>
                        <dt>배송 안내</dt>
                        <dd>· 배송비 3,000원 (배송 유형 별 결제금액 30,000원 이상 무료)</dd>
                        <dd>· 배송 소요 기간은 배송지 입력 후 2~5일(영업일 기준) 소요되며, 휴일 포함 여부 및 상품 재고상황, 택배사 사정에 의해 지연될 수 있습니다.</dd>
                        <dd>· 제주/도서산간 지역은 추가 운임이 발생할 수 있습니다.</dd>
                        <dd>· 자세한 내용은 이용조건 및 배송 안내를 확인해 주세요.</dd>
                    </dl>
                    <!-- 교환/반품/취소 규정 -->
                    <dl>
                        <dt>교환/반품/취소 규정</dt>
                        <dd>· 단순변심으로 인한 청약철회 시 상품도착 7일 이내에 구매자가 애플리케이션을 토해 신청 가능합니다.</dd>
                        <dd>· 온라인 스토어에서 판매된 모든 상품은 모바일 애플리케이션 상으로만 교환/반품 신청이 가능하며, 매장 방문을 통한 교환/반품은 불가합니다.</dd>
                        <dd>· 구매하신 상품에서 다른 상품으로의 교환은 불가하오니 주문 취소 또는 반품 후 재구매 하시기 바랍니다. (동일 금액의 다른 상품, 차액 지불 후 교환 불가)</dd>
                        <dd>· 다음에 해당하는 경우에는 주문이 취소되거나 승인되지 않을 수 있으니 유의하시기 바랍니다.</dd>
                    </dl>
                </div>
            </div>
        </main>
        <jsp:include page="../includes/footer.jsp" />
        <!-- modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                       	리뷰가 등록되었습니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-confirm" data-bs-dismiss="modal">확인</button>
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
    <script src="${pageContext.request.contextPath}/js/review.js"></script>
    <script>
	    const proNo = '${list.proNo}';
	    const id = '${member.id}';
	    moment.locale('ko');
		//getReviewList(1);
		
		console.log('${member.admin}')
		// get list
		function getReviewList(page) {
			reviewService.getList({proNo: proNo, page: page || 1}, function(reviewCnt, list) {
				if(page == -1) {
					pageNum = Math.ceil(reviewCnt/10.0);
					getReviewList(pageNum);
					return;
				}

				let str = '';
				
				if(list == null || list.length == 0) {
					str = `
						<li class="replies-empty">
							작성된 리뷰가 없습니다. 리뷰를 남겨 주세요.
						</li>
					`;
					
				} else {
					for(let i of list) {
						str += `
				    		<li data-no="\${i.rvNo}">
								<div class="replies-header">
									<p class="replies-writer"><strong>\${i.id}</strong></p>
									\${(id === i.id) ? '<button type="button" class="replies-more"><i class="far fa-trash-alt"></i></button>' : ''}
								</div>
								<p class="replies-content">\${i.rvContent}</p>
								<div class="replies-bottom">
									<p class="replies-date">\${moment(i.rvRegDate).format('L')}</p>
									<ul class="replies-steps step-\${i.rvScore}">
										<li class="fas fa-star"></li>
										<li class="fas fa-star"></li>
										<li class="fas fa-star"></li>
										<li class="fas fa-star"></li>
										<li class="fas fa-star"></li>
									</ul>
								</div>
							</li>
			    		`;
					}
				}
				document.querySelector('.replies-cnt').innerHTML = reviewCnt;
				$('.replies-list').append(str);
				
				if(document.querySelectorAll('.replies-list > li').length >= reviewCnt) {
					io.unobserve($observer);
					$observer.style.display = 'none';
					str = '';
					if(reviewCnt != 0) {
						str += `<li class="replies-empty">마지막 댓글입니다</li>`;
						$('.replies-list').append(str);
					}
				}
			});
		};

		// review paging
		let timer;
		let pageIndex = 0;
		const $observer = document.getElementById('observer');
		const io = new IntersectionObserver((entries) => {
				clearTimeout(timer);
				if(entries[0].isIntersecting) {
					timer = setTimeout(() => getReviewList(++pageIndex), 600);
				}
		});
		
		io.observe($observer);
		
		// submit
		$(document).on('click', '.btn-replies', function(e) {
			e.preventDefault();
   			
			const rvContent = document.querySelector('textarea[name="rvContent"]').value;
			const rvScore = document.querySelector('input[name="rvScore"]:checked').value;

			if(rvContent.length < 2) {
				$('.modal').modal('show').find('.modal-body').text('2글자 이상 작성해 주세요.');
				return false;
			} 

			const review = { rvContent, rvScore, id, proNo }
			pageIndex = 0;
			$('.replies-list').html('');
			io.observe($observer);
			$observer.style.display = 'block';
			const radio = document.querySelector('input[name="rvScore"]:checked');
			document.querySelector('textarea[name="rvContent"]').value = '';
			
			radio.checked = false;
			$('#rate-1').prop('checked', true);
			
			reviewService.add(review, function(result) {
				//getReviewList(-1);
			});	
		});
   		
		// tooltip open
		$(document).on('click', '.replies-more', function() {
			$(this).closest('li').find('.replies-tooltip').addClass('active');
			
		});
		
		// tooltip close
    	$(document).on('click', '.close', function() {
    		$('.replies-tooltip').removeClass('active');
    	});
		
		// remove
		$(document).on('click', '.add-remove', function(e) {
			e.preventDefault();
			if(!window.confirm('삭제 하시겠습니까?')) {
    			return;        			        			
    		} else {
    			if(document.querySelectorAll('.replies-list > li').length > 0) {
    				location.replace('remove?proNo=${list.proNo}&${pageDTO.cri.qs}');
    			} else {
    				$('.modal').modal('show').find('.modal-body').text('리뷰가 등록되어 있어 상품을 삭제할 수 없습니다.');
    			}
    		}			
		});
		
		// review delete
		$(document).on('click', '.replies-more', function() {
			if(!window.confirm('삭제 하시겠습니까?')) {
				return;
			} else {
				const rvNo = $(this).closest('li').data('no');

				pageIndex = 0;
				$('.replies-list').html('');
				io.observe($observer);
				$observer.style.display = 'block';
				reviewService.remove(rvNo, function(result) {

				});
			}
		});
		
		// review not member
		$(document).on('click', '.replies-login', function() {
			if(id == '' || id == null) {
				location.href = '/member/login?href=' + encodeURIComponent(location.href);
				return;
			}	
		});
    </script>
</body>
</html>