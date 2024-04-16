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
	.info .name, .menuScore, .menuReview, .price{
		color: black;
	    text-align: center;
	    font-size: large;
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
                <h1 class="logo">Starbucks® Store</h1>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
            
            <div class="product order">
            	<form>
		        	<input type="hidden" name="category" value="${pageDTO.cri.category}">
		        </form>
                <div class="filter">

                </div>
                <ul class="list row row-cols-2 row-cols-sm-3 row-cols-md-4">
                    <c:forEach items="${product}" var="p">
	                    <li>
	                        <a href="menu?proNo=${p.proNo}&${pageDTO.cri.qs}">
	                        	<%-- <c:if test="p.prCategory == 5"> --%>
		                        	<c:forEach items="${p.attachs}" var="a">
			                            <div class="thumb">
			                                <img src="https://semistarbucks.s3.ap-northeast-2.amazonaws.com/${a.prUuid}" />
			                            </div>
		                            </c:forEach>
	                            <%-- </c:if> --%>
	                            <div class="info">
	                                <p class="name">${p.proName}</p>
	                                <p class="menuScore"><i class="fas fa-star"></i>4.8</p>
	                                <p class="menuReview">  리뷰 10,345</p>
	                                <p class="price"><span>${p.proPrice}</span>원</p>
	                            </div>
	                        </a>
	                    </li>
                    </c:forEach>
                    
                </ul>
            </div>
            <c:if test="${member.admin}">
            <ul class="product-floating">
            	<li><a href="${pageContext.request.contextPath}/product/write" class="btn btn-success product-register"><i class="fas fa-pen-square"></i></a></li>
            	<li><a href="${pageContext.request.contextPath}/product/admin" class="btn btn-success product-admin mt-2"><i class="fas fa-cog"></i></a></li>
            </ul>
            </c:if>
        </main>
       <jsp:include page="../includes/footer.jsp" />
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script src="../../../js/app.js"></script>
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
</body>
</html>