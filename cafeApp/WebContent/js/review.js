/**
 * @author kss
 * @description 리뷰 비동기
 *
 */

const reviewService = (function(){
	function add(review, callback, error) {
		$.ajax({
			type: 'post',
			url: '/review/new',
			data: JSON.stringify(review),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					console.log(result);
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
		const proNo = param.proNo;
		const page = param.page || 1;
		
		$.getJSON('/review/list/' + proNo + '/' + page + '.json', function(data) {
			if (callback) {
				callback(data.reviewCnt, data.list);	
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error(err);
			}
		});
	}
	
	function remove(rvNo, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/review/' + rvNo,
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
	
	return {
		add: add,
		getList: getList,
		remove: remove
	};
})();