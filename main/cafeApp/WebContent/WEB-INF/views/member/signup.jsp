<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
	integrity="sha512-b2QcS5SsA8tZodcDtGRELiGv5SaKSk1vDHDaQRda0htPYWZ6046lr3kJ5bAAQdpV2mmA/4v0wQF9MyU6/pDIAg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
	integrity="sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>Starbucks</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app.css">
<body>
	<div class="wrap">
		<header>
			<div class="static">
				<h1 class="logo">Starbucks®</h1>
				<p class="welcome">
					<span>안녕하세요.</span>Welcome to Starbucks
				</p>
			</div>
			<jsp:include page="../includes/navLink.jsp" />
		</header>
		<main>
			<form class="signup-form" method="post" input-group>
				<input type="hidden" name="duplicateid" value="">
				<h3>회원가입</h3>
				<div class="form-floating mt-5 input-group">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="가입할 아이디를 입력하세요">
					<p class="small text-danger"></p>
					<label for="id">아이디 </label>
					<button type="button" id="checkIdButton" onclick="checkId()"
						class="btn btn-secondary">중복 확인</button>

				</div>
				<div class="form-floating mt-5">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="가입할 비밀번호를 입력하세요">
					<p class="small text-danger"></p>
					<label for="pw">비밀번호</label>
					<p class="small text-danger"></p>
				</div>

				<div class="form-floating mt-5">
					<input type="password" class="form-control" id="pwchek"
						name="pwchek" placeholder="비밀번호를 재입력해 주세요">
					<p class="small text-danger"></p>
					<label for="pwchek">비밀번호 재입력</label>
				</div>

				<div class="form-floating mt-5">
					<input type="text" class="form-control" id="name" name="name"
						placeholder="이름을 입력해 주세요">
					<p class="small text-danger"></p>
					<label for="fname">이름</label>
				</div>

				<div class="form-floating mt-5">
					<input type="tel" class="form-control" id="phone" name="phone"
						placeholder="휴대폰 번호를 입력해 주세요"> <label for="phone">휴대폰
						번호</label>
				</div>

				<div class="form-floating mt-5 input-group">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="이메일을 입력해 주세요"> <label for="email">이메일</label>
					<button type="button" id="checkEmailButton" onclick="checkEmail()"
						class="btn btn-secondary">중복 확인</button>

					<button type="button" id="btnValid" class="btn btn-secondary">
						<span class="valid-text">인증하기</span>
						<div class="spinner-border text-white spinner-border-sm d-none"
							role="status">
							<span class="visually-hidden">Loading...</span>
						</div>
					</button>
				</div>
				<div class="form-floating mt-5 d-none">
					<input type="text" class="form-control" id="validNum"
						placeholder="인증번호를 입력해 주세요"> <label for="validNum">이메일로
						발송된 인증 번호를 입력하세요</label>
				</div>
				<div class="form-floating mt-5">
					<input type="text" class="form-control" id="addr" name="addr"
						placeholder="주소를 검색해 입력해 주세요"> <label for="addr">주소</label>
				</div>
				<div class="form-check mt-5">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault">이용약관 개인정보 수집 및 정보이용에 동의합니다.</label>
				</div>
				<button class="btnb mt-5 input-group">가입하기</button>

			</form>
		</main>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
		/* 회원가입 조건식 */
		function f(elem, predi, msg) {
			predi ? elem.addClass("border-danger").next().text(msg) : elem
					.removeClass("border-danger").next().text("")

			return predi;
		}
		$(function() {
			let signupVal = false;

			$(".signup-form").submit(
			function(event) {
				if (signupVal === false) {
					event.preventDefault(); // 폼의 submit을 막음

					const con1 = f($("#id"), $("#id").val().length < 4,
							"4글자 이상으로 입력");
					const con2 = f($("#pw"), $("#pw").val().length < 8,
							"8글자 이상으로 입력");
					const con3 = f($("#pwchek"),
							$("#pwchek").val() !== $("#pw").val(),
							"비밀번호가 일치하지 않습니다.");

					console.log(!con1);
					console.log(!con2);
					console.log(!con3);

					if (!con1 && !con2 && !con3) {
						signupVal = true;
						$(".signup-form").submit(); // 폼을 제출
					}
				}
			});
		});

		// IIFE
		$(function() {
			let validNum = 0;

	$("#btnValid").click(
		function() {
			var email = $("#email").val();
			// 유효성 검증
			if (!email) {
				alert("인증할 이메일 주소를 정확히 입력");
				console.log($("#email").val())
				return false;
					}
		// 비동기
	$.ajax(
		"${pageContext.request.contextPath}/member/emailCheck?email="
				+ encodeURIComponent(email),
		{
			beforeSend : function(xhr) {
				$("#btnValid").prop("disabled", true)
						.addClass("btn-danger").find(
								".valid-text").text(
								"발송중").end()
						.find("div").removeClass(
								"d-none");
		}
	}).
	done(
		function(data) {
			$("#btnValid").prop("disabled", false)
			.removeClass("btn-danger")
			.find(".valid-text")
			.text("발송완료")
			.end().find("div").addClass("d-none");
			$("#validNum").closest("div").removeClass("d-none");
			validNum = data;
				})
			})
		})

		function checkId() {
			const id = document.getElementById("id").value; // 입력된 아이디
			const idCheckResult = document.getElementById("idCheckResult");

			// AJAX 요청을 보냅니다.
			const xhr = new XMLHttpRequest();
			xhr.open("POST", "/member/checkIdDuplicate", true); // 서버에서 아이디 중복 검사를 수행할 엔드포인트
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					const response = xhr.responseText;
					if (response === "duplicate") {
						alert("중복된 아이디 입니다");

					} else {
						alert("사용 가능한 아이디 입니다");
					}
				}
			};

			xhr.send("id=" + id); // 아이디 값을 서버로 보냅니다
		}

	function checkEmail() {
			const email = document.getElementById("email").value;
			const emailCheckResult = document
					.getElementById("emailCheckResult");

			const xhr = new XMLHttpRequest();
			xhr.open("POST", "/member/checkEmailDuplicate", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					const response = xhr.responseText;
					console.log(response)
					if (response === "duplicate") {
						alert("중복된 이메일 입니다")
					} else {
						alert("사용가능한 이메일 입니다")
						console.log(response)
					}
				}
			};
			xhr.send("email=" + email);
		}
	</script>
</body>
</html>
