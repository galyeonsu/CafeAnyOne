/**
 * 2023.10.19
 */

// 상단 메뉴
$(function() {
	var regex = new RegExp("(.*?)\(.exe|sh|bat|js|jsp|sql)$")
	var maxSize = 2 * 1024 * 1024;
	
	function checkExtension(fileName, fileSize) {
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다");
			return false;
		}
		return true;
	}
	
	function showUploadedFile(arr) {
		var str = "";
		var thumbStr = "";
		for(var i in arr) {
			str += `<li class="list-group-item"><a href="/download\${arr[i].url}"><i class="far fa-file"></i> \${arr[i].origin}</a>
					<span data-uuid="\${arr[i].uuid}" data-url="\${arr[i].url}" class="float-right"><i class="fas fa-times-circle"></i></span></li>`;
			if(arr[i].image) {
				thumbStr += `<li class="mt-2 col-sm-6 col-lg-4 text-center"><a href="/download\${arr[i].url}"><img src='/display\${arr[i].thumb}' class="img-fluid"></a>
					<span data-uuid="\${arr[i].uuid}" data-url="\${arr[i].url}"><i class="fas fa-times-circle"></i></span></li>`;
			}
		}
		$(".uploadResult ul").append(str);
		$(".thumbResult ul").append(thumbStr);
	}
	// 이미지 원본보기
	$(".thumbResult ul").on("click", "a", function() {
		event.preventDefault();
		console.log(this);
	})
	
	// x 버튼 클릭 시 이벤트 부여
	$(".upload-wrapper").on("click", "span", function() {
		console.log($(this).data("uuid"));
		var uuid = $(this).data("uuid");
		var url = $(this).data("url");
		var $this = $(this);
		$.post("/deleteFile" + url).done(function(result) {
			$this.closest(".upload-wrapper").find("span").each(function() {
				if(uuid == $(this).data("uuid")) {
					$(this).closest("li").remove();
				}
			})
		})
	});
	
	
	//$("#uploadBtn").click(function() {
		
	var uploadProcess = function() {
		event.preventDefault();
		var formData = new FormData();
		var inputFile = $("#files");
		var files = inputFile.get(0).files;
		
		console.log(files);
		
		var filesSize = 0;
		for(var i = 0 ; i < files.length ; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("files", files[i]);
			filesSize += files[i].size;
		}
		
		// 파일당 크기 2MB 이하, 전체 10MB
		if(filesSize > 10 * 1024 * 1024) {
			alert("전체 업로드할 파일의 합계는 10MB 이하로 지정하세요");
			return false;
		}
		
		$.ajax({
			url : '/uploadAjax',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				inputFile.val("");
				showUploadedFile(result);
			}
		}); 
		
	}
	
	$("#files").change(uploadProcess);
})
