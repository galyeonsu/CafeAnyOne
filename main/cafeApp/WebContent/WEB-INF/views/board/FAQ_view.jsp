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
            <div class="col-12 col-lg-10 mx-auto">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h2 class="m-0 font-weight-bold">${categories[cri.category - 1].cname}</h6>
                    </div>
                    <div class="card-body">
                        <form method="post">
                        <div class="form-group">
                            <h3 class="font-weight-bold">Q.</h3>
                        </div>
                        <div class="form-group">
                            <h4 class="font-weight-bold">${board.title}</h3>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="boardContent" name="content" rows="10" readonly>${board.content}</textarea>
                        </div>
                        <div class="btn-area">
                            <c:if test="${member.id == board.id || member.admin}">
                                <a class="btn" href="modify?bno=${board.bno}&${cri.qs}">수정</a>
                                <a class="btn" href="remove?bno=${board.bno}&${cri.qs}">삭제</a>
                            </c:if>
                            <a class="btn" href="list?${cri.qs}">목록</a>
                        </div>
                        </form>
                    </div>
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
    $(document).ready(function() {
    	$('textarea').on('keyup', function(e) {
    		$(this).css('height', 'auto');
    		$(this).height(this.scrollHeight);
    	});
    	$('textarea').keyup();
    })
    </script>
</body>

</html>