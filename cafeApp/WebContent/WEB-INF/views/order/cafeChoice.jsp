<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            
            <div class="product order">
                <div class="filter">

                </div>
                <ul class="list row row-cols-2 row-cols-sm-3 row-cols-md-4">
                	<c:forEach items="${cafe}" var="f">
	                    <li>
	                        <a href="detail?cafeNo=${f.cafeNo}">
		                        <c:forEach items="${f.cfAttachs}" var="a">
		                            <div class="thumb">
		                                <img class="cafe" src="${pageContext.request.contextPath}/upload/${a.cfUuid}" />
		                            </div>
	                           </c:forEach>
	                           <div class="info">
	                                <p class="name">${f.cafeAddr}</p>
	                                <p class="cafeNum">${f.cafeTell}</p>
	                           </div>
	                        </a>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="map">
            	<a href="${pageContext.request.contextPath}/cafe/map" class="btnb product-register">Map</a>
            </div>
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