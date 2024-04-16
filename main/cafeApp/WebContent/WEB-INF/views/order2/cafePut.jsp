<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks</title>
<link rel="stylesheet" href="../css/app.css">
<style>
	/* board */
	.board {padding-bottom: 50px;}
	main .board form {max-width: 100%;}
	.board h2 {margin: 30px; text-align: center;}
	.board table {width: 100%; border-collapse: collapse; margin: 10px auto 50px;}
	.board th, 
	.board td {padding: 10px; border-top: 1px solid black; border-bottom: 1px solid black;}
	.board-list td:not(:nth-child(2)) {text-align: center;}
	.board-list th:nth-child(2) {width: 60%;}
	.board-view td.td-content {height: 200px; padding: 30px; vertical-align: top;}
	.board-view input, .board-view select {padding: .5em; width: calc(100% - 1em);}
	.board-view textarea {width: 100%; height: 300px; resize: none; padding: 1em;}
	
	.board .btn-area {text-align: right;}
	.board a {text-decoration: none; color: #222;}
	.board a:hover {text-decoration: underline;}
	.board-list-attached {margin: 0 6px;}
</style>
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
                <a class="cart" href="#"><i class="fab fa-opencart"></i></a>
            </div>
            <div class="static">
                <h1 class="logo">Starbucks® Store</h1>
                <p class="welcome"><span>Welcome!</span>온라인 스토어에 오신 것을 환영합니다.</p>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main>
           <div class="board">
           	<form method="post" enctype="multipart/form-data">
		    	<h2>게시글 작성</h2>
		    	<table class= "board-view">
		    		<tr>
		    			<th>첨부파일</th>
		    			<td colspan="3"><input type="file" name="files" multiple></td>
		    		</tr>
		    		<tr>
		    			<th>주소</th>
		    			<td colspan="3"><input type="text" name="cafeAddr"></td>
		    		</tr>
		    		<tr>
		    			<th>카페 전화 번호</th>
		    			<td colspan="1"><input type="text" name="cafeTell"></td>
		    		</tr>
		    		
		    		
		    	</table>
		    	<div class="btn-area"><button class="btn btn-primary" formaction="put">등록</button></div>
		    </form>
           </div>
        </main>
        <jsp:include page="../includes/footer.jsp" />
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../../js/app.js"></script>
    <script>
    	/* $("button.btn").on('click', function() {
    		$('main input').attr('name');
    		$('main input').attr('');
    	}); */
    </script>
</body>
</html>