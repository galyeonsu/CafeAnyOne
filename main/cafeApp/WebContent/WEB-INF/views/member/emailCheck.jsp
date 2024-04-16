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
                <p class="welcome"><span>안녕하세요.</span>Welcome to Starbucks</p> <!-- 로그인한 멤버 아이디 띄어주고 안녕하세요 -->
            </div>
            <nav>
                <ul>
                    <li class="on"><a href="#"><i class="bi bi-house-door-fill"></i>Home</a></li>
                    <li><a href="#"><i class="fas fa-wallet"></i>Pay</a></li>
                    <li><a href="#"><i class="fas fa-coffee"></i>Order</a></li>
                    <li><a href="./shop.html"><i class="fas fa-store"></i>Shop</a></li>
                    <li><a href="#"><i class="fas fa-user"></i>Other</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <form class="signup" method="post">
                <h1>email 인증하기</h1>
                <div class="form-floating mt-5">
                <h3></h3>
                    <input type="text" class="form-control" id="email"  name="email">
                    <label for="floatingInput">인증번호를 입력해주세요</label>
                </div>
                <button class="btnb mt-5">인증하기</button>
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