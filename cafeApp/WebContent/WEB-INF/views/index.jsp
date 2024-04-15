<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<script>

</script>
</head>
<body>
    <div class="wrap">
        <header>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks®</a></h1>
                <c:if test="${empty member}">
	                <p class="welcome">안녕하세요.<span>스타벅스입니다.</span></p>
                </c:if>
                <c:if test="${not empty member}">
                	<p class="welcome">환영합니다. <span class = nic>${member.id}(${member.name})님<a class="logout" href="${pageContext.request.contextPath}/member/logout"><i class="fas fa-sign-out-alt"></i></a></span></p>
                </c:if>
            </div>
            <jsp:include page="includes/navLink.jsp" />
            <c:if test="${not empty member}">
            	<div class="reward">
	                <div class="reward-remain">
	                    <p><span>27</span><i class="fas fa-star"></i> until Gold Level</p>
	                    <div class="reward-remain-step">
	                        <span style="width: 10%;"></span> <!-- n/30 * 100 -->
	                    </div>
	                </div>
	                <div class="reward-count">
	                    <span>3</span>/ 30<i class="fas fa-star"></i>
	                </div>
	            </div>
       		</c:if>
       		<c:if test="${empty member}">
	       		<div class="benefit">
	                <p>스타벅스 리워드 회원 신규가입 첫 구매시,<br/>무료 음료 혜택을 드려요!</p>
	                <a href="${pageContext.request.contextPath}/member/signup">회원가입</a>
	                <a href="${pageContext.request.contextPath}/member/login">로그인</a>
                </div>
       		</c:if>          	
        </header>
        <main>
        <aside>
        	
        </aside>
            <!-- foryou -->
            <div class="swiper foryou">
                <h3 class="swiper-title">For you</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="${pageContext.request.contextPath}/img/foryou_1.png" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="${pageContext.request.contextPath}/img/foryou_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="${pageContext.request.contextPath}/img/foryou_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="${pageContext.request.contextPath}/img/foryou_4.jpg" alt="" /></a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // foryou -->
            <!-- best-items -->
            <div class="swiper best-items">
                <h3 class="swiper-title">Best Items</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/product/list?category=1"><img src="${pageContext.request.contextPath}/img/item_1.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/product/list?category=2"><img src="${pageContext.request.contextPath}/img/item_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/product/list?category=3"><img src="${pageContext.request.contextPath}/img/item_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/product/list?category=4"><img src="${pageContext.request.contextPath}/img/item_4.jpg" alt="" /></a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // best-items -->
            <!-- promotion -->
            <div class="swiper promotion">
                <h3 class="swiper-title">Promotion</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=138&category=2">
                            <img src="${pageContext.request.contextPath}/img/promotion_1.jpg" alt="" />
                            <span>사이렌 트렌타 콜드컵 출시 이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=137&category=2">
                            <img src="${pageContext.request.contextPath}/img/promotion_2.jpg" alt="" />
                            <span>스타벅스 매장에서 디즈니를 만나는 즐거운 여행</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=139&category=2">
                            <img src="${pageContext.request.contextPath}/img/promotion_3.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=136&category=2">
                            <img src="${pageContext.request.contextPath}/img/promotion_4.jpg" alt="" />
                            <span>가을맞이 딜리버스 배달비 프로모션</span>
                        </a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // promotion -->
            <!-- news -->
            <div class="swiper news">
                <h3 class="swiper-title">News</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=143&category=2"><img src="${pageContext.request.contextPath}/img/news_1.png" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=142&category=2"><img src="${pageContext.request.contextPath}/img/news_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=141&category=2"><img src="${pageContext.request.contextPath}/img/news_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/board/view?bno=140&category=2"><img src="${pageContext.request.contextPath}/img/news_4.jpg" alt="" /></a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // news -->
            <!-- banner -->
            <ul class="banner">
                <li><a href="${pageContext.request.contextPath}/product/list?category=1"><img src="${pageContext.request.contextPath}/img/banner_1.png" alt="" /></a></li>
                <li><a href="${pageContext.request.contextPath}/board/view?bno=144&category=2"><img src="${pageContext.request.contextPath}/img/banner_2.jpg" alt="" /></a></li>
                <li><a href="${pageContext.request.contextPath}/product/list?category=1"><img src="${pageContext.request.contextPath}/img/banner_3.jpg" alt="" /></a></li>
                <li><a href="${pageContext.request.contextPath}/board/view?bno=135&category=2"><img src="${pageContext.request.contextPath}/img/banner_4.jpg" alt="" /></a></li>
            </ul>
            <!-- // banner -->
        </main>
        <c:if test="${empty member}">
        <div class="loading">
            <p>Coffee, Anyone?</p>
        </div>
        </c:if>
        <jsp:include page="includes/footer.jsp" />
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script>
    	try {
    		document.querySelector('.loading').classList.add('success');	
    	} catch(e) {}
        
        let swiper = [];
        const buildSwiperSlider = () => {
            const allSliders = document.querySelectorAll('.swiper');
            let width = window.innerWidth;

            allSliders.forEach((slider, i) => {
                if (width <= 896 && swiper[i] == undefined) {
                    swiper[i] = new Swiper(slider, {
                        centeredSlides: true,
                        slidesPerView: 'auto',
                        loop: true,
                        observer: true,
                        observeParents: true,
                        pagination: {
                            el: '.swiper-pagination',
                        },
                    });
                } else if (width > 896 && swiper[i] != undefined) {
                    swiper[i].destroy();
                    if (swiper[i].destroyed) swiper[i] = undefined;
                }
            });
        }

        window.addEventListener('load', buildSwiperSlider);
        window.addEventListener('resize', buildSwiperSlider);
    </script>
</body>
</html>