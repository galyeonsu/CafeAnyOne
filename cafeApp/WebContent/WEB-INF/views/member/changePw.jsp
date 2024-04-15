<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member.css">
</head>
<body>
	<div class="wrap">
		<header>
			<div class="static">
				<h1 class="logo">Starbucks®</h1>
				<p class="welcome">
					<span>${member.id}(${member.name})</span>Welcome to Starbucks
				</p>
			</div>
			<jsp:include page="../includes/navLink.jsp" />
		</header>
		<main>
			 <form class="change" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="duplicateid" value="">
            <h1>비밀번호 변경하기</h1>
            <div class="form-floating mt-5">
                <input type="password" class="form-control" id="oldPassword" name="oldpassword" required>
                <p class="small text-danger" id="oldPasswordError"></p>
                <label for="oldPassword">현재 비밀번호를 입력해주세요</label>
            </div>
            <div class="form-floating mt-5">
                <input type="password" class="form-control" id="newPassword" name="password" required>
                <p class="small text-danger" id="newPasswordError"></p>
                <label for="newPassword">새로 사용할 비밀번호를 입력해주세요</label>
            </div>
            <div class="form-floating mt-5">
                <input type="password" class="form-control" id="passwordConfirmation" name="passwordchk" required>
                <p class="small text-danger" id="passwordConfirmationError"></p>
                <label for="passwordConfirmation">비밀번호 확인</label>
            </div>
            <button class="btnb mt-5 input-group">변경하기</button>
        </form>
    </main>
</div>
<script>
    function validateForm() {
        var oldPassword = document.getElementById("oldPassword").value;
        var newPassword = document.getElementById("newPassword").value;
        var passwordConfirmation = document.getElementById("passwordConfirmation").value;
        var oldPasswordError = document.getElementById("oldPasswordError");
        var newPasswordError = document.getElementById("newPasswordError");
        var passwordConfirmationError = document.getElementById("passwordConfirmationError");

        oldPasswordError.textContent = "";
        newPasswordError.textContent = "";
        passwordConfirmationError.textContent = "";

        var isValid = true;

        if (oldPassword.length < 8) {
            oldPasswordError.textContent = "8글자 이상으로 입력";
            isValid = false;
        }

        if (newPassword.length < 8) {
            newPasswordError.textContent = "8글자 이상으로 입력";
            isValid = false;
        }

        if (newPassword !== passwordConfirmation) {
            passwordConfirmationError.textContent = "비밀번호가 일치하지 않습니다.";
            isValid = false;
        }

        return isValid;
    }
</script>
			</script>
</body>
</html>