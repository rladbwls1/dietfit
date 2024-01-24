function addWishList(product){
	$.ajax({
		url:'/member/addWishList',
		type:'post',
		data:{product:product},
		success:function(a){
			window.open("wishConfirm","관심목록에 추가하기", "width = 400, height = 200, top = 100, left = 200, location = no");
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

function deleteSelectedItems() {
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
				data:{products:selectedItems.join(",")},
				success:function(a){
					window.location.reload();
				}
			});
        }
    }else{
    	if (confirm("상품을 선택해주세요.")) {
    		return false;
    	}
    }
    
    return false;
}
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
function changeFolder(products){
    const checkboxes2 = document.getElementsByName("folder2");
    const selectedItems2 = [];
    checkboxes2.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems2.push(checkbox.value);
        }
    });
    console.log(""+selectedItems2.join(","));
    //폴더 변경하고 
    $.ajax({
    	url:'wishFolderChangePro',
    	type:'post',
    	data:{checkedFolder:selectedItems2.join(","), products:products},
    	success:function(a){
    	
    	}
    });
    
    
}
