const cartService = (function(){
	function add(cart, callback, error) {
		$.ajax({
			type: 'post',
			url: '/order/new',
			data: JSON.stringify(order),
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
	
	function getCart(param, callback, error) {
		const page = param.page || 1;
		
		$.getJSON('/order/' + page + '.json', function(data) {
			if (callback) {
				callback(data);	
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error(err);
			}
		});
	}
	
	function remove(order, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/order/' + order.cartNo,
			data: JSON.stringify(order),
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
	
	function update(order, callback, error) {
		$.ajax({
			type: 'put',
			url: '/order/' + order.cartNo,
			data: JSON.stringify(order),
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
		getCart: getCart,
		remove: remove,
		update: update
	};
})();