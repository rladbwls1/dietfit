function asd(){
	if(!$('#nicaddr').val()){
		alert("배송지 별명을 입력하세요.");
		return false;
	}
	if(!$('#receiver').val()){
		alert("받는 분 성함을 입력하세요.");
		return false;
	}
	if(!$('#phone').val()){
		alert("전화번호를 입력하세요.");
		return false;
	}
	if(!$('#sample6_postcode').val()){
		alert("우편번호를 입력하세요.");
		return false;
	}
	if(!$('#sample6_address').val()){
		alert("주소를 입력하세요.");
		return false;
	}
	if(!$('#sample6_detailAddress').val()){
		alert("상세주소를 입력하세요.");
		return false;
	}
}

function deleteDelivery(nicaddr){
	$.ajax({
		url:'deleteDelivery',
		type:'post',
		async:false,
		data:{nicaddr:nicaddr},
		success:function(a){
			window.location.reload();
		}
	});
}
function checkNicaddr(){
	if(!$('#nicaddr:checked').val()){
		alert('배송지를 선택해주세요.');
		return false;
	}
}

//------------------------------------------------myOrder
function toOderDetail(orderid,memberid){
	let f=document.createElement('form');
	let obj;
	let obj2;
	obj=document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','orderid');
	obj.setAttribute('value',orderid);
	obj2=document.createElement('input');
	obj2.setAttribute('type','hidden');
	obj2.setAttribute('name','id');
	obj2.setAttribute('value',memberid);
	f.appendChild(obj);
	f.appendChild(obj2);
	f.setAttribute('method','post');
	f.setAttribute('action','/member/myOrderDetail');
	document.body.appendChild(f);
	f.submit();
}
function toChatByOrderdateil(product,companyid){
	let f=document.createElement('form');
	let obj;
	let obdj2;
	obj=document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','product');
	obj.setAttribute('value',product);
	obj2=document.createElement('input');
	obj2.setAttribute('type','hidden');
	obj2.setAttribute('name','companyid');
	obj2.setAttribute('value',companyid);
	f.appendChild(obj);
	f.appendChild(obj2);
	f.setAttribute('method','post');
	f.setAttribute('action','/sellerchat/chat');
	document.body.appendChild(f);
	f.submit();
}
function toReviewForm(productid){
	var companyid=productid.substring(0,2);
	var category=productid.substring(2,4);
	var category2=productid.substring(4,6);
	var flavor=productid.substring(6,8);
	let f=document.createElement('form');
	let obj;
	let obdj2;
	let obdj3;
	let obdj4;
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
	f.setAttribute('action','/review/write');
	document.body.appendChild(f);
	f.submit();
}
function defintePurchase(orderid,productid,price){
	//orderdetail에서 구매확정 9로 변경, 적립금 적립 그리고 ~ 구매확정으로 바꿔주기 
	$.ajax({
		url:'defintePurchase',
		type:'post',
		async:false,
		data:{orderid:orderid, productid:productid,price:price},
		success:function(a){
			$('#'+orderid+productid+'afterClick').text("구매 확정");
		}
	});
	
	
}
