<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
</head>
<body>
    <div class="wrap">
        <header class="sticky">
            <div class="service">
                <a class="history" href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a>
                <form class="search">
                    <div class="overlay"></div>
                    <input class="inp_search" name="keyword" placeholder="검색어를 입력하세요" />
                    <button><i class="bi bi-search"></i></button>
                </form>
            </div>
            <div class="static">
                <h1 class="logo">What's New</h1>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
        </header>
        <main class="board">
            <div class="maincard">
            <h2>${categories[cri.category - 1].cname}</h2>
            <table class="board-view">
                <tr>
                    <th>제목</th>
                    <td colspan="3" class="text-break">
                        <c:out value="${board.title}" />
                    </td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${board.regDate}</td>
                    <th>최종수정일</th>
                    <td>${board.updateDate}</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                        <c:forEach items="${board.attachs}" var="attach">
                            <p><a href="${pageContext.request.contextPath}/file?${attach.qs}">${attach.origin}</a></p>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td colspan="4"  class="text-break"><c:out value="${board.content}" />
                    <!-- 삽입된 첨부파일 이미지 보기  -->
					<c:forEach items="${board.attachs}" var="attach">
						<a href="${pageContext.request.contextPath}/display?${attach.qs}"><img src="${pageContext.request.contextPath}/display?${attach.qs}"></a>
					</c:forEach></td>
                </tr>
            </table>
            <div class="btn-area">
            	<c:if test="${member.id == board.id || member.admin}">
                <a class="btn" href="modify?bno=${board.bno}&${cri.qs}">수정</a>
                <a class="btn" href="remove?bno=${board.bno}&${cri.qs}">삭제</a>
                </c:if>
                <a class="btn" href="list?${cri.qs}">목록</a>
            </div>
            <hr>
            <div class="reply-area">
                <h4> <strong>Reply <span class="reply-cnt"></span></strong></h4>
                <div class="reply-write" id="replyWrite">
                    <h5>댓글 작성</h5>
                    <c:if test="${empty member}">
                        <div class="reply-not-login">
                            댓글을 작성하려면 로그인 해주세요.
                        </div>
                    </c:if>
                    <c:if test="${not empty member}">
                        <h4>${member.id}</h4>
                        <textarea placeholder="댓글을 작성하세요."></textarea>
                        <div class="text-right">
                            <p><span class="reply-write-cnt">0</span>/500</p>
                            <button class="btn-primary btn btn-reply-register">등록</button>
                        </div>
                    </c:if>
                </div>
                <ul class="replies">
                </ul>
                <div class="reply-showmore-area">
                    <button class="btn btn-primary btn-block">더보기</button>
                </div>
            </div>
            </div>
        </main>
        <%-- <script src="${pageContext.request.contextPath}/js/reply.js"></script> --%>
        <script>
        const bno = '${board.bno}'; // 없는 경우를 방지하기 위해 문자열로 표현
        const cp = '${pageContext.request.contextPath}';
        const id = '${member.id}';
	    
	    moment.locale('ko');
	    // 댓글 수
	    function applyReplyCount() {
	    	$.ajax("/reply/cnt/" + bno).done((data) => {
	    		console.log(data);
	    		$(".reply-cnt").text(data);
	    	})
	    }
	    applyReplyCount();
	    
	    function displayTime(timeValue) {
	    	var currentTime = moment();
	        var timeMoment = moment(timeValue);
	        var gap = currentTime.diff(timeMoment, 'milliseconds');

	        if (gap < 1000 * 60 * 60 * 24) {
	            return timeMoment.fromNow();
	        } else {
	            return timeMoment.format('YYYY/MM/DD');
	        }
	    }
	    
	    function getReplyLi(reply) {
	    	return `
				<li data-rno='\${reply.rno}'>
					<div class="clearfix">
						<p class="reply-writer">\${reply.id}</p>
						<div class="reply-tooltip">
							<a href="" class="reply-modify-link">\${id === reply.id ? '<i class="fas fa-edit"></i>' : ''}</a>
							<a href="" class="reply-delete-link">\${id === reply.id ? '<i class="fas fa-trash-alt"></i>' : ''}</a> 
						</div>
					</div>
					<p class="reply-content text-break">\${reply.content}</p>
					<p class="reply-regdate">\${displayTime(reply.regDate)}</p>
				</li>
				`;
	    }
	
		// 더보기 버튼 클릭 이벤트 부여
		$(".reply-showmore-area button").click(() => {
			const lastRno = $(".replies li").last().data("rno");
			getList(lastRno);
		})
		
		// 비로그인 시 로그인 주소로 전환 이벤트 부여
		$("#replyWrite .reply-not-login").click(function() {
			location.href = cp + "/member/login?href=" + encodeURIComponent(location.href + "#replyWrite")
		})
    
		// 작성된 댓글의 갯수 계산 / 글자수 제한 이벤트 부여
		$(".reply-area").on("keyup", "textarea", function() {
			const length = this.value.length;
			$(this).next().find(".reply-write-cnt").html(length);
    	
			if(length > 500) {
				alert("댓글 입력 글자수는 500자 입니다.");
				this.value = this.value.slice(0, 500);
				$(this).next().find(".reply-write-cnt").html(500);
			}
		});
	    
	    // 댓글 작성 (버튼 누르면 작성)
	    $(".btn-reply-register").click(function() {
	    	if(!confirm("댓글을 등록하시겠습니까?")) {
	    		return;
	    	}
	    	
	    	//const id = '${member.id}';
	    	const content = $("#replyWrite textarea").val().trim();
	    	if(!content) {
	    		alert("댓글 내용을 입력하세요.");
	    		$("#replyWrite textarea").focus();
	    		return;
	    	}
	    	
	    	const reply = {bno, id, content};
	    	
	    	$.ajax(cp + "/reply", {
	    		method : "post",
	    		data : JSON.stringify(reply),
	    		success : function(data) {
	    			// data type: string
	    			alert("댓글이 등록되었습니다.");
	    			location.reload();
	    			// applyReplyCount();
	    			$(".reply-cnt").text((i, val)=> +val + 1);
	    			
	    			$.ajax(cp + "/reply/" +data).done(function(data) {
	    				// data type: reply
	    				 $(".replies").prepend(getReplyLi(data));
	    				 $("#replyWrite textarea").val("");
	    			});
	    		
	    		}
	    	})
	    });
	    
	    // 목록
	    function getList(lastRno) {
		    const url = cp + "/reply/list/"+ bno + (lastRno ? "/"+lastRno : "")
		    
		    $.ajax(url).done((data)=>{
				let str = '';
				for (let i of data) {
					str +=  getReplyLi(i);
				}
				$(".replies").append(str);
				
				if($(".replies li").length >= $(".reply-cnt").html()) {
					$(".reply-showmore-area button").prop("disabled", true).text("마지막 댓글입니다.");
				}
			})
	    }
	    getList();
	    
	    // 툴팁 박스 활성 클릭 이벤트
	    $(".replies").on("click", ".reply-tooltip", function() {
	    	event.preventDefault();
			if($(".replies textarea").length && !confirm("현재 수정 중인 댓글 내용이 반영되지 않습니다. 계속 하시겠습니까?")) {
				return;
			}
			const $target = $(this).closest("li").find(".reply-tooltip");
			const flag = $target.hasClass("active");
			$(".reply-tooltip").removeClass("active");
			flag || $target.addClass("active");
			$(".replies textarea").each(function() {
				const $li = $(this).closest("li");
				const rno = $li.data("rno");
				$.ajax(cp + "/reply/" + rno).done(function(data) {
					$li.find(".reply-content").html(data.content); 
				})
			})
	    })
    
		// 툴팁 내의 삭제 클릭 이벤트
	    $(".replies").on("click", ".reply-delete-link", function() {
	    	event.preventDefault();
			if(!confirm("댓글을 삭제하시겠습니까?")) {
	    		return;
	    	}
			console.log("click");
			const $li = $(this).closest("li");
			const rno = $li.data("rno");
	
			$.ajax(cp + "/reply/" +rno, {
				method : "delete",
				success : function(data) {
					$li.remove();
					$(".reply-cnt").text((i, val)=>val - 1);
				}
			});
	    })
	    
	    // 툴팁 내의 수정 버튼 이벤트
	    $(".replies").on("click", ".reply-modify-link", function() {
	    	event.preventDefault();
			
			const $li = $(this).closest("li");
			const rno = $li.data("rno");
	
			$.ajax(cp + "/reply/" +rno, {
				success : function(data) {
					$li
					.find('.reply-content').html(`<textarea placeholder="댓글을 작성하세요.">\${data.content}</textarea>
					<div class="text-right">
						<p><span class="reply-write-cnt">\${data.content.length}</span>/500</p>
						<button class="btn btn-primary btn-reply-modify">수정</button>
					</div>`).end();
				}
			});
	    });
	    
		 // 댓글 수정 (버튼 누르면 수정 반영)
	    $(".replies").on("click", ".btn-reply-modify", function() {
	    	if(!confirm("댓글을 수정하시겠습니까?")) {
	    		return;
	    	}
	    	
	    	const content = $(this).parent().prev().val().trim();
	    	if(!content) {
	    		alert("댓글 내용을 입력하세요.");
				$(this).parent().prev().focus();
	    		return;
	    	}
	    	const $li = $(this).closest("li")
	    	const rno = $li.data("rno");
	    	const reply = {rno, content};
	    	
	    	$.ajax(cp + "/reply", {
	    		method : "put",
	    		data : JSON.stringify(reply),
	    		success : function(data) {
	    			alert("댓글이 수정되었습니다.");
	    			// location.reload();
	    			$.ajax(cp + "/reply/" +rno).done(function(data) {
	    				 $li.replaceWith(getReplyLi(data));
	    				 $(".replies textarea").val("");
	    			});
	    		}
	    	})
	    });
    	</script>
        <jsp:include page="boardinclude/boardfooter.jsp" />
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script src="../../../js/app.js"></script>
</body>

</html>