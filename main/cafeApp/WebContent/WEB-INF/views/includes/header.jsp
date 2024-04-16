<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
    <div class="static">
        <h1 class="logo">Starbucks® Store</h1>
        <p class="welcome"><span>Welcome!</span>온라인 스토어에 오신 것을 환영합니다.</p>
    </div>
    <nav>
        <ul>
            <li class="on"><a href="${pageContext.request.contextPath}/"><i class="bi bi-house-door-fill"></i>Home</a></li>
            <li><a href="#"><i class="fas fa-newspaper"></i>News</a></li>
            <li><a href="#"><i class="fas fa-coffee"></i>Order</a></li>
            <li><a href="${pageContext.request.contextPath}/product/list"><i class="fas fa-store"></i>Shop</a></li>
            <li><a href="#"><i class="fas fa-user"></i>My</a></li>
        </ul>
    </nav>
</header>
