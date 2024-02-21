function addWishList(product){
	$.ajax({
		url:'/member/addWishList',
		type:'post',
		data:{product:product},
		success:function(a){
			window.open("/member/wishConfirm","관심목록에 추가하기", "width = 400, height = 200, top = 100, left = 200, location = no");
			window.location.reload();
		}
	});
	
}
function removeWishList(product){
	$.ajax({
		url:'/member/removeWishList',
		type:'post',
		data:{product:product},
		success:function(a){
			window.location.reload();
		}
	});
	
}
function gotologin(){
	if(confirm("로그인 후 이용가능합니다. \n로그인 하시겠습니까?")==true){
		window.location.href="/member/customLogin";
	}
}

function toDetail(companyid,category,category2,flavor){
	let f=document.createElement('form');
	let obj;
	obj=document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','companyid');
	obj.setAttribute('value',companyid);
	obj2=document.createElement('input');
	obj2.setAttribute('type','hidden');
	obj2.setAttribute('name','category');
	obj2.setAttribute('value',category);
	obj3=document.createElement('input');
	obj3.setAttribute('type','hidden');
	obj3.setAttribute('name','category2');
	obj3.setAttribute('value',category2);
	obj4=document.createElement('input');
	obj4.setAttribute('type','hidden');
	obj4.setAttribute('name','flavor');
	obj4.setAttribute('value',flavor);
	f.appendChild(obj);
	f.appendChild(obj2);
	f.appendChild(obj3);
	f.appendChild(obj4);
	f.setAttribute('method','post');
	f.setAttribute('action','/member/productDetail');
	document.body.appendChild(f);
	f.submit();
	
}

function getProductCodeANDtoDetail(product){
	$.ajax({
		url:'getProductCode',
		type:'post',
		async:false,
		data:{product:product},
		success:function(dto){
			toDetail(dto.companyid,dto.category,dto.category2,dto.flavor);
		}
		
	});
}

//
function checkAll() {
    const chkAll = document.getElementById("chk_all");
    const checkboxes = document.getElementsByName("num");

    checkboxes.forEach((checkbox) => {
        checkbox.checked = chkAll.checked;
    });
}
function updateCheckAll() {
    const chkAll = document.getElementById("chk_all");
    const checkboxes = document.getElementsByName("num");
    let allChecked = true;

    checkboxes.forEach((checkbox) => {
        if (!checkbox.checked) {
            allChecked = false;
        }
    });

    chkAll.checked = allChecked;
}

function deleteSelectedItems(checkedFolder) {
    const checkboxes = document.getElementsByName("num");
    const selectedItems = [];

    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems.push(checkbox.value);
        }
    });

    if (selectedItems.length > 0) {
        if (confirm("선택한 관심상품을 삭제하시겠습니까?")) {
    		$.ajax({
				url:'removeWishList2',
				type:'post',
				async:false,
				data:{products:selectedItems.join(","), checkedFolder:checkedFolder},
				success:function(a){
					window.location.reload();
				}
			});
        }
    }else{
    	if (confirm("상품을 선택해주세요.")) {
    	}
    }
}
function cartSelectedItems(){
    const checkboxes = document.getElementsByName("num");
    const selectedItems = [];

    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems.push(checkbox.value);
        }
    });
    if (selectedItems.length > 0) {
		$.ajax({
			url:'addCartMore',
			type:'post',
			async:false,
			data:{products:selectedItems.join(",")},
			success:function(a){
				if(confirm('장바구니에 추가 되었습니다.')){
					window.location.reload();
				}else{
					window.location.reload();
				}
			}
		});
    }else{
    	if (confirm("상품을 선택해주세요.")) {
    	}
    }
    
    	
}
//선택한 상품들을 어떤 폴더로 옮길지 새 창 띄움
function moveSelectedItems(Folder){
    const checkboxes = document.getElementsByName("num");
    const selectedItems = [];

    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems.push(checkbox.value);
        }
    });
    if (selectedItems.length > 0) {
    	window.open("wishFolderChange?checkedFolder="+Folder+"&products="+selectedItems.join(","),"찜 폴더 변경하기", "width = 400, height = 200, top = 100, left = 200, location = no")
    }else{
    	if (confirm("상품을 선택해주세요.")) {	return false;	}
    }
    return false;
}
//찜에서 폴더 선택
function chooseFolder(folder){
	let f=document.createElement('form');
	let obj;
	obj=document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','checkedFolder');
	obj.setAttribute('value',folder);
	f.appendChild(obj);
	f.setAttribute('method','post');
	f.setAttribute('action','/member/wishList');
	document.body.appendChild(f);
	f.submit();
}
//선택한 관심상품 폴더 변경
function changeFolder(products){
    const checkboxes2 = document.getElementsByName("folder2");
    const selectedItems2 = [];
    checkboxes2.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems2.push(checkbox.value);
        }
    });
    
    if(selectedItems2.join(",")==""){
	    $.ajax({
	    	url:'wishFolderChangePro',
	    	type:'post',
	    	async:false,
	    	data:{checkedFolder:'분류없음', products:products},
	    	success:function(a){
	    		window.opener.location.reload();
	    		window.close()
	    	}
	    });
    }else{
	    $.ajax({
	    	url:'wishFolderChangePro',
	    	type:'post',
	    	async:false,
	    	data:{checkedFolder:selectedItems2.join(","), products:products},
	    	success:function(a){
	    		window.opener.location.reload();
	    		window.close()
	    	}
	    });
    }

}
//새 폴더 이름 적을 칸 노출
function showNewFolder(){
	$('#newFolderTr').css('visibility','visible');
}
//선택한 관심상품 새 폴더로 옮기기
function changeNewFolder(products){
	var newFolder=$('#newFolder').val();
	if (newFolder==null){
		alert("새 폴더명을 적으세요.");
		return false;
	}else{
	    $.ajax({
    	url:'wishFolderChangePro',
    	type:'post',
    	async:false,
    	data:{checkedFolder:newFolder, products:products},
    	success:function(a){
    		window.opener.location.reload();
    		window.close()
    		}
    	});
	}
}

//-----------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@장바구니
function openCart(num){
	window.open("/member/miniCart?num="+num,"장바구니에 추가하기", "width = 600, height = 800, top = 100, left = 200, location = no");
}
//장바구니 버튼 눌러서, 상품 고르면 개수 변경할 수 있게.
function showQuantityDiv(){
	$('#quantity').val(1);
	$('#amout').text($('#price').val()*$('#quantity').val());
}
function quantityUp(){
	var num=parseInt($('#quantity').val());
	$('#quantity').val(num+1);
	$('#quantity').text($('#quantity').val());
	$('#amout').text($('#price').val()*$('#quantity').val());
	
}
function quantityDown(){
	var num=parseInt($('#quantity').val());
	if(num>1){
		$('#quantity').val(num-1);
		$('#quantity').text(num-1);
		$('#amout').text($('#price').val()*$('#quantity').val());
	}
}
function quatityChange(){
	$('#amout').text($('#price').val()*$('#quantity').val());
}
function addCartFromList(){
	 var chk = $('#chk').is(':checked') ? 1 : 0;
	if(!$('#quantity').val()||parseInt($('#quantity').val())==0){
		alert("개수를 입력해주세요.");
	}else{
	    $.ajax({
    	url:'addCartOne',
    	type:'post',
    	async:false,
    	data:{product:$('#chooseProductCart').val(), quantity:parseInt($('#quantity').val()),price:$('#price').val(), chk:chk},
    	success:function(a){
    		window.opener.location.reload();
    		if(confirm("장바구니에 성공적으로 추가하였습니다. 장바구니로 가겠습니까?")){
    			window.opener.location.href="cartList";
    			window.close();
    		}else{
    			window.close();
    		}
		}
    	});
	}
}
function cartQuantityDown(num){
	 var quantity=$('#'+num+'_quantity').text();
	 if(quantity>1){
		 $.ajax({
	    	url:'updateCartQuantity',
	    	type:'post',
	    	async:false,
	    	dataType:"json",
	    	data:{num:num, quantity:quantity-1},
	    	success:function(js){
	    		$('#'+num+'_quantity').text(js.quantity);
    			$('#'+num+'_price').text(js.price*js.quantity);
	    	}
	 	});   	
 	}
 	updateAmount();
 	updateTotalQuantity();
 	
}
function cartQuantityUp(num){
	var quantity=$('#'+num+'_quantity').text();
	$.ajax({
    	url:'updateCartQuantity',
    	type:'post',
    	async:false,
    	data:{num:num, quantity:parseInt(quantity)+1},
    	dataType:"json",
    	success:function(js){
    		$('#'+num+'_quantity').text(js.quantity);
    		$('#'+num+'_price').text(js.price*js.quantity);
    	}
 	}); 
 	updateAmount();
 	updateTotalQuantity();
}
function deleteCart(num){
	$.ajax({
    	url:'deleteCart',
    	type:'post',
    	async:false,
    	data:{num:num},
    	success:function(a){
    		$('#'+num).hide();								//상품 숨김
    		$('#'+num).find('#num').prop('checked', false);	//체크 풀음
    		$('#'+num+'_price').text('0');	//가격 0으로 
    	}
 	}); 
 	
 	updateAmount(); 
 	updateTotalQuantity();
}
function cartCheckAll() {
    const chkAll = document.getElementById("chk_all");
    const checkboxes = document.getElementsByName("num");

    checkboxes.forEach((checkbox) => {
        checkbox.checked = chkAll.checked;
    });
    
	updateAmount(); 
	updateTotalQuantity(); 
}
function cartUpdateCheckAll() {
    const chkAll = document.getElementById("chk_all");
    const checkboxes = document.getElementsByName("num");
    let allChecked = true;

    checkboxes.forEach((checkbox) => {
        if (!checkbox.checked) {
            allChecked = false;
        }else{
        	
        }
    });
    chkAll.checked = allChecked;

	updateAmount();
	updateTotalQuantity();
}

function updateTotalQuantity(){
	//총가격 수정하는 부분
	const checkboxes = document.getElementsByName("num");
    var result=0;
    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	result+=parseInt($('#'+checkbox.value+'_quantity').text());
        }
    });
	$('#totalQuantity').text(result);
}

function updateAmount(){
	//총가격 수정하는 부분
	const checkboxes = document.getElementsByName("num");
    var result=0;
    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	result+=parseInt($('#'+checkbox.value+'_price').text());
        }
    });
	$('#amout').text(result);
}
function toOrder(){
    const checkboxes = document.getElementsByName("num");
    const selectedItems = [];

    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems.push(checkbox.value);
        }
    });
    if (selectedItems.length > 0) {
		let f=document.createElement('form');
		let obj;
		obj=document.createElement('input');
		obj.setAttribute('type','hidden');
		obj.setAttribute('name','nums');
		obj.setAttribute('value',selectedItems.join(","));
		f.appendChild(obj);
		obj2=document.createElement('input');
		obj2.setAttribute('type','hidden');
		obj2.setAttribute('name','amout');
		obj2.setAttribute('value',$('#amout').text());
		f.appendChild(obj2);
		obj3=document.createElement('input');
		obj3.setAttribute('type','hidden');
		obj3.setAttribute('name','totalQuantity');
		obj3.setAttribute('value',$('#totalQuantity').text());
		f.appendChild(obj3);
		obj4=document.createElement('input');
		obj4.setAttribute('type','hidden');
		obj4.setAttribute('name','delivery');
		obj4.setAttribute('value',$('#delivery').val());
		f.appendChild(obj4);
		f.setAttribute('method','post');
		f.setAttribute('action','/dietfit/order');
		document.body.appendChild(f);
		f.submit();
    }else{
    	if (confirm("상품을 선택해주세요.")) {
    	}
    }
}

function Rdelivery(check){
    const checkboxes = document.getElementsByName("num");
    const selectedItems = [];

    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems.push(checkbox.value);
        }
    });
    if (selectedItems.length > 0) {
		let f=document.createElement('form');
		let obj;
		obj=document.createElement('input');
		obj.setAttribute('type','hidden');
		obj.setAttribute('name','nums');
		obj.setAttribute('value',selectedItems.join(","));
		f.appendChild(obj);
		obj2=document.createElement('input');
		obj2.setAttribute('type','hidden');
		obj2.setAttribute('name','check');
		obj2.setAttribute('value', check);
		f.appendChild(obj2);
		f.setAttribute('method','post');
		f.setAttribute('action','/member/RdCart');
		document.body.appendChild(f);
		f.submit();
    }else{
    	if (confirm("상품을 선택해주세요.")) {
    	}
    }
}

function addCartAndOrder(){
	 var chk = $('#chk').is(':checked') ? 1 : 0;
	if(!$('#quantity').val()||parseInt($('#quantity').val())==0){
		alert("개수를 입력해주세요.");
	}else{
	    $.ajax({
    	url:'addCartAndOrder',
    	type:'post',
    	async:false,
    	data:{product:$('#chooseProductCart').val(), quantity:parseInt($('#quantity').val()),price:$('#price').val(), chk:chk},
    	success:function(dto){
    		let f=window.opener.document.createElement('form');
			let obj;
			let obj2;
			let obj3;
			let obj4;
			let obj5;
			obj=window.opener.document.createElement('input');
			obj.setAttribute('type','hidden');
			obj.setAttribute('name','nums');
			obj.setAttribute('value',dto.num);
			obj2=window.opener.document.createElement('input');
			obj2.setAttribute('type','hidden');
			obj2.setAttribute('name','amout');
			obj2.setAttribute('value',dto.quantity*dto.price);
			obj3=window.opener.document.createElement('input');
			obj3.setAttribute('type','hidden');
			obj3.setAttribute('name','totalQuantity');
			obj3.setAttribute('value',dto.quantity);
			obj4=window.opener.document.createElement('input');
			obj4.setAttribute('type','hidden');
			obj4.setAttribute('name','product');
			obj4.setAttribute('value',dto.product);
			obj5=window.opener.document.createElement('input');
			obj5.setAttribute('type','hidden');
			obj5.setAttribute('name','delivery');
			obj5.setAttribute('value',dto.delivery);
			f.appendChild(obj);
			f.appendChild(obj2);
			f.appendChild(obj3);
			f.appendChild(obj4);
			f.appendChild(obj5);
			f.setAttribute('method','post');
			f.setAttribute('action','/dietfit/order');
			window.opener.document.body.appendChild(f);
			f.submit();
			window.close();
		}
    	});
	}
}

