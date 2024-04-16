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
                <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <a class="cart" href="basket"><i class="fab fa-opencart"></i></a>
            </div>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks® Store</a></h1>
                <p class="welcome"><span>Welcome!</span>온라인 스토어에 오신 것을 환영합니다.</p>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
            <ul class="tab">
            	<%-- <li><a href="${pageContext.request.contextPath}/product/list?category=0">베스트</a></li> --%>
            	<c:forEach items="${proCategories}" var="c" begin="0" end="3">
            		<li><a href="${pageContext.request.contextPath}/product/list?category=${c.pcNo}">${c.pcName}</a></li>
            	</c:forEach>
            </ul>
            <div class="product">
	            <form class="hidden">
		        	<input type="hidden" name="category" value="${pageDTO.cri.category}">
		   			<input type="hidden" name="amount" value="${pageDTO.cri.amount}">
		   			<input type="hidden" name="pageNum" value="${pageDTO.cri.pageNum}">
		        </form>
                <div class="filter">
                	
                </div>
                <ul class="list row row-cols-2 row-cols-sm-3 row-cols-md-4">
                	<c:forEach items="${list}" var="p">
	                	<%-- <c:if test="${pageDTO.cri.category == p.category}"> --%>
						<li>
	                        <a href="view?proNo=${p.proNo}&${pageDTO.cri.qs}">
	                        	<c:forEach items="${p.attachs}" var="a">
	                            <div class="thumb">
	                                <img src="${pageContext.request.contextPath}/upload/${a.prUuid}" />
	                            </div>
	                            </c:forEach>
	                            <div class="info">
	                                <p class="name">${p.proName}</p>
	                                <p class="score"><i class="fas fa-star"></i>${p.reviewScore == null ? '0' : p.reviewScore}</p>
	                                <p class="review">리뷰 ${p.reviewCount}</p>
	                                <p class="price"><span>${p.proPrice}</span>원</p>
	                            </div>
	                        </a>
	                    </li>	                	
	                	<%-- </c:if> --%>
                	</c:forEach>
                </ul>
            </div>
            <c:if test="${member.admin}">
            <ul class="product-floating">
            	<li><a href="${pageContext.request.contextPath}/product/write" class="btnb product-register"><i class="fas fa-pen-square"></i></a></li>
            	<li><a href="${pageContext.request.contextPath}/product/admin" class="btnb product-admin"><i class="fas fa-cog"></i></a></li>
            </ul>
            </c:if>
        </main>
        <jsp:include page="../includes/footer.jsp" />
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script>
    	const tab = document.querySelectorAll('.tab li');
    	const category = ${pageDTO.cri.category};
    	tab[category -1].classList.add('on');    	
    </script>
</body>
</html>