<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>

<body>
    <div class="wrap">
        <header>
            <div class="static">
                <h1 class="logo">Starbucks®</h1>
                <p class="welcome"><span>Welcome back!</span>회원 서비스 이용을 위해 로그인 해주세요.</p>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
            <form class="login user" method="post">
                <h3>로그인</h3>
                <p></p>
                <div class="form-floating mb-4">
                    <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
                    <label for="id">아이디</label>
                     <p class="small text-danger"></p>
                </div>
                <div class="form-floating mb-4">
                    <input type="password" class="form-control" id="pw" name="pw" placeholder="가입할 비밀번호를 입력하세요">
                    <label for="pw">비밀번호</label>
                     <p class="small text-danger"></p>
                </div>
                <div class="form-check mt-4">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">로그인 상태 유지</label>
                </div>
                <button class="btnb mt-5">로그인</button>
            </form>
            <p>계정이 없으신가요? <a href="${pageContext.request.contextPath}/member/signup">가입하기</a></p>
            <a href="${pageContext.request.contextPath}/member/PasswordReset">아이디 / 비밀번호 찾기</a>
        </main>
        <jsp:include page="../includes/footer.jsp" />
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>