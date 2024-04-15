<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>
<body>
    <div class="wrap">
    	<header class="sticky"> <!-- // 고정 -->
            <div class="service">
                <a class="history" href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a>
                <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <a class="cart" href="basket"><i class="fab fa-opencart"></i></a>
            </div>
            <div class="static">
                <h1 class="logo"><a href="${pageContext.request.contextPath}/">Starbucks® Store</a></h1>
            </div>
            <%-- <jsp:include page="../includes/navLink.jsp" /> --%>
        </header>
        <main>
        	<form method="post">
        		<div class="overflow-hidden">
					<div class="p-3">카테고리</div>
					<div>
						<c:forEach items="${proCategories}" var="c">    
							<input type="radio" required class="btn-check" name="prCategory" id="cate${c.pcNo}" value="${c.pcNo}" ${c.pcNo == list.prCategory ? 'checked' : ''}>
							<label class="btn" for="cate${c.pcNo}">${c.pcName}</label>					
						</c:forEach>
					</div>
				</div>
				<div class="mt-5">
					<label for="exampleFormControlInput" class="form-label">제목</label>
					<input type="text" class="form-control" id="exampleFormControlInput" name="proName" required value="${list.proName}">
				</div>
				<div class="mt-5">
					<label for="exampleFormControlTextarea1" class="form-label">상세내용</label>
					<textarea class="form-control form-detail" id="exampleFormControlTextarea1" rows="3" name="proDetail" required>${list.proDetail}</textarea>
				</div>
				<div class="mt-5">
					<label for="exampleFormControlInput3" class="form-label">가격</label>
					<input type="text" class="form-control" id="exampleFormControlInput3" name="proPrice" required value="${list.proPrice}">
				</div>
				<div class="overflow-hidden mt-5">
					<div class="p-3">사이즈</div>
					<div>
						<input type="radio" class="btn-check" name="proSize" id="option1" value="FREE" checked>
						<label class="btn" for="option1">FREE</label>
						
						<input type="radio" class="btn-check" name="proSize" id="option2" value="Tall">
						<label class="btn" for="option2">Tall</label>
						
						<input type="radio" class="btn-check" name="proSize" id="option3" value="Grande">
						<label class="btn" for="option3">Grande</label>
						
						<input type="radio" class="btn-check" name="proSize" id="option4" value="Venti">
						<label class="btn" for="option4">Venti</label>
					</div>
				</div>
				
				<div class="overflow-hidden mt-5">
					<div class="row gx-5">
						<div class="col">
							<div class="p-3">온도</div>
							<div>
								<input type="radio" class="btn-check" name="proStmt" id="option5" value="" checked>
								<label class="btn" for="option5">None</label>
								
								<input type="radio" class="btn-check" name="proStmt" id="option6" value="HOT">
								<label class="btn" for="option6">HOT</label>
								
								<input type="radio" class="btn-check" name="proStmt" id="option7" value="ICED">
								<label class="btn" for="option7">ICE</label>
							</div>
						</div>
						<div class="col">
							<div class="p-3">컵 선택</div>
							<div>
								<input type="radio" class="btn-check" name="cupChoice" id="option8" value="" checked>
								<label class="btn" for="option8">None</label>
								
								<input type="radio" class="btn-check" name="cupChoice" id="option9" value="0">
								<label class="btn" for="option9">일회용컵</label>
								
								<input type="radio" class="btn-check" name="cupChoice" id="option10" value="1">
								<label class="btn" for="option10">개인컵</label>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-area mt-5"><button class="btnb">상품 수정</button></div>
        	</form>
        </main>
        <jsp:include page="../includes/footer.jsp" />
        <!-- modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                       	파일을 첨부해 주세요.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-confirm">확인</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/js/app.js"></script> --%>
    <script>
    	const radio = ['[name="proSize"]', '[name="proStmt"]', '[name="cupChoice"]'];
    	
    	$(radio).each(function(i, key) {
    		$(key).each(function(j, item) {
    			let el = $(item).val(); 
    			if(el == '${list.proSize}' || el == '${list.proStmt}' || el == '${list.cupChoice}') {
    				$(item).prop('checked', true);
        		}
    		});
    	});
    </script>
</body>
</html>