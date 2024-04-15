/**
 * @author kss
 * @description 장바구니 비동기
 *
 */

const cartService = (function(){
	function add(basket, callback, error) {
		$.ajax({
			type: 'post',
			url: '/cart/new',
			data: JSON.stringify(cart),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, err) {
				console.log(err);
				if (error) {
					error(err);
				}
			}
		});
	}
	
	function getList(param, callback, error) {
		const page = param.page || 1;
		
		$.getJSON('/cart/' + page + '.json', function(data) {
			if (callback) {
				callback(data);	
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error(err);
			}
		});
	}
	
	function remove(cart, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/cart/' + cart.cartNo,
			data: JSON.stringify(cart),
			contentType: 'application/json; charset=utf-8',
			success: function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error: function(err) {
				if (error) {
					error(err);
				}
			}
		});
	}
	
	function update(cart, callback, error) {
		$.ajax({
			type: 'put',
			url: '/cart/' + cart.cartNo,
			data: JSON.stringify(cart),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(error) {
				if (error) {
					error(err);
				}
			}
		});
	}
	
	return {
		add: add,
		getList: getList,
		remove: remove,
		update: update
	};
})();