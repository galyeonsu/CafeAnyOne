<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <p class="welcome"><span>${member.id}(${member.name})님</span>Welcome to Starbucks</p> 
            </div>
           <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
            <form class="signup" method="post">
                <h1>개인정보수정하기</h1>
                <div class="form-floating mt-5">
                <h3></h3>
                    <input type="text" class="form-control" id="phone" name="newPhone">
                    <label for="phone">변경 할 휴대폰번호를 입력해주세요</label>
                </div>
                <div class="form-floating mt-5">
                    <input type="text" class="form-control" id="addr" name="newAddr">
                    <label for="addr">변경할 주소를 적어주세요</label>
                </div>
                <div class="form-floating mt-5">
                    <input type="text" class="form-control" id="email" name="newEmail">
                    <label for="email">변경할 이메일을 적어주세요</label>
                </div>
                <button class="btnb mt-5">변경하기</button>
            </form>
        </main>
        <footer>

        </footer>
        <div class="alert alert-success" style="    position: absolute; top: 50%; display: none;;">
            <strong>Success!</strong> Indicates a successful or positive action.
          </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script>
    document.querySelector('form.signup').addEventListener('submit', function (e) {
        const phoneInput = document.querySelector('#phone');
        const addrInput = document.querySelector('#addr');
        const emailInput = document.querySelector('#email');

        if (phoneInput.value.trim() === '' || addrInput.value.trim() === '' || emailInput.value.trim() === '') {
            e.preventDefault(); // 폼 제출을 방지
            alert('필수 항목을 모두 입력하세요.');
        }
    });
    
        const scrollPosition = () => {
            const header = document.querySelector('header');
            let scroll = this.scrollY;
            let headheight = header.clientHeight;
            
            if(scroll > headheight) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        }

        window.addEventListener('load', scrollPosition);
        window.addEventListener('scroll', scrollPosition);

        $('.btn').on('click', function(e){
                e.preventDefault();
              // $('.alert').show();
              
              
        })
    </script>
</body>
</html>