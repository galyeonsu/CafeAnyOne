<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
    <style>
       .MPL {
            padding-left: 20px;
            color: #037948;
        }

        .lain {
            border-bottom: solid;
        }
        a {coler:green;}
    </style>
</head>
<body>
   <div class="wrap">
    <header>
        <div class="static">
                <h1 class="logo">Starbucks® Store</h1>
                  <c:if test="${not empty member}">
                <p class="welcome"><span>${member.id}(${member.name})</span></p>
                </c:if>
            </div>
               <jsp:include page="../includes/navLink.jsp" />
        </header>
    </header>
    <main>
        <h1 class="MPL"> MY 활동</h1>
        <div class="sbComponent cart">
            <h3 class="title lain"> 작성한 게시글 </h3>
            <div>
                <table class="myplay">
                	<colgroup>
                		<col style="width: 10%;" />
                		<col style="width: auto;" />
                		<col style="width: 12%;" />
                	</colgroup>
                    <tr>
                        <th>번호</th>
                        <th> 제목</th>
                        <th>작성일</th>
                    </tr>
                    <c:forEach items="${boardList}" var="b">
                        <tr>
                            <td>${b.bno}</td>
                            <td><a href="${pageContext.request.contextPath }/board/view?bno=${b.bno}&category=${b.category}">${b.title}</a></td>
                            <td>${b.regDate}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
       <div class="sbComponent cart">
            <h3 class="title lain"> 작성한 리뷰 </h3>
            <div>
                <table class="myplay">
                <colgroup>
                		<col style="width: 10%;" />
                		<col style="width: auto;" />
                		<col style="width: 12%;" />
                	</colgroup>
                    <tr>
                        <th>번호</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </tr>
                     <c:forEach items="${reviewList}" var="r">
                    <tr>
                        <td>${r.rvNo}</td>
                       <td><a href="${pageContext.request.contextPath}/product/view?proNo=${r.proNo}">${r.rvContent}</a></td>
                        <td >${r.rvRegDate}</td>
                    </tr>
                    
                        </c:forEach>
                </table>
            </div>
        </div>
        <div class="sbComponent cart">
            <h3 class="title lain"> 작성한 댓글 </h3>
            <div>
                <table class="myplay">
                 <colgroup>
                		<col style="width: 10%;" />
                		<col style="width: auto;" />
                		<col style="width: 12%;" />
                	</colgroup>
                    <tr>
                        <th>번호</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </tr>
                       <c:forEach items="${boardList}" var="b">
	                       <c:forEach items="${replyList}" var="r">
			                    <tr>
			                        <td>${r.rno}</td>
			                        <td><a href="${pageContext.request.contextPath }/board/view?bno=${b.bno}&${pageDto.cri.qs}">${r.content}</a></td>
			                        <td>
			                        	<fmt:formatDate value="${r.regDate}" pattern="yyyy-MM-dd"/>
			                        </td>
			                    </tr>
	                    </c:forEach>
                    </c:forEach>
                </table>
            </div>
        </div>
    </main>
    <jsp:include page="../includes/footer.jsp" />
</div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
    <script>
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
    </script>
</body>

</html>


