<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
</head>
<body>
    <div class="wrap">
        <header class="sticky">
            <div class="service">
                <a class="history" href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a>
                <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
            </div>
            <div class="static">
                <h1 class="logo">What's New</h1>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main class="board">
            <form method="post" action="modify" enctype="multipart/form-data">
                <h2>${categories[cri.category - 1].cname} 수정</h2>
                <table class="board-view">
                    <tr>
                        <th>제목</th>
                        <td colspan="3"><input type="text" name="title" value="${board.title}"></td>
                    </tr>
                    <tr>
	                    <th>작성일</th>
	                    <td>${board.regDate}</td>
	                    <th>최종수정일</th>
	                    <td>${board.updateDate}</td>
	                </tr>
	                <tr>
                    	<th>첨부파일</th>
	                    <td colspan="3">
	                        <c:forEach items="${board.attachs}" var="attach">
	                            <p class="d-flex align-items-center ml-3">
	                            	<a href="${pageContext.request.contextPath}/file?${attach.qs}">${attach.origin}</a> <i class="fas fa-times btn-attach-remove ml-3"></i>
	                            	<input type="hidden" name="uuid" value="${attach.uuid}" >
	                            </p>
	                        </c:forEach>
	                        <input type="file" id="files" name="files" multiple>
	                    </td>
	                </tr>
                    <tr>
                        <td colspan="4"><textarea name="content">${board.content}</textarea></td>
                    </tr>
                </table>
                <input type="hidden" name="id" value="${board.id}">
                <input type="hidden" name="bno" value="${board.bno}">
                <input type="hidden" name="category" value="${cri.category}">
                <input type="hidden" name="pageNum" value="${cri.pageNum}">
                <input type="hidden" name="amount" value="${cri.amount}">
                <input type="hidden" name="type" value="${cri.type}">
                <input type="hidden" name="keyword" value="${cri.keyword}">
                <div class="btn-area"><button class="btn">수정</button></div>
            </form>
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
    $(".btn-attach-remove").click(function() {
    	event.preventDefault();
    	$(this).closest("p").remove();
    });
    </script>
</body>

</html>