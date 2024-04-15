<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Starbucks</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<body>
    <div class="wrap">
	    <header>
	        <div class="static">
	            <h1 class="logo">Starbucks®</h1>
	            <p class="welcome"><span>안녕하세요.</span>Welcome to Starbucks</p>
	        </div>
	        <jsp:include page="../includes/navLink.jsp" />
	    </header>
	    <main>
	        <form class="signup" method="post">
	            <h3>이메일 인증하기</h3>
	            <div class="form-floating mt-5">
	            <div class="form-floating mt-5 input-group">
	                <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해 주세요">
	                <label for="floatingInput">이메일을 입력해주세요</label>
	            	<button>재설정 이메일 보내기</button>
	            		
	            </div>
	        </form>
	    </main>
	    <jsp:include page="../includes/footer.jsp" />
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
	/* $.ajax("${pageContext.request.contextPath}/member/emailChek?email=" + encodeURIComponent(email), {
		beforeSend : function(xhr) {
			$("#btnValid").prop("disabled", true).addClass("btn-danger")
				.find(".valid-text").text("발송중").end()
				.find("div").removeClass("d-none");
		}	
	}).done(function(data) {
		$("#btnValid").prop("disabled", false).removeClass("btn-danger")
			.find(".valid-text").text("발송완료").end()
			.find("div").addClass("d-none");
		$("#validNum").closest("div").removeClass("d-none");
		validNum = data;
	}) */
	</script>
</body>
</html>