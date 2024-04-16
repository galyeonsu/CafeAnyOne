<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<style>
    
    
</style>
</head>
<body>
    <div class="wrap">
        <header class="sticky"> <!-- // 고정 -->
            <div class="service">
                <a class="history" href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a>
                <!-- <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <a class="cart" href="#"><i class="fab fa-opencart"></i></a> -->
            </div>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks®</a></h1>
                <p class="welcome"><span>Welcome!</span>온라인 스토어에 오신 것을 환영합니다.</p>
            </div>
        </header>
        <main>
            <div class="product">
                <div class="detail">
                	<c:forEach items="${cafe.cfAttachs}" var="a">
	                    <div class="image">
	                        <img class="cafe" src="${pageContext.request.contextPath}/upload/${a.cfUuid}" />
	                    </div>
                    </c:forEach>
                    <p class="name">${cafe.cafeAddr}</p>
	                <p class="cafeNum">${cafe.cafeTell}</p>
	        	</div>
            </div>
              <form method="post" enctype="multipart/form-data">
                  <table class="table text-center">
                      <tbody>
                        <tr>
                          <td>월(10/18)</td>
                          <td>07:00 ~ 22:00</td>
                        </tr>
                        <tr>
                          <td>화(10/18)</td>
                          <td>07:00 ~ 22:00</td>
                        </tr>
                        <tr>
                          <td>수(10/18)</td>
                          <td>07:00 ~ 22:00</td>
                        </tr>
                        <tr>
                          <td>목(10/18)</td>
                          <td>07:00 ~ 22:00</td>
                        </tr>
                        <tr>
                          <td>금(10/18)</td>
                          <td>07:00 ~ 22:00</td>
                        </tr>
                        <tr>
                          <td>토(10/18)</td>
                          <td>07:00 ~ 22:00</td>
                        </tr>
                        <tr>
                          <td>일(10/18)</td>
                          <td>07:00 ~ 22:00</td>
                        </tr>
                     </tbody>
                </table>
                
	            <div action="list" class="btn-group btn-group-lg d-flex justify-content-center mt-5" role="group" data-toggle="buttons">
	                <label class="btn btn-outline-primary delivery" for="option1">주문하기</label>
	            </div>
	        </form>
        </main>
        
        <!-- modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        주문 하시겠습니까??
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btnno" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary btnok">확인</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
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

        // modal layer popup
        document.querySelector('.delivery').addEventListener('click', () => {
        	console.log("modal");
            //document.querySelector('.modal').classList.add('show');
            $('.modal').modal('show');
            $('.modal').modal('hide');
        });

        // $(".btn-check").on('click', function(e){
		// 		alert("검색 종류를 선택하세요");
		// 	}
        // ); $('li').children('div').css('color', 'red');

        $(function() {
            $('.myself').on('click', function() {
                $('.myself').removeClass('active'); // 모든 버튼에서 'active' 클래스 제거
                $(this).addClass('active'); // 현재 클릭된 버튼에 'active' 클래스 추가
            });

            $('.delivery').on('click', function() {
                $('.delivery').removeClass('active'); // 모든 버튼에서 'active' 클래스 제거
                $(this).addClass('active'); // 현재 클릭된 버튼에 'active' 클래스 추가
            });

            $(".modal-footer").on("click", ".btnok", function(){
            // console.log("확인")
            $(location).attr("href", "${pageContext.request.contextPath}/cart/list")
	    })
        });


        
    </script>
</body>
</html>