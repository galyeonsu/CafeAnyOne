<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardlist.css">
</head>
<body>
    <div class="wrap">
        <header>
            <div class="service">
                <form class="search" id="searchForm">
                    <input type="hidden" name="category" value="${pageDto.cri.category}">
                    <input type="hidden" name="amount" value="${pageDto.cri.amount}">
                    <input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}">
	                <div class="form-check-inline">
		                <label class="form-check-label">
			            	<input type="checkbox" class="form-check-input" name="type" value="T" ${fn:contains(pageDto.cri.type, 'T') ? 'checked' : ''}>제목
		                </label>
	                </div>
	                <div class="form-check-inline">
		                <label class="form-check-label">
		                    <input type="checkbox" class="form-check-input" name="type" value="C" ${fn:contains(pageDto.cri.type, 'C') ? 'checked' : ''}>내용
		                </label>
	                </div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" value="${pageDto.cri.keyword}"/>
                    <button><i class="bi bi-search" type="submit"></i></button>
                </form>
            </div>
            <div class="static">
                <h1 class="logo">Starbucks® Store</h1>
                <p class="welcome"><span>What's New</span>스타벅스 게시판입니다.</p>
            </div>
			<jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
            <ul class="tab">
            	<c:forEach items="${categories}" var="c">
            	<li class="${c.cno == pageDto.cri.category ? 'on' : ''}"><a href="${pageContext.request.contextPath}/board/list?category=${c.cno}">${c.cname}</a></li>
            	</c:forEach>
            </ul>
            <div class="btn-area">
			<c:choose>
				<c:when test="${pageDto.cri.category == 4}">
					<a class="btnb" id="boardWrite" href="write?category=${pageDto.cri.category}">작성</a>
				</c:when>
				<c:otherwise>
					<c:if test="${member.admin}">
						<a class="btnb" href="write?category=${pageDto.cri.category}">작성</a>
					</c:if>
				</c:otherwise>
			</c:choose>
            </div>
            <div class="board">
                <ul class="list list-group list-group-flush">
                <c:forEach items="${list}" var="b">
                	<li class="list-group-item">
                        <a href="view?bno=${b.bno}&${pageDto.cri.qs}">
	                        <c:if test="${not empty b.attach }"> 
	                        <div class="thumb-box">
	                        	<img class="thumb" src="${pageContext.request.contextPath}/display?${b.attach.qs}">
	                        </div>
	                        </c:if> 
                            <div class="info-box">
	                            <div class="info">
	                                <p class="title text-break">${b.title}
	                                	<c:if test="${pageDto.cri.category == 1 || pageDto.cri.category == 4}"> [${b.replyCnt}]</c:if>
	                                </p>
	                                <p class="regdate">
	                                	<c:if test="${pageDto.cri.category == 4}">
	                                	작성자 ${b.id} ㅣ
	                                	</c:if>
	                                ${b.regDate}
	                                </p>
	                            </div>
                            </div>
                            <%-- <c:if test="${not empty reply.id}">
		                            <div class="answer">
		                            	<i class="fab fa-replyd"></i> 답변완료
		                            </div>
                            </c:if> --%>
                        </a>
                    </li>
                </c:forEach>
                </ul>
                <div class="page">
                	<ul class="pagination justify-content-center">
                		<li class="page-item ${pageDto.prevs ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.startPage-1}&${pageDto.cri.qs3}" title="이전 페이지 구역으로"> <i class="fas fa-backward"></i> </a></li>
                		<li class="page-item  ${pageDto.prev ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.cri.pageNum-1}&${pageDto.cri.qs3}" title="이전 페이지로"> <i class="fas fa-angle-left"></i> </a></li>
		                <c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="i">
		                <li class="page-item ${pageDto.cri.pageNum == i ? 'active' : ''}">	<a class="page-link" href="?pageNum=${i}&${pageDto.cri.qs3}" title="${i}페이지로">${i}</a>
		                </c:forEach>
		                <li class="page-item ${pageDto.next ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.cri.pageNum+1}&${pageDto.cri.qs3}" title="다음 페이지로"> <i class="fas fa-angle-right"></i> </a></li>
		                <li class="page-item ${pageDto.nexts ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.endPage+1}&${pageDto.cri.qs3}" title="다음 페이지 구역으로"> <i class="fas fa-forward"></i> </a></li>
                	</ul>
                </div>
            </div>
        </main>
        <jsp:include page="boardinclude/boardfooter.jsp" />
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script src="../../../js/app.js"></script>
    <script>
    const cp = '${pageContext.request.contextPath}';
    
    $("#boardWrite").click(function(event) {
    	if(${empty member || empty member.id}) {
			alert("로그인 후 이용 가능합니다.");
			location.href = cp + "/member/login?href=" + encodeURIComponent(location.href + "#boardWrite")
			event.preventDefault(); 
    	}
    });
    
    $("#searchForm button").click(function(event) {
    	// 검색타입을 선택하지 않았을 때
    	if(!$("#searchForm :checkbox:checked").length) {
    		alert("검색 조건을 선택하세요.")
    		return false;
    	}
    	// 입력된 검색 키워드가 없을 때
    	if(!$("#searchForm :text").val().trim()) {
    		alert("키워드를 입력하세요.")
    		return false;
    	}
    });
    
    </script>
</body>
</html>