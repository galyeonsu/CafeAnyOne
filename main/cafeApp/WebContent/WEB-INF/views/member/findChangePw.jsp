<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
</head>
<body>
    <div class="wrap">
        <header>
            <div class="static">
                <h1 class="logo">Starbucks®</h1>
                <p class="welcome"><span>${member.id}(${member.name})</span>Welcome to Starbucks</p> <!-- 로그인한 멤버 아이디 띄어주고 안녕하세요 -->
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
        	<h3>${member.name}님 비밀번호를 재설정해주세요</h3>
            <form class="signup-form" method="post">
                <h1>비밀번호 변경하기</h1>
                <input type="hidden" name="token" value="${token}">
                <div class="form-floating mt-5">
                    <input type="password" class="form-control" id="pw" name="password">
                    <label for="floatingPasswordRe">새로 사용할 비밀번호를 입력해주세요</label>
                </div>
                
                <div class="form-floating mt-5">
                    <input type="password" class="form-control" id="pw" name="passwordchk">
                    <label for="floatingPassword">비밀번호 확인</label>
                </div>
                
                <button class="btnb mt-5" >변경하기</button>
            </form>
        </main>
        <jsp:include page="../includes/footer.jsp" />
        <div class="alert alert-success" style="    position: absolute; top: 50%; display: none;">
          <strong>Success!</strong> Indicates a successful or positive action.
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
   	<script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script>
        $('.btn').on('click', function(e){
                e.preventDefault();
              // $('.alert').show();
              
              
        })
    </script>
</body>
</html>