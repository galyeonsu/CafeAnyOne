<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        	<form method="post" enctype="multipart/form-data">
	            <div class="maincard">
		            <h2>${categories[cri.category - 1].cname} 작성</h2>
		            <table class="board-view">
		                <tr>
		                    <th>제목</th>
		                    <td colspan="3"><input type="text" name="title"></td>
		                </tr>
		                <tr>
		                    <th>첨부파일</th>
		                    <td colspan="3"><input type="file" name="files" multiple></td>
		                </tr>
		            </table>
		            <input type="hidden" name="id" value="${member.id}">
		            <input type="hidden" name="category" value="${cri.category}">
	                <input type="hidden" name="pageNum" value="1">
	                <input type="hidden" name="amount" value="${cri.amount}">
	                <div class="btn-area"><button class="btn" type="submit">작성</button></div>
	            </div>
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
</body>

</html>