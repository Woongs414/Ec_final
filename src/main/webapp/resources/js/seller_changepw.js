
/*콜백 함수*/

function changepwd(frm) {
var error = document.querySelectorAll('.error_next_box');
const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
var count = 0;
	var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(seller_pw.value === "") {
        error[0].innerHTML = "비밀번호를 입력해주세요.";
        error[0].style.display = "block";
        count++;
    } else if(!pwPattern.test(seller_pw.value)) {
        error[0].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        error[0].style.display = "block";
        count++;
    } else {
        error[0].style.display = "none";
        
    }
    
    if(confirm_pw.value === seller_pw.value && confirm_pw.value != "") {
        error[1].style.display = "none";
    } else if(confirm_pw.value !== seller_pw.value) {
        error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[1].style.display = "block";
        count++;
    } 

    if(confirm_pw.value === "") {
        error[1].innerHTML = "비밀번호를 입력해주세요.";
        error[1].style.display = "block";
        count++;
    }
    
    if (count >=1) {
         return false;
   	} else {
   	    frm.method="post";
   	    frm.action = ctx + "/changepwd.do";
   	    frm.submit();
   	}
    
    
}




