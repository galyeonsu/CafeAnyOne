<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}/"><i class="bi bi-house-door-fill"></i>Home</a></li>
        <li><a href="${pageContext.request.contextPath}/board/list"><i class="fas fa-newspaper"></i>News</a></li>
        <li><a href="${pageContext.request.contextPath}/order/main?category=5"><i class="fas fa-coffee"></i>Order</a></li>
        <li><a href="${pageContext.request.contextPath}/product/list?category=1"><i class="fas fa-store"></i>Shop</a></li>
        <li><a href="${pageContext.request.contextPath}/member/myPage"><i class="fas fa-user"></i>My</a></li>
    </ul>
</nav>