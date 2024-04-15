<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
    <link rel="stylesheet" href="../../../css/app.css">
</head>

<body>
    <div class="wrap">
        <header>
            <div class="static">
                <h1 class="logo">Starbucks®</h1>
                <p class="welcome">Good Morning, <span>Nickname</span></p> <!-- 시간별 인사말 -->
            </div>
            <nav>
                <ul>
                    <li class="on"><a href="#"><i class="bi bi-house-door-fill"></i>Home</a></li>
                    <li><a href="#"><i class="fas fa-wallet"></i>Pay</a></li>
                    <li><a href="#"><i class="fas fa-coffee"></i>Order</a></li>
                    <li><a href="./shop.html"><i class="fas fa-store"></i>Shop</a></li>
                    <li><a href="#"><i class="fas fa-user"></i>Other</a></li>
                </ul>
            </nav>
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
        </header>
        <main>
            <!-- foryou -->
            <div class="swiper foryou">
                <h3 class="swiper-title">For you</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="img/foryou_1.png" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="img/foryou_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="img/foryou_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${pageContext.request.contextPath}/order/main?category=5"><img src="img/foryou_4.jpg" alt="" /></a>
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
                        <a href="#"><img src="img/item_1.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/item_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/item_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/item_4.jpg" alt="" /></a>
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
                        <a href="#">
                            <img src="img/promotion_1.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img src="img/promotion_2.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img src="img/promotion_3.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트이벤트이벤트이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img src="img/promotion_4.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트이벤트이벤트이벤트</span>
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
                        <a href="#"><img src="img/news_1.png" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/news_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/news_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/news_4.jpg" alt="" /></a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // news -->
            <!-- banner -->
            <ul class="banner">
                <li><a href="#"><img src="img/banner_1.png" alt="" /></a></li>
                <li><a href="#"><img src="img/banner_2.jpg" alt="" /></a></li>
                <li><a href="#"><img src="img/banner_3.jpg" alt="" /></a></li>
                <li><a href="#"><img src="img/banner_4.jpg" alt="" /></a></li>
            </ul>
            <!-- // banner -->
        </main>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script>
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

        const scrollPosition = () => {
            const header = document.querySelector('header');
            let scroll = this.scrollY;
            let headheight = header.clientHeight;

            if (scroll > headheight) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        }

        window.addEventListener('load', scrollPosition);
        window.addEventListener('scroll', scrollPosition);
    </script>
</body>

</html>