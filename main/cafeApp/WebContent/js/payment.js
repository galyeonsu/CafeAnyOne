/**
 * @author kss
 * @description 결제 서비스 API
 * @see https://portone.io/
 */

var IMP = window.IMP;

function kakaoPay(user) {
    if (confirm('결제 하시겠습니까?')) { // 구매 클릭시 한번 더 확인하기
		IMP.init('imp60854762'); // 가맹점 식별코드
        IMP.request_pay({
            pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택 inicis
            pay_method: 'card', // 결제 방식
            merchant_uid: user.uid, // 결제 고유 번호
            name: '스타벅스 프로젝트', // 제품명
            amount: user.money, // 가격
			buyer_name: user.name,
            buyer_email: user.email,
            buyer_tel : user.phone,
            buyer_addr : user.addr,
			m_redirect_url: ''
        }, async function (rsp) {
            if (rsp.success) { //결제 성공시
                console.log(rsp.buyer_tel);
				console.log(rsp.buyer_addr);
				const data = {
					orderCode: rsp.merchant_uid,
					payMethod: rsp.pay_method,
					cardBank: rsp.pg_provider,
					cardNumber: rsp.pg_tid,
					orderPrice: rsp.paid_amount,
					address: rsp.buyer_addr,
					complete: 0,
					id: rsp.buyer_name,
					email: rsp.buyer_email
				};
				
				$.ajax({
					url: '/payments/',
					type: 'post',
					data: JSON.stringify(data),
					contentType: 'application/json; charset=utf-8',
					success: function(data) {
						console.log(data);
						$('.modal').modal('show');
					}
				});
            } else if (rsp.success == false) { // 결제 실패시
                alert(rsp.error_msg)
            }
        });
    } else {
        return false;
    }
}