function good(reviewnum){
	var id=$('#id').val();
	if(id==""){
		alert("로그인 후 이용하세요.");
	}else{
		
		$.ajax({
			url:'/review/Good',
			type:'post',
			data:{reviewnum:reviewnum,id:id},
			async:false,
			success:function(a){
				$('#review_'+reviewnum).attr("src","/resources/img/free-icon-love-4397571.png");
				$('#event_'+reviewnum).attr("onclick","bye('"+reviewnum+"')");
				var a=parseInt($('#recommend_'+reviewnum).text())+1;
				$('#recommend_'+reviewnum).text(a);
				console.log("good");
			}
		});
	
	}
}
function bye(reviewnum){
	var id=$('#id').val();
	$.ajax({
		url:'/review/Bye',
		type:'post',
		data:{reviewnum:reviewnum,id:id},
		async:false,
		success:function(a){
			$('#event_'+reviewnum).attr("onclick","good('"+reviewnum+"')");
			$('#review_'+reviewnum).attr("src","/resources/img/free-icon-love-7476962.png");
			var a=parseInt($('#recommend_'+reviewnum).text())-1;
			$('#recommend_'+reviewnum).text(a);
			console.log("bye");
		}
	});
}
function deleteReview(reviewnum){
	
	$.ajax({
		url:'/review/delete',
		type:'post',
		data:{reviewnum:reviewnum},
		async:false,
		success:function(a){
			$('#review_'+reviewnum).hide();
		}
	});

	
	
	
}
window.onload = function() {
    var writerFullNameElements = document.querySelectorAll(".writerFullName");
    writerFullNameElements.forEach(function(writerFullNameElement) {
        var writerFullName = writerFullNameElement.textContent;
        if (writerFullName.length > 3) {
            var maskedName = writerFullName.substring(0, 3) + '*'.repeat(writerFullName.length - 3);
            writerFullNameElement.textContent = maskedName;
        }
    });
};

