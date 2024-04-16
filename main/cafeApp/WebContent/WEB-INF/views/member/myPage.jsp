<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member.css">
</head>
<body>
<div class="wrap">
    <header>
        <div class="col-xxl-"></div>
        <div class="static">
            <h1 class="logo">Starbucks®</h1>
            <p class="welcome">
               <c:if test="${not empty member}">
                <span>${member.id}(${member.name})</span>Welcome to Starbucks
                </c:if>
            </p>
        </div>
       <jsp:include page="../includes/navLink.jsp" />
    </header>
    <main>
        <div>
            <p class="ms_user_stat"></p>
        </div>
        <div class="mymain row row-cols-1 row-cols-sm-2">
            <div class="card col-sm-3">
                <div class="profile">
                    <form method="post" enctype="multipart/form-data">
                        <img class="profile-thumb" src="/display?path=&uuid=${member.getMUuid()}" />
                        <input type="file" id="files" name="uploadFile" multiple>
                        <button id="uploadBtn">프로필 사진 등록하기</button>
                    </form>       
                </div>
                <div class="prof-info"></div>
            </div>
        </div>
        <div class="cate">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/member/changePw">
                        <span>My 비밀번호 변경</span>
                        <i class="fas fa-chevron-right"></i>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/member/myUpdate">
                        <span>My 개인정보 변경</span>
                        <i class="fas fa-chevron-right"></i>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/member/myplay">
                        <span>My 활동</span>
                        <i class="fas fa-chevron-right"></i>
                    </a>
                </li>
            </ul>
        </div>
         <div class="cate ">
            <h3 class="title lain"> 주문목록 </h3>
            <div>
                <table class="myplay">
                 <colgroup>
                		<col style="width: 25%;" />
                		<col style="width: auto;" />
                		<col style="width: auto;" />
                		<col style="width: 12%;" />
                	</colgroup>
                    <tr>
                        <th>상품이름</th>
                        <th>상품가격</th>
                        <th>주문수량</th>
                        <th>주문날짜</th>
                    </tr>
                       <c:forEach items="${orderList}" var="p">
                    <tr>
                        <td><a>${p.proName}</a></td> 
                        <td>${p.proPrice}원</td>
                        <td>${p.proAmt}</td>
                        <td>${p.regDate}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        
	</main>
	<jsp:include page="../includes/footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
		function getProfileImage() {
			$.ajax({
	    		url: '/profile/',
	    		type: 'get',
	    		success: function(data) {
	    			$('.profile-thumb').attr('src', '${pageContext.request.contextPath}/upload/' + data);
	    		}
	    	});
		}
    	
		getProfileImage();
	
    	$('#uploadBtn').on('click', function(e) {
    		e.preventDefault();
    		regist();
    	});
    	
    	$('#files').on('change', function(e) {
    		const f = e.target.files[0];
    		
    		if(!f.type.match('image*')) {
    			alert('이미지만 첨부할수 있습니다.');
    			$('#files').val();
    			return;
    		}
    		
    		const reader = new FileReader();
    		reader.onload = function(e) {
    			$('.profile-thumb').attr('src', e.target.result);
    		}
    		reader.readAsDataURL(f); // 비동기
    	});
    	
	   	function regist() {
	    	const formData = new FormData();
	        const data = $('#files');
	        formData.append('file', data[0].files[0]);
	        $.ajax({
	           url: '/profile/',
	           type: 'post',
	           data: formData, 
	           contentType: false, 
	           processData: false, 
	           success: function(result) {
	              if(result == 'success') {
	            	  $('.modal').modal('show');
	            	  //alert('프로필 사진이 변경 되었습니다.');
	              } else {
	            	  $('.modal').modal('show');
	                 //console.log('업로드에 실패했습니다. 관리자에게 문의해 주세요.');
	              }
	           },
	           error: function(request, status, error) {
	              console.log('code: ' + request + '\n' + 'message: ' + request.responseText + '\n' + 'error: ' + error);
	              alert('업로드에 실패했습니다. 관리자에게 문의해 주세요.');
	           }
	        });
	     };
    	
    </script>

</body>
</html>